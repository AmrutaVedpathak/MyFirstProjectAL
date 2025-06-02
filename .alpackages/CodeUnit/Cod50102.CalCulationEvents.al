codeunit 50102 CalCulationEvents
{
    TableNo = Calculation;
    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnBeforeInsertEvent', '', true, true)]
    local procedure CalculationOnBeforeInsert(var Rec: Record Calculation; RunTrigger: Boolean)
    begin
        Rec.CreatedBy := USERID;
        Rec.CreationDate := Today;

    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnAfterInsertEvent', '', true, true)]
    local procedure CalCulationOnAfterInsert(RunTrigger: Boolean; var Rec: Record Calculation)
    begin
        Message('Record inserted with No=%1', rec."Entry No.");

    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnBeforeModifyEvent', '', true, true)]
    local procedure CalculationOnBeforeModify(RunTrigger: Boolean; var Rec: Record Calculation; var xRec: Record Calculation)
    begin
        Message('OnBeforeModify CalculationType was:%1', xRec.CalculationType);
    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnAfterModifyEvent', '', true, true)]
    local procedure CalculationOnAfterModify(RunTrigger: Boolean; var Rec: Record Calculation; var xRec: Record Calculation)
    begin
        Message('AfterModifyRecord ..Calculation Type is %1', rec.CalculationType);
    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure CalculationOnBeforeDelete(var Rec: Record Calculation; RunTrigger: Boolean)
    begin
        if Rec.Customer_Balance <> 0 then begin
            Error('You Cant delete this record');
            exit;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnAfterDeleteEvent', '', true, true)]
    local procedure CalculationOnAfterDelete(RunTrigger: Boolean; var Rec: Record Calculation)
    begin
        Message('You deleted record no %1', Rec."Entry No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnBeforeValidateEvent', 'CalculationType', true, true)]
    local procedure calculationOnBeforeValidate(CurrFieldNo: Integer; var Rec: Record Calculation; var xRec: Record Calculation)
    begin
        if (Rec."First No." = 0) then begin
            Error('Enter first no.');
            exit;
        end;
        if (Rec."Second No." = 0) then begin
            Error('Enter second No.');
            exit;
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::Calculation, 'OnBeforeValidateEvent', 'Customer_No', true, true)]
    local procedure MyProcedure(CurrFieldNo: Integer; var Rec: Record Calculation; var xRec: Record Calculation)
    begin
        RecCust.Reset();
        RecCust.SetRange(RecCust."No.", Rec.Customer_No);
        if RecCust.FindFirst() then
            rec.Customer_Name := RecCust.Name;
    end;

    trigger OnRun()
    begin

    end;

    var
        RecCust: Record Customer;

}
