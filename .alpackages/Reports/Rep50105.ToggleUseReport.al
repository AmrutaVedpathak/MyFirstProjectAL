report 50105 ToggleUseReport
{
    ApplicationArea = All;
    Caption = 'ToggleUseReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/ToggleReport.rdl';
    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            column(CustomerNo; "Customer No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(CreditAmount; "Credit Amount")
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(Amount; Amount)
            {
            }
            column(RemainingAmount; "Remaining Amount")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
