page 50111 "Student Admission Subform"
{
    Caption = 'Student Admission Subform';
    PageType = ListPart;
    SourceTable = Student_Lines;
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Editable = false;
                }
                field("Student No"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No field.';
                    Editable = false;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Class field.';
                    Editable = false;
                }
                field("Payment Month"; Rec."Payment Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Month field.';
                }
                field("Payment Received"; Rec."Payment Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Received field.';
                }
                field("Balance "; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance  field.';
                    Editable = false;
                }
                field("Fixed Amount Per Month"; Rec."Fixed Amount Per Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Amount Per Month field.';
                    Editable = false;
                }

            }

        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        RecStuHr.Reset();
        RecStuHr.SetRange(RecStuHr."No.", Rec."Document No.");
        if RecStuHr.FindFirst() then begin
            Rec."Student No" := RecStuHr."Student_No.";
            rec.Class := RecStuHr.Class;
            Rec."Fixed Amount Per Month" := RecStuHr."Fee Per Month";
        end;

        Rec.GetMonth();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // Message('insert');
    end;

    var
        RecStuHr: Record Student_Header;
}
