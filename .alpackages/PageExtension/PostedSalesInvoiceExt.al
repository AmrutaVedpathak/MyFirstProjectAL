pageextension 50109 postedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
            }
        }
    }

}
