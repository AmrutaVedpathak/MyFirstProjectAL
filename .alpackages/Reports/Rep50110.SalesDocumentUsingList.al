report 50110 SalesDocument_UsingList
{
    ApplicationArea = All;
    Caption = 'SalesDocument_UsingList';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/SalesDocument.rdl';
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("Document Type", "No.");
            PrintOnlyIfDetail = true;
            column(DocumentType;
            "Document Type")
            {
            }
            column(No; "No.")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(ShipmentDate; "Shipment Date")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(SelltoAddress; "Sell-to Address")
            {
            }
            column(SelltoCity; "Sell-to City")
            {
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemTableView = where("Document Line No." = const(0));
                DataItemLink = "Document Type" = field("Document Type"), "No." = field("No.");
                column(Comment; Comment)
                {

                }


            }
            dataitem(SalesLine; "Sales Line")
            {

                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(Line_No_; "Line No.")
                {

                }
                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount_Line; Amount)
                {

                }
                dataitem("Sales Comment Line1"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "No." = field("Document No."), "Document Line No." = field("Line No.");
                    column(Comment_Line; Comment)
                    {

                    }
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
