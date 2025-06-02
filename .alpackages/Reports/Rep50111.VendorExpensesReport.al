report 50111 "Vendor Expenses Report"
{
    ApplicationArea = All;
    Caption = 'Vendor Expenses Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/VendorExpense.rdl';
    dataset
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Vendor No.";
            PrintOnlyIfDetail = true;
            DataItemTableView = sorting("Vendor No.", "Posting Date", "Currency Code");
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "Posting Date" = field("Posting Date"), "Document No." = field("Document No.");
                column(Posting_Date; "Posting Date")
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(G_L_Account_No_; "G/L Account No.")
                {

                }
                column(G_L_Account_Name; "G/L Account Name")
                {

                }
                column(Amount; Amount)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    RecGLAc.Reset();
                    IF RecGLAc.Get("G/L Entry"."G/L Account No.") then begin
                        if RecGLAc."Income/Balance" = RecGLAc."Income/Balance"::"Balance Sheet" then
                            CurrReport.Skip();
                    end;
                end;
            }
            trigger OnPreDataItem()
            begin
                if StartDate = 0D then
                    Error('Enter Start Date');
                if EndDate = 0D then
                    EndDate := WorkDate();
                //if VendorNo = '' then
                // Error('Select Vendor No.');
                // VendorLedgerEntry.SetRange(VendorLedgerEntry."Vendor No.", VendorNo);
                VendorLedgerEntry.SetRange(VendorLedgerEntry."Posting Date", StartDate, EndDate);
            end;
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

                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = all;
                    }
                    field("EndDate"; EndDate)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }

    }
    var
        VendorNo: Code[20];
        StartDate: Date;
        EndDate: Date;
        RecGLAc: Record "G/L Account";
}
