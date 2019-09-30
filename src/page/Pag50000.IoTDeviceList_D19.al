page 50000 "IoT Device List_D19"
{
    PageType = List;
    SourceTable = "IoT Device_D19";
    Caption = 'IoT Devices';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "IoT Device_D19";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; "ID")
                {
                    ApplicationArea = All;
                    ColumnSpan = 80;
                }
                field("Device Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("MAC Addres"; "MAC Addres")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {

            group(Setup)
            {
                Caption = 'Setup';
                action("Temperature Setup")
                {
                    ApplicationArea = All;
                    Image = AdjustEntries;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    Caption = 'Temperature Setup';
                    RunObject = page "IoT Device Temp Setup List_D19";
                }

                action("Requisition Setup")
                {
                    ApplicationArea = All;
                    Image = AdministrationSalesPurchases;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    Caption = 'Requisition Setup';
                    RunObject = page "Iot Device Req. Setup List_D19";
                }
            }
            action("Temperature Entries")
            {
                ApplicationArea = All;
                Image = Entries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Caption = 'Temperature Entries';
                trigger OnAction()
                var
                    TemperatureEntries: Record "Temperature Entries_D19";
                begin
                    TemperatureEntries.Reset();
                    TemperatureEntries.SetRange("Device ID", ID);
                    if TemperatureEntries.FindSet() then
                        Page.RunModal(Page::"Temperature Entries_D19", TemperatureEntries);
                end;
            }
        }
    }
}