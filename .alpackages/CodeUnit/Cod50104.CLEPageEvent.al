codeunit 50104 CLE_PageEvent
{
    TableNo = "Cust. Ledger Entry";

    trigger OnRun()
    begin

    end;

    //If you Dont want to execute System default code set IsHandled := true; for particular procedure
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnBeforeSetStyle', '', true, true)]
    local procedure DontExeOnBeforeSetStyle(sender: Record "Cust. Ledger Entry"; var IsHandled: Boolean; var Style: Text)
    begin
        IsHandled := true;
    end;



}
