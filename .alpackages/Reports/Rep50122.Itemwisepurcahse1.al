report 50122 "Item wise purcahse1"
{
    ApplicationArea = All;
    Caption = 'Item wise purcahse1';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/item wise purchase1.rdl';
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Purchqty; Purchqty)
            {

            }
            column(PurchAmt; PurchAmt)
            {

            }
            trigger OnAfterGetRecord()
            begin
                PurchAmt := 0;
                Purchqty := 0;
                ILERec.Reset();
                ILERec.SetFilter(ILERec."Item No.", '%1', Item."No.");
                ILERec.SetFilter(ILERec."Entry Type", '%1', ILERec."Entry Type"::Purchase);

                if (ItemCode <> '') then
                    ILERec.SetFilter(ILERec."Item No.", '%1', ItemCode);
                if (locationCode <> '') then
                    ILERec.SetFilter(ILERec."Location Code", '%1', locationCode);

                if ((StartDate <> 0D) and (EndDate <> 0D)) then
                    ILERec.SetRange(ILERec."Posting Date", StartDate, EndDate);
                if ILERec.FindFirst() then
                    repeat
                        Purchqty := Purchqty + ILERec.Quantity;
                        ILERec.CalcFields(ILERec."Purchase Amount (Actual)");
                        PurchAmt := PurchAmt + ILERec."Purchase Amount (Actual)";
                    until ILERec.Next() = 0;

                if (Purchqty = 0) then
                    CurrReport.Skip();
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(CustomFilters)
                {
                    field("Enter Item No."; ItemCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                    field("Enter Sart Date"; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Enter End Date"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                    field("Enter location"; locationCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Location;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        StartDate: Date;
        EndDate: Date;
        ItemCode: Code[20];
        locationCode: code[10];
        ILERec: Record "Item Ledger Entry";
        Purchqty: Integer;
        PurchAmt: Decimal;

}
