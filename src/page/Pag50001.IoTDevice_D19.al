page 50001 "IoT Device_D19"
{

    PageType = Card;
    SourceTable = "IoT Device_D19";
    Caption = 'IoT Device';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ID; "ID")
                {
                    ApplicationArea = All;
                    ColumnSpan = 80;
                }
                field(Name; "Name")
                {
                    ApplicationArea = All;
                }

                field(Type; "Type")
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
}