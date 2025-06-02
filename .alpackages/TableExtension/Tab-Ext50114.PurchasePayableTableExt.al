tableextension 50114 "Purchase&PayableTableExt" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50100; PurchReqi; Code[10])
        {
            Caption = 'Purchase Requisition Nos.';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}
