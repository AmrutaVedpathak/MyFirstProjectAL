pageextension 50108 ILEExten extends "Item Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Sales Amount (Actual)")
        {

            field("Purchase Amount (Actual)"; Rec."Purchase Amount (Actual)")
            {

                ApplicationArea = All;
            }
        }
    }


}