pageextension 50115 "General Ledger Entries Pge Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {
            field(Project; Rec.Project)
            {
                ApplicationArea = All;
            }
            field("Project Location"; Rec."Project Location")
            {
                ApplicationArea = All;
            }
        }
    }
}
