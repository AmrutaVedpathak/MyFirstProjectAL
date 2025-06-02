pageextension 50120 "Purcahase&payablePageExt" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field(PurchReqi; Rec.PurchReqi)
            {
                Caption = 'Purchase Requisition Nos.';
                ApplicationArea = All;
            }
        }
    }
}
