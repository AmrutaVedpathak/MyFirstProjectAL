codeunit 50100 "Event Subscriber"
{
    TableNo = "Sales Header";

    trigger OnRun()
    begin

    end;
    /*Process for post Sales order
    Affected Tables-
    Sales Invoice Header
    General Journal Line
    Cust.Ledger Entry
    Detailed Cust.Ledger Entry
    Value Entry

    */




    ///flow at header level
    // Add customize code in Sales-Post (Existing Codeunit)...Tranfer field from sales Header to Sales Invoice Header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnInsertInvoiceHeaderOnAfterSalesInvHeaderTransferFields', '', true, true)]
    local procedure MyProcedure(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin

        SalesInvoiceHeader.Remarks := SalesHeader.Remarks;
    end;



    //Flow fields from sales header to Gen.journal line
    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure MyProcedure1(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine.Remarks := SalesHeader.Remarks;
    end;

    //flow field from Gen.journal line to Cust.Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitCustLedgEntry', '', true, true)]
    local procedure MyProcedure2(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry.Remarks := GenJournalLine.Remarks;

    end;

    //flow field from Gen.journal line to Detailed Cust.Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', true, true)]
    local procedure MyProcedure3(DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"; GenJournalLine: Record "Gen. Journal Line"; var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin
        DtldCustLedgEntry.Remarks := GenJournalLine.Remarks;

    end;


    //flow field from Gen journal line to G/L entry
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure MyProcedure4(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GLEntry.Remarks := GenJournalLine.Remarks;
    end;


    ///Flow at Line Level

    //Flow field from sales Line to Sales Invoice Line

    [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Line", 'OnAfterInitFromSalesLine', '', true, true)]
    local procedure MyProcedure7(SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; var SalesInvLine: Record "Sales Invoice Line")
    begin

        SalesInvLine.Comment1 := SalesLine.Comments1;
    end;

    //flow feild from sales line to item journal line
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure MyProcedure8(SalesLine: Record "Sales Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine.Comments1 := SalesLine.Comments1;
    end;

    //flow field from item journal line to Item Ledger Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure MyProcedure9(var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry.Comments1 := ItemJournalLine.Comments1;
    end;

    //flow field from item journal line to Value Entry
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', true, true)]
    local procedure MyProcedure10(var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntry: Record "Item Ledger Entry"; var ValueEntry: Record "Value Entry"; var ValueEntryNo: Integer)
    begin


        ValueEntry.Comments1 := ItemJournalLine.Comments1;

    end;

}
