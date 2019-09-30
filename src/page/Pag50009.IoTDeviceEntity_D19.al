page 50009 "IoT Device Entity_D19"
{

    PageType = API;
    SourceTable = "IoT Device_D19";
    APIPublisher = 'theta';
    APIGroup = 'mvp';
    APIVersion = 'beta';
    EntityName = 'iotDevice';
    EntitySetName = 'iotDevices';
    DelayedInsert = true;
    Caption = 'IoTDeviceEntity';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; ID)
                {
                    Caption = 'id';
                    ApplicationArea = All;
                }
                field(name; Name)
                {
                    Caption = 'name';
                    ApplicationArea = All;
                }
                field(type; Type)
                {
                    Caption = 'type';
                    ApplicationArea = All;
                }
                field(macAddres; "MAC Addres")
                {
                    Caption = 'macAddres';
                    ApplicationArea = All;
                }
            }
        }
    }

}