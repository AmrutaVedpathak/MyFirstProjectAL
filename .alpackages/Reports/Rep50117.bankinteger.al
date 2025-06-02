report 50117 "bank-integer"
{
    ApplicationArea = All;
    Caption = 'bank-integer';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/bank-integer.rdl';
    dataset
    {
        //create 5 same copies of bank accounts
        dataitem(CopyLoop; "Integer")
        {

            DataItemTableView = sorting(Number) where(Number = filter('1..5'));
            column(Number; Number)
            {
            }
            dataitem("Bank Account"; "Bank Account")
            {

                column(No_; "Bank Account"."No.")
                {

                }
                column(Name; "Bank Account".Name)
                {

                }
                column(Net_Change; "Bank Account"."Net Change")
                {

                }


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
