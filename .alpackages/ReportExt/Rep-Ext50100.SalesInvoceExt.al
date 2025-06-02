reportextension 50100 "Sales Invoce Ext" extends "Standard Sales - Invoice"
{
    dataset
    {
        addlast(Header)
        {
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLinkReference = Header;
                DataItemLink = "No." = field("No.");
                DataItemTableView = where("Document Type" = filter("Posted Invoice"));

                column(Comment; Comment)
                {
                }


            }


        }
        modify(Header)
        {

        }

    }
    requestpage
    {
        layout
        {
            addafter(Options)
            {
                field("Enter Date"; Date1)
                {
                    ApplicationArea = all;
                }

            }
        }
        var
            SalesInvrpt: Report 1306;
            Date1: Date;
    }
}
