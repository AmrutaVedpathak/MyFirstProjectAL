pageextension 50130 CustledgerEntryPageExt extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(Cust_Name; Rec.Cust_Name)
            {
                ApplicationArea = All;
                Caption = 'Customer Name';

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        StyleTxt := Rec.SetStyle_Test();
    end;

}
