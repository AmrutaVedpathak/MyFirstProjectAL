table 50106 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;
    DrillDownPageId = StudentLinesList;
    //LookupPageId = StudentLinesList;
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[500])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(4; City; Text[25])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(5; "Mobile No."; Code[10])
        {
            Caption = 'Mobile No.';
            DataClassification = ToBeClassified;
        }
        field(6; Balance; Decimal)
        {
            Caption = 'Balance';

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(Student_Lines.Balance where("Student No" = field("No.")));

        }
        field(7; "No.Series"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    //**Number Series Code
    trigger OnInsert()
    begin
        IF "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(StudentNos);
            NoSeriesmgt.InitSeries(SalesSetup.StudentNos, xRec."No.Series", 0D, "No.", "No.Series");
        end;

    end;
    //**Number Series code
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesmgt: Codeunit NoSeriesManagement;
}
