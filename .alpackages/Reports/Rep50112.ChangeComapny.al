report 50112 ChangeComapny
{
    ApplicationArea = All;
    Caption = 'ChangeComapny';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }
        actions
        {
            area(processing)
            {

                action("Insert Data to Customer Table")
                {
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        RecCust.ChangeCompany('Demo US');
                    end;

                }

            }
        }




    }
    var
        RecCust: Record Customer;
}

