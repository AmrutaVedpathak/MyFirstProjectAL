codeunit 50106 "Integration Event"
{
    TableNo = EmployeeTable;

    trigger OnRun()
    begin

    end;

    [IntegrationEvent(true, false)]
    procedure CheckAddLen(var Address: Text[50])
    begin
    end;

}
