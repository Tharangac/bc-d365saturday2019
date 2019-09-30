pageextension 50001 "Purchase Orders_D19" extends "Purchase Order List" //9307
{
    layout
    {
        addbefore("No.")
        {
            field("Order Type_D19"; "Order Type_D19")
            {
                ApplicationArea = All;
                Caption = 'Order Type';
            }
        }
    }
}