page 50126 CalculationCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Calculation;

    layout
    {
        area(Content)
        {
            group("Enter Numbers")
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("First No."; Rec."First No.")
                {

                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        case Rec.CalculationType of
                            Rec.CalculationType::Addition:
                                Rec.Result := Rec."First No." + rec."Second No.";
                            Rec.CalculationType::Substration:
                                Rec.Result := Rec."First No." - rec."Second No.";
                            Rec.CalculationType::Multiplication:
                                Rec.Result := Rec."First No." * rec."Second No.";
                            Rec.CalculationType::Division:
                                Rec.Result := Rec."First No." / rec."Second No.";

                        end;
                    end;
                }
                field("Second No."; Rec."Second No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        case Rec.CalculationType of
                            Rec.CalculationType::Addition:
                                Rec.Result := Rec."First No." + rec."Second No.";
                            Rec.CalculationType::Substration:
                                Rec.Result := Rec."First No." - rec."Second No.";
                            Rec.CalculationType::Multiplication:
                                Rec.Result := Rec."First No." * rec."Second No.";
                            Rec.CalculationType::Division:
                                Rec.Result := Rec."First No." / rec."Second No.";

                        end;
                    end;

                }

            }
            group(Calculations)
            {
                field("Calculation Type"; Rec.CalculationType)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        case Rec.CalculationType of
                            Rec.CalculationType::Addition:
                                Rec.Result := Rec."First No." + rec."Second No.";
                            Rec.CalculationType::Substration:
                                Rec.Result := Rec."First No." - rec."Second No.";
                            Rec.CalculationType::Multiplication:
                                Rec.Result := Rec."First No." * rec."Second No.";
                            Rec.CalculationType::Division:
                                Rec.Result := Rec."First No." / rec."Second No.";

                        end;

                    end;
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created By"; Rec.CreatedBy)
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
                    Caption = 'Total Invoice';
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