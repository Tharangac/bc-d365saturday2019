codeunit 50000 "IoT Device Tempe Subs._D19"
{
    [EventSubscriber(ObjectType::Table, 50001, 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterCustomerModifyEvent(Rec: Record "IoT Device Tempe. Setup_D19")
    var
        JsonBuffer: Record "JSON Buffer" temporary;
        IoTDevice: Record "IoT Device_D19";
        EventGridHandler: Codeunit "Event Grid Handler_D19";
        JSONHelper: Codeunit "JSON Helper_D19";
        JsonBody: Text;
    begin

        IoTDevice.Reset();
        if IoTDevice.Get(Rec."Device ID") then begin
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'macAddress', IoTDevice."MAC Addres");
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'deviceName', IoTDevice."Name");
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'maxTemp', Format(Rec."Max Temperature"));
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'minTemp', Format(Rec."Min Temperature"));
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'logDataToAzureStorage', Format(Rec."Log Data to Azure Storage"));
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'logDataToBusinessCentral', Format(Rec."Log Data to Business Central"));
            JSONHelper.AddValueJSONBuffer(JsonBuffer, 'alertRaised', Format(Rec."Alert Raised"));

            JsonBody := JSONHelper.GetJsonBodyForAzureEventGrid('EventID', 'IoTDeviceSettingsUpdate', 'IoTDeviceTemperatureSettingsUpdate', CurrentDateTime(), '1.0', JsonBuffer);

            EventGridHandler.PostToEventTopic(JsonBody);
        end;
    end;
}