page 50113 StudentLinesList
{
    ApplicationArea = All;
    Caption = 'StudentLinesList';
    PageType = List;
    SourceTable = Student_Lines;
    UsageCategory = Lists;

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
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Student No"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No field.';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Class field.';
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
                }
                field("Fixed Amount Per Month"; Rec."Fixed Amount Per Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fixed Amount Per Month field.';
                }
            }
        }
    }
}
