codeunit 50114 BankPaymentFlowEventSub
{
    TableNo = "Gen. Journal Line";

    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterInitBankAccLedgEntry', '', true, true)]
    local procedure MyProcedure1(GenJournalLine: Record "Gen. Journal Line"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry")
    begin
        //Message('onafterinitbankaccledentry');
        BankAccountLedgerEntry.Transaction_No := GenJournalLine.Transaction_No;
    end;

}
