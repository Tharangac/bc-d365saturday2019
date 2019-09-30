page 50007 "Temperature Entries Entity_D19"
{

    PageType = API;
    SourceTable = "Temperature Entries_D19";
    APIPublisher = 'theta';
    APIGroup = 'mvp';
    APIVersion = 'beta';
    EntityName = 'temperatureEntry';
    EntitySetName = 'temperatureEntries';
    DelayedInsert = true;
    Caption = 'TemperatureEntriesEntity';
    ODataKeyFields = "Entry No.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; "Entry No.")
                {
                    Caption = 'entryNo';
                    ApplicationArea = All;
                    Editable = false;
                }

                field(macAddress; "MAC Address")
                {
                    Caption = 'macAddress';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        IoTDevice: Record "IoT Device_D19";
                    begin
                        if "MAC Address" = '' then
                            Error('MAC Address must have a value.')

                        else begin
                            IoTDevice.SetRange("MAC Addres", "MAC Address");
                            IoTDevice.SetRange(Type, IoTDevice.Type::Temperature);
                            if not IoTDevice.FindFirst() then
                                error('Device is not available or not registered to track temperature.');

                            "Device ID" := IoTDevice.ID;
                        end;
                    end;
                }
                field(temperature; Temperature)
                {
                    Caption = 'temperature';
                    ApplicationArea = All;
                }
                field("date"; Date)
                {
                    Caption = 'date';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("time"; Time)
                {
                    Caption = 'time';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Entry No." := GetLastEntryNo() + 1;
        Date := Today();
        Time := Time();
    end;

    procedure GetLastEntryNo(): BigInteger
    var
        TempEntry: Record "Temperature Entries_D19";
    begin
        TempEntry.Reset();
        if TempEntry.FindLast() then
            exit(TempEntry."Entry No.");
        exit(0);
    end;
}