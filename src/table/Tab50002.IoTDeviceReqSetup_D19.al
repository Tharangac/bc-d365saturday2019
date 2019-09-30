table 50002 "IoT Device Req. Setup_D19"
{
    DataClassification = CustomerContent;
    Caption = 'IoT Device Requisition Setup';

    fields
    {
        field(1; "Device ID"; Code[20])
        {
            Caption = 'Device ID';
            DataClassification = CustomerContent;
            TableRelation = "IoT Device_D19"."ID" where(Type = filter('Requisition'));
        }
        field(2; "Device Name"; Text[50])
        {
            Caption = 'Device Name';
            FieldClass = FlowField;
            CalcFormula = Lookup ("IoT Device_D19".Name where(ID = field("Device ID")));
        }
        field(3; Location; Code[20])
        {
            Caption = 'Location';
            TableRelation = Location."Code";
            DataClassification = CustomerContent;
        }
        field(4; "Item No"; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No.";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Device ID")
        {
            Clustered = true;
        }
    }

}