report 50121 CustLedgerRportExcel
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Excel;
    ExcelLayout = 'Layouts/CustLedeger.xlsx';

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            column(Customer_No_; "Customer No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Amount; Amount)
            {

            }
            column(Debit_Amount; "Debit Amount")
            {

            }
            column(Credit_Amount; "Credit Amount")
            {

            }
            trigger OnPreDataItem()
            begin
                IF StartDate <> 0D then
                    SetRange("Posting Date", StartDate, EndDate);
                if CustCode <> '' then
                    SetRange("Customer No.", CustCode);
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("Enter Start Date"; StartDate)
                    {
                        ApplicationArea = All;

                    }
                    field("Enter Closing Date"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Select Customer"; CustCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Customer;
                    }

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var

        StartDate: Date;
        EndDate: Date;
        CustCode: code[10];


}