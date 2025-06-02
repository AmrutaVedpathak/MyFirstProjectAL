tableextension 50102 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(50104; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
    }
}
