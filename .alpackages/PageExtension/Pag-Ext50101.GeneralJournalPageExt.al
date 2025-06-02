pageextension 50113 GeneralJournalPageExt extends "General Journal"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = true;
        }
        addlast(Control1)
        {
            field(Transaction_No; Rec.Transaction_No)
            {
                ApplicationArea = All;
            }
        }

    }
    actions
    {
        addlast("F&unctions")
        {
            action("Import General Journal Lines From Excel")
            {
                Caption = 'Import General Journal Lines From Excel';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CUImport.ImportData();
                end;

            }
            action("Reversal Entries")
            {
                Caption = 'Reversal Entries';
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CUImport.ReverseEntries();
                end;

            }
        }
    }
    var
        CUImport: Codeunit "Import Data To General Journal";
}
