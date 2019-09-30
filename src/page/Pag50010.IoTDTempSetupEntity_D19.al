page 50010 "IoT D. Temp. Setup Entity_D19"
{
    PageType = API;
    SourceTable = "IoT Device Tempe. Setup_D19";
    APIPublisher = 'theta';
    APIGroup = 'mvp';
    APIVersion = 'beta';
    EntityName = 'temperatureSetupEntry';
    EntitySetName = 'temperatureSetupEntries';
    DelayedInsert = true;
    Caption = 'IoTDeviceTemperatureSetupEntity';
    ODataKeyFields = "Device ID";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(deviceID; "Device ID")
                {
                    Caption = 'deviceID';
                    ApplicationArea = All;
                }
                field(deviceName; "Device Name")
                {
                    Caption = 'deviceName';
                    ApplicationArea = All;
                }
                field(maxTemperature; "Max Temperature")
                {
                    Caption = 'maxTemperature';
                    ApplicationArea = All;
                }
                field(minTemperature; "Min Temperature")
                {
                    Caption = 'minTemperature';
                    ApplicationArea = All;
                }
                field(logDatatoAzureStorage; "Log Data to Azure Storage")
                {
                    Caption = 'logDatatoAzureStorage';
                    ApplicationArea = All;
                }
                field(logDatatoBusinessCentral; "Log Data to Business Central")
                {
                    Caption = 'logDatatoBusinessCentral';
                    ApplicationArea = All;
                }
                field(alertRaised; "Alert Raised")
                {
                    Caption = 'alertRaised';
                    ApplicationArea = All;
                }
            }
        }
    }

}