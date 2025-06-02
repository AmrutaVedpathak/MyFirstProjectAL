page 50115 "API List Page"
{
    ApplicationArea = All;
    Caption = 'API List Page';
    PageType = List;
    SourceTable = "API Table";
    UsageCategory = Lists;
    CardPageId = "API Card Page";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Street field.';
                }
                field(Suit; Rec.Suit)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suit field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Get Data From JSON")
            {
                ApplicationArea = All;
                Caption = 'Get Data From JSON';
                trigger OnAction()
                var
                    CUJSONConnect: Codeunit JSONConnect;
                    RecAPITable: Record "API Table";
                begin
                    CUJSONConnect.JSONReadAndWrite(RecAPITable);
                end;
            }
        }
    }
}
