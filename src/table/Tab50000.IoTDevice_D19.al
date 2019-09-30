table 50000 "IoT Device_D19"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ","Temperature","Requisition";
            DataClassification = CustomerContent;
        }
        field(4; "MAC Addres"; Code[50])
        {
            Caption = 'MAC Address';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }

}