page 50104 "Sales Lines Nw"
{
    Caption = 'Sales Lines Nw';
    PageType = List;
    SourceTable = "sales line Nw";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer name"; Rec."Customer name")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(UOM; Rec.UOM)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the Unit of Measure';
                }
                field("Qty."; Rec."Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty. field.';
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("GST %"; Rec."GST %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GST % field.';
                }
                field("GST Amount"; Rec."GST Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the GST Amount field.';
                }
                field("Total Amount with GST"; Rec."Total Amount with GST")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount with GST field.';
                }
            }
        }
    }
}
