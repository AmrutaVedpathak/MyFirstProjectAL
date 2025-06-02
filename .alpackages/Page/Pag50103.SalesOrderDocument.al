page 50103 "Sales Order Document"
{
    Caption = 'Sales Order Document';
    PageType = Document;
    SourceTable = "Sales header Nw";

    layout
    {
        area(content)
        {
            group(General)
            {
                //Set Document Type ="order" on opening this page
                field("Doument Type"; Rec."Doument Type"::Order)
                {

                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    //**Number Seires code
                    AssistEdit = true;
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit();
                        CurrPage.Update();
                    end;
                    //**Number Series
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ShowMandatory = true;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Payment Term Code"; Rec."Payment Term Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Term field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }

            }
            part(Lines; "Sales Line Part")
            {
                ApplicationArea = All;
                Enabled = Rec."No." <> '';
                SubPageLink = "Document No." = field("No.");
            }

        }


    }
    //Insert Document Type=Order 
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        BelowxRec := true;
        Rec."Doument Type" := Rec."Doument Type"::Order;
    end;

}
