page 50116 "API Card Page"
{

    Caption = 'API Card Page';
    PageType = Card;

    SourceTable = "API Table";

    layout
    {
        area(content)
        {
            group(General)
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
}
