report 50104 MatrixItemRpt
{
    ApplicationArea = All;
    Caption = 'MatrixItemRpt';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts\MatrixItemReport.rdl';
    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(ItemName; itemnm)
            {

            }
            column(CompanyPicture; CompanyInfoRec.Picture)
            {

            }


            trigger OnAfterGetRecord()
            begin
                IF (ItemRec.Get("Item No.")) then
                    itemnm := ItemRec.Description;
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

    trigger OnPreReport()
    begin
        IF CompanyInfoRec.GET THEN
            CompanyInfoRec.CalcFields(CompanyInfoRec.Picture);

    end;

    var
        itemnm: Text;
        ItemRec: Record Item;
        CompanyInfoRec: Record "Company Information";
}
