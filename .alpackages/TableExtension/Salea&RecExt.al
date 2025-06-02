tableextension 50146 SalesnrecExt extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50110; EmployeeNos; Code[50])
        {
            TableRelation = "No. Series";
        }
        field(50111; SalesOrderNw; code[10])
        {
            Caption = 'Sales order New';
            TableRelation = "No. Series";
        }
        field(50112; StudentNos; Code[10])
        {
            Caption = 'Student Nos.';
            TableRelation = "No. Series";
        }
        field(50113; StudentAdmissionNos; code[10])
        {
            Caption = 'Student Admissio Nos.';
            TableRelation = "No. Series";
        }

    }



}