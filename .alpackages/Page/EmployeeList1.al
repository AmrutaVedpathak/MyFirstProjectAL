page 50141 EmployeeList1
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EmployeeTable;
    Editable = false;
    CardPageId = 50145;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Employee_Code; Rec.Employee_Code)
                {
                    ApplicationArea = All;

                }
                field(Employee_Name; Rec.Employee_Name)
                {
                    ApplicationArea = All;

                }
                field(Employee_Address; Rec.Employee_Address)
                {
                    ApplicationArea = All;

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
        myInt: Integer;
}