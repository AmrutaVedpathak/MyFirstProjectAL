tableextension 50111 BanlAccLedgerEntryTableExt extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50100; Transaction_No; Code[50])
        {
            Caption = 'Transaction_No';
            DataClassification = ToBeClassified;
        }
    }
}
