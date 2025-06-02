page 50112 "Student Admission Document"
{
    Caption = 'Student Admission Document';
    PageType = Document;
    SourceTable = Student_Header;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Student_No."; Rec."Student_No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student_No. field.';
                    ShowMandatory = true;
                }
                field(Student_Name; Rec.Student_Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student_Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Mobile_No; Rec.Mobile_No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mobile_No field.';
                }
                field("Admission date"; Rec."Admission date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admission date field.';
                }
                field("Fee Per Month"; Rec."Fee Per Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Per Month field.';
                    BlankZero = true;
                    ShowMandatory = true;
                }
                field("Total fee Per Year"; Rec."Total fee Per Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total fee Per Year field.';
                }
                field("Total fee Paid"; Rec."Total fee Paid")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total fee Paid field.';

                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';

                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Class field.';
                    BlankZero = true;
                    ShowMandatory = true;
                }
            }
            part(Lines; "Student Admission Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
                Editable = Rec."No." <> '';
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SaveRecords)
            {
                ApplicationArea = All;
                Image = Process;
                trigger OnAction()
                begin
                    RecStudLin.Reset();
                    RecStudLin.SetRange(RecStudLin."Document No.", Rec."No.");
                    if RecStudLin.FindFirst() then begin
                        repeat
                            RecStudLin.SaveRecord := true;
                            RecStudLin.Modify();
                        until RecStudLin.Next() = 0;
                        Message('Records for Document %1 saved successfully..', Rec."No.");
                    end;
                end;

            }

        }
    }
    var
        RecStudLin: Record Student_Lines;

}
