tableextension 50000 "Purchase Header_D19" extends "Purchase Header" //38
{
    fields
    {
        field(50000; "Order Type_D19"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Requisition";
            Caption = 'Order Type';
        }
    }
}