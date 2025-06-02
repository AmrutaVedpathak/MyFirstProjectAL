pageextension 50140 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(Project; Rec.Project)
            {
                ApplicationArea = All;
            }
            field("Project Location"; Rec."Project Location")
            {
                ApplicationArea = All;
            }

        }

    }




    trigger OnAfterGetRecord()

    begin
        /*
        RecPurchHr.Reset();
        RecPurchHr.SetRange(RecPurchHr."Document Type", RecPurchHr."Document Type"::Order);
        RecPurchHr.SetRange(RecPurchHr."No.", Rec."Document No.");
        if RecPurchHr.FindFirst() then begin
            Rec.Project := RecPurchHr.Project;
            Rec."Project Location" := RecPurchHr."Project Location";
        end;
        */
    end;


    var
        RecPurchHr: Record "Purchase Header";

}
