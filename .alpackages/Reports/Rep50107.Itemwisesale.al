report 50107 "Item wise sale"
{
    ApplicationArea = All;
    Caption = 'Item wise sale&Purchase';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Item wise Sale.rdl';
    dataset
    {
        dataitem(item; item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(SaleQuantity; SaleQuantity)
            {

            }
            column(SaleAmt; SaleAmt)
            {

            }
            column(PurchQuantity; PurchQuantity)
            {

            }
            column(PurchAmt; PurchAmt)
            {

            }
            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin

                ILERec.RESET;
                SaleQuantity := 0;
                SaleAmt := 0;
                PurchQuantity := 0;
                PurchAmt := 0;
                ILERec.SetRange(ILERec."Item No.", "No.");
                IF ((StartDate <> 0D) AND (EndDate <> 0D)) then
                    ILERec.SetRange(ILERec."Posting Date", StartDate, EndDate);
                //ILERec.SetRange("Entry Type", ILERec."Entry Type"::Sale);
                if LocationCode <> '' then
                    ILERec.SetRange(ILERec."Location Code", LocationCode);
                IF ILERec.FindFirst() then
                    repeat
                        //"Sales Amount(Actual)" and "Purchase Amount(Actual)" are flowfields from Table "Value Entry"
                        //Relation between ILE and Value Entry table "Entry No."(ILE) and "Item Ledger Entry No."(Value Entry)
                        ILERec.CalcFields("Sales Amount (Actual)", "Purchase Amount (Actual)");
                        IF (ILERec."Entry Type" = ILERec."Entry Type"::Sale) THEN begin
                            SaleQuantity := SaleQuantity + ILERec.Quantity;
                            SaleAmt := SaleAmt + ILERec."Sales Amount (Actual)";
                        end;
                        IF (ILERec."Entry Type" = ILERec."Entry Type"::Purchase) THEN begin
                            PurchQuantity := PurchQuantity + ILERec.Quantity;
                            PurchAmt := PurchAmt + ILERec."Purchase Amount (Actual)";
                        end;
                    until ILERec.Next = 0;

                if ((SaleAmt = 0) and (SaleQuantity = 0) and (PurchAmt = 0) and (PurchQuantity = 0)) then
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
                group(CustomFilters)
                {
                    field(EnterItemNo; ItemNo)
                    {
                        ApplicationArea = all;
                        TableRelation = Item;
                    }
                    field(EnterStartDate; StartDate)

                    {
                        ApplicationArea = All;
                    }
                    field(EnterEndtDate; EndDate)

                    {
                        ApplicationArea = All;
                    }
                    field(EnterLocation; LocationCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Location;
                    }
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
    var
        ILERec: Record "Item Ledger Entry";
        SaleAmt: Decimal;
        SaleQuantity: Integer;
        PurchQuantity: Integer;
        PurchAmt: Decimal;
        ItemNo: code[30];
        StartDate: Date;
        EndDate: Date;
        LocationCode: code[30];

}
