report 50135 CustomerBalance
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Customerbalance.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            column(CustomerNo; "No.")
            {

            }
            column(CustomerName; Name)
            {

            }
            column(OpenBalance; OpenBalance)
            {

            }
            column(Netchange; Netchange)
            {

            }
            column(closeBalance; closeBalance)
            {

            }
            trigger OnPreDataItem()
            begin
                if ((StartDate = 0D) OR (EndDate = 0D)) then
                    Error('Enter StartDate and EndDate');
            end;

            trigger OnAfterGetRecord()
            begin
                CustLedEnt.Reset();
                CustLedEnt1.Reset();
                OpenBalance := 0;
                Netchange := 0;
                closeBalance := 0;



                CustLedEnt.SetRange(CustLedEnt."Customer No.", "No.");
                CustLedEnt.SetFilter(CustLedEnt."Posting Date", '<%1', StartDate);

                if CustLedEnt.FindFirst() then begin

                    repeat
                        CustLedEnt.CalcFields(Amount);
                        OpenBalance := OpenBalance + CustLedEnt.Amount;
                    until CustLedEnt.Next() = 0;

                end;

                CustLedEnt1.SetFilter(CustLedEnt1."Customer No.", '%1', "No.");
                CustLedEnt1.SetRange(CustLedEnt1."Posting Date", StartDate, EndDate);

                if CustLedEnt1.FindFirst() then begin
                    repeat
                        CustLedEnt1.CalcFields(Amount);
                        Netchange := Netchange + CustLedEnt1.Amount;
                    until CustLedEnt1.Next() = 0;
                end;
                closeBalance := OpenBalance + Netchange;

            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field("Enter Start Date:"; StartDate)
                    {
                        ApplicationArea = All;

                    }
                    field("Enter Close Date:"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }


    }



    var
        myInt: Integer;
        StartDate: Date;
        EndDate: Date;
        CustLedEnt: Record "Cust. Ledger Entry";
        CustLedEnt1: Record "Cust. Ledger Entry";
        OpenBalance: Decimal;
        Netchange: Decimal;
        closeBalance: Decimal;

}