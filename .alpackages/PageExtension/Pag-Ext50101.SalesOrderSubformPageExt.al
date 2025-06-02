pageextension 50111 SalesOrderSubformPageExt extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(Comments1; Rec.Comments1)
            {
                ApplicationArea = All;
            }
        }
    }
}
