codeunit 50108 "Purchase flow"
{
    TableNo = "Purchase Header";

    trigger OnRun()
    begin

    end;

    //Post PO with "Type =G/L Account" at purchase Line  .It will create seperate line in G/L Entry Table
    //Flow is as follows
    /*
    Purchase Line
      |  (table=Invoice Post.Buffer  , OnAfterInvPostBufferPreparePurchase)
    Invoice Post. Buffer 
      |  (table=Invoice Post.Buffer  , OnAfterCopyToGenJnlLine)
    Gen.Journal Line 
      |  (CU=Gen.Jnl-Post Line  , OnPostGLAccOnAfterInitGLEntry)
    G/L Entry  

    */



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnAfterInitGLEntry', '', true, true)]
    local procedure MyProcedure(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin

        GLEntry.Project := GenJournalLine.Project;
        GLEntry."Project Location" := GenJournalLine."Project Location";
        Message('%1', GLEntry.Project);
    end;

    /*
        [EventSubscriber(ObjectType::Table, Database::"Invoice Post. Buffer", 'OnAfterInvPostBufferPreparePurchase', '', true, true)]
        local procedure MyProcedure3(var InvoicePostBuffer: Record "Invoice Post. Buffer"; var PurchaseLine: Record "Purchase Line")
        begin
            InvoicePostBuffer.Project := PurchaseLine.Project;
            InvoicePostBuffer."Project Location" := PurchaseLine."Project Location";
        end;

        [EventSubscriber(ObjectType::Table, Database::"Invoice Post. Buffer", 'OnAfterCopyToGenJnlLine', '', true, true)]
        local procedure MyProcedure4(InvoicePostBuffer: Record "Invoice Post. Buffer"; var GenJnlLine: Record "Gen. Journal Line")
        begin
            GenJnlLine.Project := InvoicePostBuffer.Project;
            GenJnlLine."Project Location" := InvoicePostBuffer."Project Location";
        end;
        

    /*
    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterPreparePurchase', '', true, true)]
    local procedure MyProcedure5(var InvoicePostingBuffer: Record "Invoice Posting Buffer"; var PurchaseLine: Record "Purchase Line")
    begin
        Message('hii');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterCopyToGenJnlLine', '', true, true)]
    local procedure MyProcedure6()
    begin
        Message('hii');
    end;
*/

    //Assign Purchase header field values (Project & Project location) to Purchase Line fields
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInitHeaderDefaults', '', true, true)]
    local procedure MyProcedure7(PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; var TempPurchLine: Record "Purchase Line")
    begin
        PurchLine.Project := PurchHeader.Project;
        PurchLine."Project Location" := PurchHeader."Project Location";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', true, true)]
    local procedure MyProcedure8(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Project := PurchaseHeader.Project;
        GenJournalLine."Project Location" := PurchaseHeader."Project Location";
    end;

    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure MyProcedure9(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry.Project := GenJournalLine.Project;
        GLEntry."Project Location" := GenJournalLine."Project Location";
    end;

    /*
        //Customization---2/10/2023
        //Post PO->select Receive&Invoice->post entry in posted purch.Receipt->Dont post entry in posted purch.Inv Instead create new Purchase Invoice

        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeRunPurchPost', '', true, true)]
        local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header")
        begin

            if ((PurchaseHeader.Invoice = true) AND (PurchaseHeader.Receive = true)) then begin

                PurchaseHeader.Invoice := false;
                RecPurchHr.Init();
                RecPurchHr := PurchaseHeader;
                RecPurchHr."Document Type" := RecPurchHr."Document Type"::Invoice;
                RecPurchHr."No." := '';
                RecPurchHr.Status := RecPurchHr.Status::Open;
                RecPurchHr.insert(true);
                RecPurchLn.Reset();
                RecPurchLn.SetRange(RecPurchLn."Document Type", PurchaseHeader."Document Type");
                RecPurchLn.SetRange(RecPurchLn."Document No.", PurchaseHeader."No.");
                if RecPurchLn.FindSet() then begin
                    repeat
                        RecPurchLn1.Init();
                        RecPurchLn1 := RecPurchLn;
                        RecPurchLn1."Document Type" := RecPurchHr."Document Type";
                        RecPurchLn1."Document No." := RecPurchHr."No.";

                        RecPurchLn1.Insert();
                    until RecPurchLn.Next() = 0;
                end;
                Message('New Purcahse invoice is created with Invoice No.:%1', RecPurchHr."No.");
            end;
        end;

        var
            RecPurchHr: Record "Purchase Header";
            RecPurchLn: Record "Purchase Line";
            RecPurchLn1: Record "Purchase Line";
      */
}
