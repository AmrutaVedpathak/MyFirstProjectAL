page 50125 CalculationList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Calculation;
    CardPageId = CalculationCard;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("First No."; Rec."First No.")
                {
                    ApplicationArea = All;

                }
                field("Second No."; Rec."Second No.")
                {
                    ApplicationArea = All;

                }
                field("Calculation Type"; Rec.CalculationType)
                {

                    ApplicationArea = All;
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = All;

                }
                field(CreatedBy; Rec.CreatedBy)
                {
                    ApplicationArea = All;

                }
                field(CreationDate; Rec.CreationDate)
                {
                    ApplicationArea = All;

                }
                field(Customer_No; Rec.Customer_No)
                {
                    ApplicationArea = All;
                }
                field(Customer_Name; Rec.Customer_Name)
                {
                    ApplicationArea = All;
                }
                field(Customer_Balance; Rec.Customer_Balance)
                {
                    ApplicationArea = All;
                }
                field("Total Invoices"; Rec.Customer_Invoice_Count)
                {
                    ApplicationArea = All;
                    Caption = 'Total Invoices';

                }
                field(Cust_CreditMemo_Extists; Rec.Cust_CreditMemo_Extists)
                {
                    ApplicationArea = All;
                    
                    Caption = 'Credit Memo Extist';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}