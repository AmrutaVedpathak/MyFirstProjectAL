/*
tableextension 50116 "Invoice Post.BufferTable Ext" extends "Invoice Post. Buffer"
{
    fields
    {
        field(50104; Project; Text[50])
        {
            Caption = 'Project';
            DataClassification = ToBeClassified;

        }
        field(50105; "Project Location"; Option)
        {
            Caption = 'Project Location';
            OptionMembers = "US","CN","IND","AU";
            DataClassification = ToBeClassified;

        }
    }
}
*/