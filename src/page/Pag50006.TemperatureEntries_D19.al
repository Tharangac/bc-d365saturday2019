page 50006 "Temperature Entries_D19"
{
    PageType = List;
    SourceTable = "Temperature Entries_D19";
    Caption = 'Temperature Entries';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTableView = SORTING("Date") ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Device ID";
                "Device ID")
                {
                    ApplicationArea = All;
                }
                field("MAC Address"; "MAC Address")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Date)
                {
                    ApplicationArea = All;
                }
                field(Temperature; Temperature)
                {
                    ApplicationArea = All;
                }
                field("Time"; Time)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}