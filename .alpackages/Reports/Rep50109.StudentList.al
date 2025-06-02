report 50109 "Student List"
{
    ApplicationArea = All;
    Caption = 'Student List';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/student.rdl';
    dataset
    {
        dataitem(Student_Header; Student_Header)
        {
            column(Student_No; "Student_No.")
            {
            }
            column(Student_Name; Student_Name)
            {
            }
            column(Address; Address)
            {
            }
            column(Admissiondate; "Admission date")
            {
            }
            column(Class; Class)
            {

            }
            column(TotalfeePerYear; "Total fee Per Year")
            {
            }
            column(TotalfeePaid; "Total fee Paid")
            {
            }
            column(Balance; Balance)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
