report 50114 "QR Code"
{
    ApplicationArea = All;
    Caption = 'QR Code';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/QRCode.rdl';
    dataset
    {
        dataitem(item; item)
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(UnitPrice; "Unit Price")
            {
            }
            column(QRCode; QRCode)
            {

            }
            trigger OnAfterGetRecord()
            var
                symbol: Enum "Barcode Symbology 2D";
                Provider: Interface "Barcode Font Provider 2D";
            begin

                QRCode := 'Item:' + Description + '   Unit Cost:$' + format("Unit Cost");
                Provider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                symbol := Enum::"Barcode Symbology 2D"::"QR-Code";
                QRCode := Provider.EncodeFont(QRCode, symbol);

            end;
        }

    }
    var
        QRCode: Text;
}
