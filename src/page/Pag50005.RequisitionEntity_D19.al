page 50005 "Requisition Entity_D19"
{
    PageType = API;
    SourceTable = "Requisition Buffer_D19";
    APIPublisher = 'theta';
    APIGroup = 'mvp';
    APIVersion = 'beta';
    EntityName = 'requisition';
    EntitySetName = 'requisitions';
    DelayedInsert = true;
    Caption = 'Requisition Entity';
    ODataKeyFields = "MAC Address";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(macAddress; "MAC Address")
                {
                    Caption = 'macAddress';
                    ApplicationArea = All;
                }
                field(authorizer; Authorizer)
                {
                    Caption = 'authorizer';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        HandleReq: Codeunit "Handle Requisition_D19";
    begin
        HandleReq.HandleRequisition("MAC Address", Authorizer);
    end;

}