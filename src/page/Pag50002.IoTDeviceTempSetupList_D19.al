page 50002 "IoT Device Temp Setup List_D19"
{
    PageType = Worksheet;
    SourceTable = "IoT Device Tempe. Setup_D19";
    Caption = 'IoT Device Temperature Setup List';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Device ID"; "Device ID")
                {
                    ApplicationArea = All;
                }
                field("Device Name"; "Device Name")
                {
                    ApplicationArea = All;
                }
                field("Log Data to Azure Storage"; "Log Data to Azure Storage")
                {
                    ApplicationArea = All;
                }
                field("Log Data to Business Central"; "Log Data to Business Central")
                {
                    ApplicationArea = All;
                }
                field("Min Temperature"; "Min Temperature")
                {
                    ApplicationArea = All;
                    Caption = 'Lower Limit';
                }
                field("Max Temperature"; "Max Temperature")
                {
                    ApplicationArea = All;
                    Caption = 'Upper Limit';
                }
                field("Alert Raised"; "Alert Raised")
                {
                    ApplicationArea = All;
                    Caption = 'Alert Raised';
                }
            }
        }
    }

}