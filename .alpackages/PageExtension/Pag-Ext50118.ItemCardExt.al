pageextension 50118 ItemCardExt extends "Item card"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
    }
    actions
    {
        addlast(reporting)
        {
            action("Print QR Code")
            {
                Caption = 'Print QR Code';
                ApplicationArea = All;
                Promoted = true;
                Image = Print;

                trigger OnAction()
                begin
                    IF RecItem.Get(Rec."No.") then
                        Report.RunModal(50114, false, false, RecItem);
                end;


            }
        }

    }
    trigger OnClosePage()
    begin
        if Rec.Description = '' then
            Error('Item description can not be blank');
    end;

    var
        RecItem2: Record Item;
        RecItem: Record Item;
}
