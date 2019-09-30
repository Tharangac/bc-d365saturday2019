codeunit 50001 "Handle Requisition_D19"
{
    trigger OnRun()
    begin

    end;

    procedure HandleRequisition(MACAddress: Code[50]; Authorizer: Code[50])
    var
        DeviceID: Code[20];
        VendorNo: Code[20];
        PONo: Code[20];
    begin
        DeviceID := GetDeviceID(MACAddress);
        GetDeviceReqSetup(DeviceID);
        GetItem(DeviceReqSetup."Item No");
        VendorNo := GetVendorNo();
        PONo := GetOpenPurchaseOrdersForVendor(VendorNo);
        if PONo <> '' then
            AddOrderLines(PONo, Item."No.", DeviceReqSetup.Location)
        else
            CreatePurchOrderForVendorAndAddLines(VendorNo, Item."No.", DeviceReqSetup.Location);
    end;

    local procedure GetDeviceID(MACAddress: Code[50]): Code[20]
    var
        IoTDevice: Record "IoT Device_D19";
    begin
        IoTDevice.Reset();
        IoTDevice.SetRange("MAC Addres", MACAddress);
        if IoTDevice.FindFirst() then
            exit(IoTDevice.ID)
        else
            Error(StrSubstNo('Device not found for MAC Address %1', MACAddress));
    end;

    local procedure GetDeviceReqSetup(DeviceID: Code[20])
    begin
        DeviceReqSetup.Reset();
        DeviceReqSetup.SetRange("Device ID", DeviceID);
        if DeviceReqSetup.FindFirst() then;
    end;

    local procedure GetItem(ItemNo: Code[20])
    begin
        Item.Get(ItemNo);
    end;

    local procedure GetVendorNo(): Code[20]
    begin
        exit(Item."Vendor No.");
    end;

    local procedure GetMinOrderQty(): Decimal
    begin
        exit(Item."Minimum Order Quantity");
    end;

    local procedure GetAuthorizer(Authorizer: Code[50])
    begin


    end;

    local procedure GetOpenPurchaseOrdersForVendor(VendorNo: Code[20]): Code[20]
    var
        PurchOrder: Record "Purchase Header";
    begin
        PurchOrder.Reset();
        PurchOrder.SetRange("Order Type_D19", PurchOrder."Order Type_D19"::Requisition);
        PurchOrder.SetRange("Buy-from Vendor No.", VendorNo);
        PurchOrder.SetRange(Status, PurchOrder.Status::Open);
        if PurchOrder.FindFirst() then
            exit(PurchOrder."No.");
    end;

    local procedure CreatePurchOrderForVendorAndAddLines(VendorNo: code[20]; ItemNo: Code[20]; LocationCode: Code[20])
    var
        PurchOrder: Record "Purchase Header";
        PurchNRPaySetup: Record "Purchases & Payables Setup";
        NoSerMgt: Codeunit NoSeriesManagement;
    begin
        PurchNRPaySetup.Get();
        PurchOrder.Init();
        PurchOrder.Validate("Document Type", PurchOrder."Document Type"::Order);
        PurchOrder.Validate("No.", NoSerMgt.GetNextNo(PurchNRPaySetup."Order Nos.", Today(), true));
        PurchOrder.Validate("Posting Date", Today());
        PurchOrder.Validate("Buy-from Vendor No.", VendorNo);
        PurchOrder.Validate("Order Type_D19", PurchOrder."Order Type_D19"::Requisition);
        PurchOrder.Insert();

        AddOrderLines(PurchOrder."No.", ItemNo, LocationCode);
    end;

    local procedure AddOrderLines(PurchOrderNo: Code[20]; ItemNo: Code[20]; LocationCode: Code[20])
    var
        PurchOrderLine: Record "Purchase Line";
    begin
        PurchOrderLine.Reset();
        PurchOrderLine.SetRange("Document Type", PurchOrderLine."Document Type"::Order);
        PurchOrderLine.SetRange("Document No.", PurchOrderNo);
        PurchOrderLine.SetRange(Type, PurchOrderLine.Type::Item);
        PurchOrderLine.SetRange("No.", ItemNo);
        PurchOrderLine.SetRange("Location Code", LocationCode);
        if PurchOrderLine.FindFirst() then begin
            PurchOrderLine.Validate(Quantity, (PurchOrderLine.Quantity + QtyToOrder(PurchOrderLine.Quantity)));
            PurchOrderLine.Modify();
        end else begin
            PurchOrderLine.Init();
            PurchOrderLine.Validate("Document Type", PurchOrderLine."Document Type"::Order);
            PurchOrderLine.Validate("Document No.", PurchOrderNo);
            PurchOrderLine.Validate("Line No.", GetNextLineNo(PurchOrderNo));
            PurchOrderLine.Validate(Type, PurchOrderLine.Type::Item);
            PurchOrderLine.Validate("No.", ItemNo);
            PurchOrderLine.Validate("Location Code", LocationCode);
            PurchOrderLine.Validate(Quantity, QtyToOrder(PurchOrderLine.Quantity));
            PurchOrderLine.Insert();
        end;
    end;

    local procedure QtyToOrder(QtyOnPO: Decimal): Decimal
    begin
        if QtyOnPO >= Item."Maximum Order Quantity" then
            exit(0)
        else
            if (QtyOnPO + item."Minimum Order Quantity") <= Item."Maximum Order Quantity" then
                exit(Item."Minimum Order Quantity")
            else
                exit(Item."Maximum Order Quantity" - QtyOnPO);
    end;

    local procedure GetNextLineNo(PurchOrderNo: Code[20]): Integer
    var
        PurchOrderLine: Record "Purchase Line";
    begin
        PurchOrderLine.Reset();
        PurchOrderLine.SetRange("Document Type", PurchOrderLine."Document Type"::Order);
        PurchOrderLine.SetRange("Document No.", PurchOrderNo);
        if PurchOrderLine.FindLast() then
            exit(PurchOrderLine."Line No." + 10000)
        else
            exit(10000);

    end;

    var
        Item: Record Item;
        DeviceReqSetup: Record "IoT Device Req. Setup_D19";

}