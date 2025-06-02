pageextension 50114 PaymentJournalTableExtension extends "Payment Journal"
{
    layout
    {
        addlast(Control1)
        {
            field(Transaction_No; Rec.Transaction_No)
            {
                ApplicationArea = All;
            }
        }
    }
}
