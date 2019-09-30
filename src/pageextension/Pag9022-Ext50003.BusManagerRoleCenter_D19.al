pageextension 50003 "Bus. Manager Role Center_D19" extends "Business Manager Role Center" //9022
{
    layout
    {

    }

    actions
    {

        addafter("Chart of Accounts")
        {
            action("IoT Device_D19")
            {
                ApplicationArea = all;
                Caption = 'IoT Device';
                RunObject = page "IoT Device List_D19";
                Image = AdministrationSalesPurchases;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
            }

        }
    }
}