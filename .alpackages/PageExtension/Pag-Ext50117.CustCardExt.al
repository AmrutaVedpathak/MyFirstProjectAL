pageextension 50117 CustCardExt extends "Customer Card"
{

    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }

    }
    trigger OnOpenPage()
    begin
        // Message('Customer Card Extension');
    end;

}
