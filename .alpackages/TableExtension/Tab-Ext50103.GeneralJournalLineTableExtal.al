tableextension 50103 "GeneralJournalLineTableExt.al" extends "Gen. Journal Line"
{
    fields
    {
        field(50105; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(50106; Transaction_No; code[50])
        {
            Caption = 'Transaction No.';
            DataClassification = ToBeClassified;
        }
        field(50107; Project; Text[50])
        {
            Caption = 'Project';
            DataClassification = ToBeClassified;

        }
        field(50108; "Project Location"; Option)
        {
            Caption = 'Project Location';
            OptionMembers = "US","CN","IND","AU";
            DataClassification = ToBeClassified;

        }
    }
}
