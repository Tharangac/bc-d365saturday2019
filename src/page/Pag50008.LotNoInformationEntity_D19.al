page 50008 "Lot No. Information Entity_D19"
{

    PageType = API;
    SourceTable = "Lot No. Information";
    APIPublisher = 'theta';
    APIGroup = 'mvp';
    APIVersion = 'beta';
    EntityName = 'lotNoInformationEntry';
    EntitySetName = 'lotNoInformationEntries';
    DelayedInsert = true;
    Caption = 'LotNoInformationEntity';
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(itemNo; "Item No.")
                {
                    Caption = 'itemNo';
                    ApplicationArea = All;
                }
                field(lotNo; "Lot No.")
                {
                    Caption = 'lotNo';
                    ApplicationArea = All;
                }
                field(deviceIDMVP; "Device ID_D19")
                {
                    Caption = 'deviceIDMVP';
                    ApplicationArea = All;
                }

                field(macAddress; "macAddress")
                {
                    Caption = 'macAddress';
                    ApplicationArea = All;
                }
                field(description; Description)
                {
                    Caption = 'description';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        GetMACAddress("Device ID_D19");
    end;


    local procedure GetMACAddress(DeviceID: Code[20])
    var
        IoTDevice: Record "IoT Device_D19";
    begin
        IoTDevice.SetRange(ID, DeviceID);
        if IoTDevice.FindFirst() then
            macAddress := IoTDevice."MAC Addres";
    end;

    var
        macAddress: Code[50];

}