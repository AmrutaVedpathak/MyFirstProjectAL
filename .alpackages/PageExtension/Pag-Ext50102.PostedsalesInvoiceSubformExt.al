pageextension 50112 PostedsalesInvoiceSubformExt extends "Posted Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(Comment1; Rec.Comment1)
            {
                ApplicationArea = All;
            }
        }
    }
}
