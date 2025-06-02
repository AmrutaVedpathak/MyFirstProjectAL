tableextension 50108 SalesInvoiceLineTableExt extends "Sales Invoice Line"
{
    fields
    {
        field(50101; Comment1; Text[100])
        {
            Caption = 'Comment1';
            DataClassification = ToBeClassified;
        }
    }
}
