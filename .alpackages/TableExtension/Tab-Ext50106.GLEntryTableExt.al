tableextension 50106 "G/LEntryTableExt" extends "G/L Entry"
{
    fields
    {
        field(50100; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }
        field(50101; Project; Text[50])
        {
            Caption = 'Project';
            DataClassification = ToBeClassified;

        }
        field(50102; "Project Location"; Option)
        {
            Caption = 'Project Location';
            OptionMembers = "US","CN","IND","AU";
            DataClassification = ToBeClassified;

        }
    }
}
