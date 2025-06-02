pageextension 50145 SalesNRecPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast("Number Series")
        {
            field("Employee Nos."; Rec.EmployeeNos)
            {
                ApplicationArea = All;
            }
            field("Sales Order New"; Rec.SalesOrderNw)
            {
                ApplicationArea = All;
            }
            field(StudentNos; Rec.StudentNos)
            {
                ApplicationArea = All;
            }
            field(StudentAdmissionNos; Rec.StudentAdmissionNos)
            {
                ApplicationArea = All;
            }

        }



    }
}
