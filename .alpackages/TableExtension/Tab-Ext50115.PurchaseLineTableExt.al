tableextension 50115 PurchaseLineTableExt extends "Purchase Line"
{
    fields
    {
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
