report 50102 MyBankList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/MyBankList.rdl';

    dataset
    {
        dataitem("BankAccount"; "Bank Account")
        {
            column("BankNo"; "No.")
            {

            }
            column("BankName"; "Name") { }
            column("Balance__LCY_"; "Balance (LCY)") { }
            column(companyinfo_Pic; companyinfo.Picture) { }
            column(companyinfo_nm; companyinfo.Name) { }
            column(ReportTitle; ReportTitle)
            {

            }

        }
    }

    trigger OnPreReport()
    begin
        If companyinfo.Get() then
            companyinfo.CalcFields(Picture);
    end;



    var

        companyinfo: Record "Company Information";
        ReportTitle: Label 'Bank Lists';

}