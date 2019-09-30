pageextension 50000 "Purchase Order_D19" extends "Purchase Order" //50
{
    layout
    {
        addafter(Status)
        {
            field("Order Type_D19"; "Order Type_D19")
            {
                ApplicationArea = All;
                Caption = 'Order Type';
            }
        }
    }
}