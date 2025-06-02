page 50110 "Student Admission"
{
    ApplicationArea = All;
    Caption = 'Student Admission';
    PageType = List;
    SourceTable = Student_Header;
    UsageCategory = Lists;
    CardPageId = "Student Admission Document";
    layout
    {
        area(content)
        {
            repeater(General)
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
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Class field.';
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

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Class Wise Report")
            {
                ApplicationArea = all;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                trigger OnAction()
                begin
                    Report.Run(50109);
                end;
            }

        }
    }
}
