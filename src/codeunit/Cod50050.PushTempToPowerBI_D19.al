codeunit 50050 "Push Temp. To PowerBI_D19"
{
    // this is for testing only.(Run as a JQ)
    TableNo = "Job Queue Entry";

    trigger OnRun()
    begin
        if "Parameter String" = '' then
            Error('Parameter String Must have device ID');

        CreateRandomTemp("Parameter String");
        CreateRandomTemp('D00001');
    end;

    procedure CreateRandomTemp(DeviceID: Text[20])
    var
        CurrentTempInt: Integer;
        CurrentTempDec: Decimal;
        JsonBody: Text;
    begin

        CurrentTempInt := Abs(Random(99));
        CurrentTempDec := 20 + (CurrentTempInt / 100);

        JsonBody := '[{' + '"DeviceID"' + ':' + '"' + DeviceID + '",' + '"CurrentTime"' + ':' + '"' + format(FormatDateTime()) + '",' + '"Temperature"' + ':' + '"' + format(CurrentTempDec) + '"}]';
        PostToPowerBI(JsonBody);
    end;

    procedure PostToPowerBI(JsonBody: Text)
    var
        httpClient: HttpClient;
        httpContent: HttpContent;
        httpResponse: HttpResponseMessage;
        httpHeader: HttpHeaders;
        PowerBIPath: Text;
    begin

        PowerBIPath := 'https://api.powerbi.com/beta/c2d70e79-12e2-4104-b73e-187655aeb9d6/datasets/1b9f103a-89dc-40d6-9f4d-f129aef05865/rows?key=Ye%2F4xuYkK7Urk1t8rE46fyXHymkLgnNSfX6bG4dilN%2FGeyxhQpJhQBxWLcNYx49A7qE7R4f1GH27X8U0Z%2FzRkQ%3D%3D';
        httpContent.WriteFrom(JsonBody);
        httpContent.GetHeaders(httpHeader);
        httpHeader.Remove('Content-Type');
        httpHeader.Add('Content-Type', 'application/json');
        httpClient.Post(PowerBIPath, httpContent, httpResponse);

        IF httpResponse.HttpStatusCode() = 401 THEN
            ERROR('Not autorized');

    end;

    procedure FormatDateTime(): Text
    var
        Date1: DateTime;
        TimeStamp: Text;
    begin
        Date1 := CurrentDateTime();
        TimeStamp := FORMAT(Date1, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24>:<Minutes,2>:<Seconds,2>');
        exit(TimeStamp);
    end;
}