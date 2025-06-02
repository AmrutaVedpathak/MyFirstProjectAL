page 50102 "Sales Line Part"
{
    Caption = 'Sales Line Part';
    PageType = ListPart;
    SourceTable = "Sales Line Nw";
    //AutoSplitKey is used to set "Line No." field which is PK with "Document No.".It automatically increment Line no to each row
    AutoSplitKey = true;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type"::Order)
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
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                    ShowMandatory = true;
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Unit of Measure';
                }
                field("Qty."; Rec."Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty. field.';
                    //**To show Qty. field mandatory use "BlankZero=true" and ShowMandatory = true;
                    //As it is decimal field it assigns zero value by default so * sign not show with only ShowMandatory = true;
                    BlankZero = true;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        CalculateTotal();
                    end;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    BlankZero = true;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        CalculateTotal();
                    end;
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
            group(Totals)
            {
                field("Total Amount Excl. Tax"; SalesLineNwRec.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CalculateTotal();
    end;



    procedure CalculateTotal()
    begin
        SalesLineNwRec.Reset();
        SalesLineNwRec.SetRange(SalesLineNwRec."Document Type", Rec."Document Type");
        SalesLineNwRec.SetRange(SalesLineNwRec."Document No.", Rec."Document No.");
        SalesLineNwRec.CalcSums(Amount);
        CurrPage.Update();
    end;

    var
        SalesLineNwRec: Record "Sales Line Nw";

}
