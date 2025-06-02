report 50120 "Use of SetData GetData"
{
    ApplicationArea = All;
    Caption = 'Use of SetData GetData';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SetDataGetData.rdl';
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "No.", "Bill-to Customer No.";
            column(DocumentType; "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(BilltoName; "Bill-to Name")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount; Amount)
                {

                }
            }
        }
    }

}
