pageextension 50110 "Sales Order Extension" extends "Sales Order"
{
    layout
    {

        addlast(General)
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;

            }
        }

    }
    actions
    {
        addlast("F&unctions")
        {
            action(Run)
            {
                ApplicationArea = All;
                Image = MoveDown;
                trigger OnAction()
                begin

                    SalesLineRec.Reset();
                    SalesLineRec.SetRange(SalesLineRec."Document No.", Rec."No.");
                    IF SalesLineRec.FindFirst() then
                        repeat
                            //Message(Format(SalesLineRec.Quantity));
                            SalesLineRec."Qty. to Ship" := SalesLineRec.Quantity;
                            SalesLineRec.Modify();
                        until SalesLineRec.Next = 0;
                end;
            }
        }
    }

    var
        SalesLineRec: Record "Sales Line";

}