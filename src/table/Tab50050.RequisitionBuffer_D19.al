table 50050 "Requisition Buffer_D19"
{
    DataClassification = CustomerContent;
    Caption = 'Requisition Buffer';

    fields
    {
        field(1; "MAC Address"; Code[50])
        {
            Caption = 'MAC Address';
            DataClassification = CustomerContent;
        }

        field(2; Authorizer; Code[50])
        {
            Caption = 'Authorizer';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "MAC Address")
        {
            Clustered = true;
        }
    }

}