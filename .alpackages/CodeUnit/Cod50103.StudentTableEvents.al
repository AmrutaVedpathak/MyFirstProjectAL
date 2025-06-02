codeunit 50103 Student_Table_Events
{
    TableNo = Student_Header;


    [EventSubscriber(ObjectType::Table, Database::Student_Header, 'OnAfterValidateEvent', 'Student_No.', true, true)]
    local procedure OnAfterValidate_Student_No(CurrFieldNo: Integer; var Rec: Record Student_Header; var xRec: Record Student_Header)
    begin
        RecStud.Reset();
        RecStud.SetRange(RecStud."No.", rec."Student_No.");
        if RecStud.FindFirst() then begin
            rec.Student_Name := RecStud.Name;
            Rec.Address := RecStud.Address;
            rec.City := RecStud.City;
            rec.Mobile_No := RecStud."Mobile No.";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Student_Header, 'OnAfterValidateEvent', 'Fee Per Month', true, true)]
    local procedure OnAfterValidate_feepermonth(CurrFieldNo: Integer; var Rec: Record Student_Header; var xRec: Record Student_Header)
    begin
        Rec."Total fee Per Year" := Rec."Fee Per Month" * 12;
    end;



    /* [EventSubscriber(ObjectType::Table, Database::Student_Lines, 'OnAfterValidateEvent', 'Payment Month', true, true)]
     local procedure OnAfterValidate_PaymentMonth(CurrFieldNo: Integer; var Rec: Record Student_Lines; var xRec: Record Student_Lines)
     begin
         RecStudhr.Reset();
         RecStudhr.SetRange(RecStudhr."No.", Rec."Document No.");
         if RecStudhr.FindFirst() then begin
             rec."Student No" := RecStudhr."Student_No.";
             Rec.Class := RecStudhr.Class;
             Rec."Fixed Amount Per Month" := RecStudhr."Fee Per Month";
         end;
     end;

    [EventSubscriber(ObjectType::Table, Database::Student_Lines, 'OnAfterValidateEvent', 'Payment Received', true, true)]
    local procedure MyProcedure1(CurrFieldNo: Integer; var Rec: Record Student_Lines; var xRec: Record Student_Lines)
    begin
        Rec."Balance " := rec."Fixed Amount Per Month" - rec."Payment Received";
    end;*/

    trigger OnRun()
    begin

    end;

    var
        RecStud: Record Student;
        RecStudhr: Record Student_Header;


}
