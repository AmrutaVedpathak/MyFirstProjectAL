query 50100 "Top 5 Customers"
{

    Caption = 'Top 5 Customers';
    QueryType = Normal;
    QueryCategory = 'Customer List';
    TopNumberOfRows = 5;
    OrderBy = descending(Sales__LCY_);


    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
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
            column(Sales__LCY_; "Sales (LCY)")
            {
                Method = Sum;
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;

}
