page 50003 "Iot Device Req. Setup List_D19"
{
    PageType = Worksheet;
    SourceTable = "IoT Device Req. Setup_D19";
    Caption = 'Iot Device Requisition Setup List';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Device ID"; "Device ID")
                {
                    ApplicationArea = All;
                }
                field("Device Name"; "Device Name")
                {
                    ApplicationArea = All;
                }
                field("Item No"; "Item No")
                {
                    ApplicationArea = All;
                }
                field(Location; Location)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}