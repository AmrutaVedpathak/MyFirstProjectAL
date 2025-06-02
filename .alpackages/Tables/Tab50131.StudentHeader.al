table 50131 Student_Header
{
    Caption = 'Student_Header';
    DataClassification = ToBeClassified;
    //LookupPageId = StudentLinesList;
    //DrillDownPageId = StudentLinesList;
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Student_No."; Code[10])
        {
            Caption = 'Student_No.';
            DataClassification = ToBeClassified;
            TableRelation = Student;
            /*
            trigger OnValidate()
            var
                Recstud: Record Student;
            begin
                Recstud.Reset();

                IF Recstud.Get("Student_No.") then begin
                    Student_Name := Recstud.Name;
                    Address := Recstud.Address;
                    Mobile_No := Recstud."Mobile No.";
                    City := Recstud.City;
                end;
            end;*/
        }
        field(3; Student_Name; Text[50])
        {
            Caption = 'Student_Name';
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(5; City; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(6; Mobile_No; Code[10])
        {
            Caption = 'Mobile_No';
            DataClassification = ToBeClassified;
        }
        field(7; "Admission date"; Date)
        {
            Caption = 'Admission date';
            DataClassification = ToBeClassified;
        }
        field(8; "Fee Per Month"; Decimal)
        {
            Caption = 'Fee Per Month';
            DataClassification = ToBeClassified;
            /*
            trigger OnValidate()
            begin
                "Total fee Per Year" := "Fee Per Month" * 12;
            end;
            */
        }
        field(9; "Total fee Per Year"; Decimal)
        {
            Caption = 'Total fee Per Year';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Total fee Paid"; Decimal)
        {
            Caption = 'Total fee Paid';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(Student_Lines."Payment Received" where("Document No." = field("No.")));
        }
        field(11; Balance; Decimal)
        {
            Caption = 'Balance';
            FieldClass = FlowField;
            CalcFormula = sum(Student_Lines.Balance where("Document No." = field("No.")));

            //Editable = false;
        }
        field(12; Class; Option)
        {
            Caption = 'Class';
            DataClassification = ToBeClassified;
            OptionMembers = "1st","2nd","3rd","4th","5th";
        }
        field(13; "No.Series"; code[10])
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
        key(SK; "Student_No.", Class)
        {

        }
    }
    //**Number Series Code
    trigger OnInsert()
    begin
        IF "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(StudentAdmissionNos);
            NoSeriesmgt.InitSeries(SalesSetup.StudentAdmissionNos, xRec."No.Series", 0D, "No.", "No.Series");
        end;

    end;
    //**Number Series code
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesmgt: Codeunit NoSeriesManagement;
}
