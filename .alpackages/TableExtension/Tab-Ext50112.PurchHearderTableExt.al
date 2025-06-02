tableextension 50112 PurchHearderTableExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Requisition No"; Code[20])
        {
            Caption = 'Requisition No';
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
