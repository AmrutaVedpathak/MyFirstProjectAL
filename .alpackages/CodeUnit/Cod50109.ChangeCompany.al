codeunit 50109 ChangeCompany
{
    trigger OnRun()
    var
        RecCust: Record Customer;
    begin
        RecCust.ChangeCompany('Demo US');
    end;
}
