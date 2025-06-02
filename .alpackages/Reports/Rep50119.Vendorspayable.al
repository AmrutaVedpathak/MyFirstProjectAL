report 50119 "Vendors payable"
{
    //vendor payment due for >180 days
    ApplicationArea = All;
    Caption = 'Vendors payable';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Vendorpayable.rdl';
    dataset
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {


            column(VendorNo; "Vendor No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(Amount; Amount)
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            trigger OnPreDataItem()
            begin
                VendorLedgerEntry.SetFilter(VendorLedgerEntry.Open, '%1', true);
                VendorLedgerEntry.SetFilter(VendorLedgerEntry."Document Type", '%1', VendorLedgerEntry."Document Type"::Invoice);
                if ((StartDate = 0D) or (EndDate = 0D)) then
                    Error('Enter Start Date or End date');
            end;

            trigger OnAfterGetRecord()
            begin
                if ((EndDate - "Posting Date")) < 180 then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Enter Date Range:")
                {
                    field("Enter Strat Date"; StartDate)
                    {
                        ApplicationArea = all;
                    }
                    field("Enter End Date"; EndDate)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }

    }
    var
        StartDate: Date;
        EndDate: Date;
}
