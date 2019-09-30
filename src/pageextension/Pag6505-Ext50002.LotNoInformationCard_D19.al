pageextension 50002 "Lot No. Information Card_D19" extends "Lot No. Information Card" //6505
{
    layout
    {
        addbefore(Blocked)
        {
            field("Device ID_D19"; "Device ID_D19")
            {
                ApplicationArea = all;
                Caption = 'Device ID';
            }
        }
    }

    actions
    {


    }
}