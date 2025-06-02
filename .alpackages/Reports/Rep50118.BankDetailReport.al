report 50118 BankDetailReport
{
    ApplicationArea = All;
    Caption = 'BankDetailReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/bankdetail.rdl';
    dataset
    {
        dataitem(BankAccount; "Bank Account")
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(BankBranchNo; "Bank Branch No.")
            {
            }
            column(RecCompanyInfo_Name; RecCompanyInfo.Name)
            {

            }
            column(RecCompanyInfo_pic; RecCompanyInfo.Picture)
            {

            }
            column(Title; Title)
            {

            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Bank Account No." = field("No.");
                column(Posting_Date; "Posting Date")
                {

                }
                column(Document_Type; "Document Type")
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Amount; Amount)
                {

                }

            }
            trigger OnPreDataItem()
            begin
                if RecCompanyInfo.get() then
                    RecCompanyInfo.CalcFields(RecCompanyInfo.Picture);
            end;
        }

    }
    var
        RecCompanyInfo: Record "Company Information";
        Title: Label 'Bank Account Details report';

}
