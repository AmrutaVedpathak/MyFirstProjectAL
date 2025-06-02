codeunit 50107 "Subscribe Event"
{
    TableNo = EmployeeTable;

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Event", 'CheckAddLen', '', true, true)]
    procedure CheckAddLen(var Address: Text[50])
    begin
        if (StrLen(Address) > 20) then
            Error('Address can contain only 20 characters');
    end;

}
