pageextension 50121 PurchaseOrderPageExt extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field(SelltoCustomerNo; Rec."Sell-to Customer No.")
            {
                ApplicationArea = All;
            }
            field(Requisition_No; Rec."Requisition No")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Project; Rec.Project)
            {
                ApplicationArea = All;
            }
            field("Project Location"; Rec."Project Location")
            {
                ApplicationArea = All;
            }
        }
    }
}
