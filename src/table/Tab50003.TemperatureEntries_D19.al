table 50003 "Temperature Entries_D19"
{
    DataClassification = CustomerContent;
    Caption = 'Temperature Entries';


    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Device ID"; code[20])
        {
            Caption = 'Device ID';
            DataClassification = CustomerContent;
            TableRelation = "IoT Device_D19".ID;

            trigger OnValidate()
            var
                IoTDevice: Record "IoT Device_D19";
            begin
                IoTDevice.SetRange(ID, "Device ID");
                if IoTDevice.FindFirst() then
                    "MAC Address" := IoTDevice."MAC Addres";
            end;
        }
        field(3; "MAC Address"; Code[50])
        {
            Caption = 'MAC Address';
            DataClassification = CustomerContent;
        }

        field(4; Temperature; Decimal)
        {
            Caption = 'Temperature';
            DataClassification = CustomerContent;
        }

        field(5; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(6; "Time"; Time)
        {
            Caption = 'Time';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key("Date"; Date)
        {

        }
    }

}