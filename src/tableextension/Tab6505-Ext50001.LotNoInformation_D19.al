tableextension 50001 "Lot No. Information_D19" extends "Lot No. Information" //6505
{
    fields
    {
        field(50000; "Device ID_D19"; Code[20])
        {
            Caption = 'Device ID';
            DataClassification = CustomerContent;
            TableRelation = "IoT Device_D19"."ID" where(Type = filter('Temperature'));
        }
    }
}