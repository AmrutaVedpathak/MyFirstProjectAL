report 50115 Demo
{
    ApplicationArea = All;
    Caption = 'Demo';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Demo.rdl';
    dataset
    {
        dataitem(item; item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(UnitCost; "Unit Cost")
            {
            }
        }
    }

}
