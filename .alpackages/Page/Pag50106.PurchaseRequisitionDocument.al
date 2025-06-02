page 50106 "Purchase Requisition Document"
{
    Caption = 'Purchase Requisition Document';
    PageType = Document;
    SourceTable = "purchase requisition Header";

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
                field("Desired Vendor No."; Rec."Desired Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Desired Vendor No. field.';
                    ShowMandatory = true;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Requistion Date"; Rec."Requistion Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requistion Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Lines; "Purchase Requisition Subform")
            {
                ApplicationArea = All;
                Enabled = Rec."No." <> '';
                SubPageLink = "Document No." = field("No.");
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("Make PO")
            {
                ApplicationArea = All;

                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    if (Rec.Status = rec.Status::Approved) then
                        Codeunit.Run(Codeunit::PurchaseRequisitionToOrder, Rec)
                    else
                        Message('Purchase Requisition Document should be approved');

                end;


            }
        }
    }
    var
        RecPurchHeader: Record "Purchase Header";
        RecPurchReqLine: Record "Purchase Requisition Line";
        RecPurchline: Record "Purchase Line";

}
