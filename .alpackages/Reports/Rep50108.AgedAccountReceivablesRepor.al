report 50108 "Aged Account Receivables Repor"
{
    ApplicationArea = All;
    Caption = 'Aged Account Receivables Repor';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/AgedAccReceivable.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {


            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Company_Name; CompanyInfoRec.Name)
            {

            }

            dataitem(CustLedgerEntry; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");

                column(CustomerNo; "Customer No.")
                {
                }
                column(CustomerName; "Customer Name")
                {
                }
                column(Amount; Amount)
                {

                }
                column(PostingDate; "Posting Date")
                {
                }
                column(DocumentDate; "Document Date")
                {
                }
                column(EndDate; EndDate)
                {

                }
                column(NoOfDays; NoOfDays)
                {

                }

                column(Amt1; Amt[1])
                {

                }
                column(Amt2; Amt[2])
                {

                }
                column(Amt3; Amt[3])
                {

                }
                column(Amt4; Amt[4])
                {

                }
                column(Amt5; Amt[5])
                {

                }
                column(Amt6; Amt[6])
                {

                }

                trigger OnPreDataItem()
                begin
                    iF (EndDate = 0D) then
                        Error('Enter EndDate');
                    IF FilterDate = FilterDate::"Posting Date" then begin
                        CustLedgerEntry.SetRange(CustLedgerEntry."Posting Date", StartDate, EndDate);
                    end;
                    IF FilterDate = FilterDate::"Document Date" then begin
                        CustLedgerEntry.SetRange(CustLedgerEntry."Document Date", StartDate, EndDate);
                    end;
                end;

                trigger OnAfterGetRecord()
                begin
                    CustLedgerEntry.CalcFields(Amount);
                    IF FilterDate = FilterDate::"Posting Date" then begin
                        NoOfDays := EndDate - CustLedgerEntry."Posting Date";

                    end;
                    IF FilterDate = FilterDate::"Document Date" then begin
                        NoOfDays := EndDate - CustLedgerEntry."Document Date";

                    end;


                    case NoOfDays of
                        0 .. 30:
                            //Amt[1] := Amt[1] + CustLedgerEntry.Amount;
                            Amt[1] := CustLedgerEntry.Amount;
                        31 .. 60:
                            Amt[2] := Amt[2] + CustLedgerEntry.Amount;
                        61 .. 90:
                            Amt[3] := Amt[3] + CustLedgerEntry.Amount;
                        91 .. 180:
                            Amt[4] := Amt[4] + CustLedgerEntry.Amount;
                        181 .. 365:
                            Amt[5] := Amt[5] + CustLedgerEntry.Amount;
                        366 .. 9999:
                            Amt[6] := Amt[6] + CustLedgerEntry.Amount;

                    end;

                end;
            }
            trigger OnPreDataItem()
            begin
                CompanyInfoRec.Reset();
                CompanyInfoRec.get();
            end;

            trigger OnAfterGetRecord()
            begin

                Amt[1] := 0;
                Amt[2] := 0;
                Amt[3] := 0;
                Amt[4] := 0;
                Amt[5] := 0;
                Amt[6] := 0;

            end;

        }



    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filters)
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;

                    }
                    field(FilterDate; FilterDate)
                    {

                        ApplicationArea = All;

                    }
                }
            }
        }


    }
    var
        StartDate: Date;
        EndDate: date;
        FilterDate: Option "Posting Date","Document Date";
        NoOfDays: Integer;
        Amt: Array[6] of Decimal;
        CompanyInfoRec: Record "Company Information";

}
