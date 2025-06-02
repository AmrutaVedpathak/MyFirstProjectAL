codeunit 50101 PurchaseRequisitionToOrder
{
    TableNo = "Purchase Requisition Header";

    trigger OnRun()
    begin
        IF Dialog.Confirm('Do you want to Convert the Requisition to an Order?') then begin
            RecPurchHeader.Init();
            RecPurchHeader."Document Type" := RecPurchHeader."Document Type"::Order;
            //Add No. series according to Order to "No." in purchase header
            RecPurchHeader.InitInsert();

            RecPurchHeader."Buy-from Vendor No." := Rec."Desired Vendor No.";
            RecPurchHeader.Validate(RecPurchHeader."Buy-from Vendor No.");

            RecPurchHeader."Buy-from Vendor Name" := Rec."Vendor Name";
            RecPurchHeader."Document Date" := Rec."Requistion Date";
            RecPurchHeader."Location Code" := Rec."Location Code";
            RecPurchHeader.Validate(RecPurchHeader."Location Code");
            RecPurchHeader."Requisition No" := Rec."No.";
            RecPurchHeader.Insert();
            RecPurchReqLine.Reset();
            RecPurchReqLine.SetRange(RecPurchReqLine."Document No.", Rec."No.");
            if RecPurchReqLine.FindFirst() then begin
                repeat
                    RecPurchline.Init();
                    RecPurchline."Document Type" := RecPurchline."Document Type"::Order;
                    RecPurchline."Document No." := RecPurchHeader."No.";
                    RecPurchline."Line No." := RecPurchReqLine."Line No.";
                    RecPurchline.Type := RecPurchline.Type::Item;
                    RecPurchline."No." := RecPurchReqLine."Item No.";
                    RecPurchline.Description := RecPurchReqLine."Item Description";
                    RecPurchline.Quantity := RecPurchReqLine.Qty;
                    RecPurchline."Direct Unit Cost" := RecPurchReqLine."Unit Cost";
                    RecPurchline."Unit of Measure Code" := RecPurchReqLine.UOM;
                    RecPurchline."Line Amount" := RecPurchReqLine.Amount;
                    RecPurchline.Insert();
                until RecPurchReqLine.Next() = 0;
                DeleteHeader(Rec);
                DeleteLine(Rec);
            end;
            If Dialog.Confirm('The requisition has been converted to Order No. %1.Do you want to open Order?', true, RecPurchHeader."No.") Then
                page.Run(Page::"Purchase Order", RecPurchHeader);
        end;
    end;

    procedure DeleteHeader(Var RecPurchReqHr: Record "Purchase Requisition Header")
    begin
        RecPuchReqHr1.Reset();
        IF RecPuchReqHr1.Get(RecPurchReqHr."No.") then
            RecPuchReqHr1.Delete();

    end;

    procedure DeleteLine(Var RecPurchReqHr: Record "Purchase Requisition Header")
    begin
        RecPurchReqLine1.Reset();
        RecPurchReqLine1.SetRange(RecPurchReqLine1."Document No.", RecPurchReqHr."No.");
        IF RecPurchReqLine1.FindFirst() then begin
            repeat
                RecPurchReqLine1.Delete();
            until RecPurchReqLine1.Next() = 0;

        end;
    end;

    var
        RecPurchHeader: Record "Purchase Header";
        RecPurchReqLine: Record "Purchase Requisition Line";
        RecPurchline: Record "Purchase Line";
        RecPuchReqHr1: Record "Purchase Requisition Header";

        RecPurchReqLine1: Record "Purchase Requisition Line";

}
