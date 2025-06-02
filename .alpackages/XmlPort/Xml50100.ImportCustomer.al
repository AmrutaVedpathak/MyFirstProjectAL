xmlport 50100 ImportCustomer
{
    //Remove Request page tab to see import and export options

    Caption = 'ImportCustomer';
    Format = VariableText;
    // Direction = Export;
    FieldSeparator = ',';
    FieldDelimiter = '';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer; Customer)
            {
                fieldelement(No; Customer."No.")
                {
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(Address; Customer.Address)
                {
                }
            }
        }
    }

}
