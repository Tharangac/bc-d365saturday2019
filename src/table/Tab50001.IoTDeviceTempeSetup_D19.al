table 50001 "IoT Device Tempe. Setup_D19"
{
    DataClassification = CustomerContent;
    Caption = 'IoT Device Temperature Setup';

    fields
    {
        field(1; "Device ID"; Code[20])
        {
            Caption = 'Device ID';
            DataClassification = CustomerContent;
            TableRelation = "IoT Device_D19"."ID" where(Type = filter('Temperature'));
        }
        field(2; "Device Name"; Text[50])
        {
            Caption = 'Device Name';
            FieldClass = FlowField;
            CalcFormula = Lookup ("IoT Device_D19".Name where(ID = field("Device ID")));
        }
        field(3; "Max Temperature"; Decimal)
        {
            Caption = 'Max Temperature';
            DataClassification = CustomerContent;
        }
        field(4; "Min Temperature"; Decimal)
        {
            Caption = 'Min Temperature';
            DataClassification = CustomerContent;
        }
        field(5; "Log Data to Azure Storage"; Boolean)
        {
            Caption = 'Log Data to Azure Storage';
            DataClassification = CustomerContent;
        }
        field(6; "Log Data to Business Central"; Boolean)
        {
            Caption = 'Log Data to Business Central';
            DataClassification = CustomerContent;
        }

        field(7; "Alert Raised"; Boolean)
        {
            Caption = 'Alert Raised';
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