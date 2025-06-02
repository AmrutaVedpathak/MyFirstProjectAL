table 50140 EmployeeTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Employee_Code; Code[50])
        {
            DataClassification = ToBeClassified;
            //**Number Series Code
            trigger OnValidate()
            begin
                IF Employee_Code <> xRec.Employee_Code then begin
                    SalesSetup.Get();
                    NoSeriesmgt.TestManual(SalesSetup.EmployeeNos);
                    "No.Series" := '';
                    NoSeriesmgt.SetSeries(Employee_Code);
                end;
            end;
            //**Number Series
        }
        field(2; Employee_Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Employee_Address; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(4; Loctaion_Code; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(5; "No.Series"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; Employee_Code)
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesmgt: Codeunit NoSeriesManagement;
    //**Number Series Code
    trigger OnInsert()
    begin
        IF Employee_Code = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(EmployeeNos);
            NoSeriesmgt.InitSeries(SalesSetup.EmployeeNos, xRec."No.Series", 0D, Employee_Code, "No.Series");
        end;

    end;
    //**Number Series code
    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        Message('Rename trigger..');
    end;
    //**Number Series Code
    procedure AssistEdit()
    begin
        SalesSetup.Get();
        SalesSetup.TestField(EmployeeNos);
        if NoSeriesMgt.SelectSeries(SalesSetup.EmployeeNos, xRec."No.Series", Rec."No.Series") then begin
            NoSeriesMgt.SetSeries(Rec.Employee_Code);


        end;
    end;
    //**Number Series code
}