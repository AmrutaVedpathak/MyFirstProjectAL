report 50116 CustomerRunningValue
{
    ApplicationArea = All;
    Caption = 'CustomerRunningValue';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/CustRunningValue.rdl';
    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Customer No.";
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            column(Amount; Amount)
            {

            }
        }
    }

}
