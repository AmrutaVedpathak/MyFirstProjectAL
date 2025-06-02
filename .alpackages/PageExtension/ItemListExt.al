// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 ItemListExt extends "Item List"
{

    actions
    {
        addlast(Inventory)
        {
            action("Item wise Sale and Purchase Report")
            {
                ApplicationArea = All;
                Caption = 'Item wise Sale and Purchase Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Report.Run(Report::"Item wise sale");
                end;

            }

        }

    }


}