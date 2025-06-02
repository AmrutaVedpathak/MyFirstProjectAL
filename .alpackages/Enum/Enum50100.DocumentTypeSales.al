enum 50100 DocumentType_Sales
{
    Extensible = true;

    value(0; "")
    {
        Caption = '';
    }
    value(1; Quote)
    {
        Caption = 'Quote';
    }
    value(2; "Order")
    {
        Caption = 'Order';
    }
    value(3; Invoice)
    {
        Caption = 'Invoice';
    }
    value(4; "Blanket Order")
    {
        Caption = 'Blanket Order';
    }
    value(5; "Credit Memo")
    {
        Caption = 'Credit Memo';
    }
    value(6; "Sales Return Order")
    {
        Caption = 'Sales Return Order';
    }
}
