page 50107 "Purchase Requisition Subform"
{
    Caption = 'Purchase Requisition Subform';
    PageType = ListPart;
    SourceTable = "purchase requisition Line";
    AutoSplitKey = true;
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ShowMandatory = true;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UOM field.';
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Qty field.';

                    trigger OnValidate()
                    begin
                        CalculateAmount();
                    end;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                    BlankZero = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Unit Cost field.';

                    trigger OnValidate()
                    begin
                        CalculateAmount();
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }

            group(Totals)
            {
                field(Total_Amount; RecPurchReqLine.Amount)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }

    }
    trigger OnAfterGetCurrRecord()
    begin

        CalculateAmount();
    end;

    procedure CalculateAmount()
    begin
        RecPurchReqLine.Reset();
        RecPurchReqLine.SetRange(RecPurchReqLine."Document No.", Rec."Document No.");
        RecPurchReqLine.CalcSums(RecPurchReqLine.Amount);
        CurrPage.Update();
    end;

    var
        Total_Amount: Decimal;
        RecPurchReqLine: Record "Purchase Requisition Line";
}
