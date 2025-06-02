page 50145 EmployeeCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EmployeeTable;

    layout
    {
        area(Content)
        {
            group(Employee)
            {
                field(Employee_Code; Rec.Employee_Code)
                {
                    ApplicationArea = All;
                    Editable = false;
                    //**Number Seires code
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit();
                        CurrPage.Update();
                    end;
                    //**Number Series

                }
                field(Employee_Name; Rec.Employee_Name)
                {
                    ApplicationArea = All;

                }
                field(Employee_Address; Rec.Employee_Address)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CUIntEvent.CheckAddLen(Rec.Employee_Address);
                    end;

                }

                field(Loctaion_Code; Rec.Loctaion_Code)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        CUIntEvent: Codeunit "Integration Event";

}