page 50101 "Sales Order New List"
{
    ApplicationArea = All;
    Caption = 'Sales Order New';
    PageType = List;
    SourceTable = "Sales header Nw";
    UsageCategory = Lists;
    CardPageId = "Sales Order Document";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Doument Type"; Rec."Doument Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Payment Term Code"; Rec."Payment Term Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Term field.';
                }
                field(Amount; Rec."Amount To Customer")
                {
                    ApplicationArea = Basic, Suite;
                    //To check Line Amount details
                    trigger OnDrillDown()
                    begin
                        SalesLineNwRec.Reset();
                        SalesLineNwRec.SetRange(SalesLineNwRec."Document No.", rec."No.");
                        page.RunModal(50104, SalesLineNwRec);
                    end;

                }
            }


        }

    }
    var
        SalesLineNwRec: Record "Sales Line Nw";
}
