report 50106 "Sales Ivoice -Document Report"
{
    ApplicationArea = All;
    Caption = 'Sales Ivoice -Document Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SalesIvoiceDocumentRpt.rdl';
    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";
            column(SelltoAddress; "Sell-to Address")
            {
            }
            column(SelltoAddress2; "Sell-to Address 2")
            {
            }
            column(SelltoCity; "Sell-to City")
            {
            }
            column(SelltoContact; "Sell-to Contact")
            {
            }
            column(SelltoContactNo; "Sell-to Contact No.")
            {
            }
            column(SelltoCountryRegionCode; "Sell-to Country/Region Code")
            {
            }
            column(SelltoCounty; "Sell-to County")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(SelltoCustomerName2; "Sell-to Customer Name 2")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoEMail; "Sell-to E-Mail")
            {
            }
            column(No; "No.")
            {
            }
            column(OrderNo; "Order No.")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(SelltoPhoneNo; "Sell-to Phone No.")
            {
            }
            column(Amount; Amount)
            {

            }
            column(Invoice_Discount_Amount; "Invoice Discount Amount")
            {

            }
            column(Taxamout; Taxamout)
            {

            }
            column(Comp_nm; Comp_nm)
            {

            }
            column(comp_pic; RecCompanyInfo.Picture)
            {

            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLinkReference = SalesInvoiceHeader;
                DataItemLink = "Document No." = field("No.");
                column(ItemNo; "No.")
                {

                }
                column(ItemName; Description)
                {

                }
                column(Shipment_Date; "Shipment Date")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
                column(Inv__Discount_Amount; "Inv. Discount Amount")
                {

                }
                column(Amount_Including_VAT; "Amount Including VAT")
                {

                }


            }

            trigger OnPreDataItem()
            begin
                IF RecCompanyInfo.GET then begin
                    Comp_nm := RecCompanyInfo.Name;
                    RecCompanyInfo.CalcFields(RecCompanyInfo.Picture);
                end;


            end;

            trigger OnAfterGetRecord()
            begin
                TaxRec.Reset();
                Taxamout := 0;
                TaxRec.SetRange(Taxrec."Document No.", "No.");
                IF TaxRec.FindFirst() then
                    repeat
                        Taxamout := Taxamout + TaxRec.Amount;
                    until TaxRec.next = 0;

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
    var
        TaxRec: Record "VAT Entry";

        Taxamout: Decimal;
        Comp_nm: text;
        RecCompanyInfo: Record "Company Information";
}
