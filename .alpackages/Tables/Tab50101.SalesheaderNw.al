table 50101 "Sales header Nw"
{
    Caption = 'Sales header Nw';
    DataClassification = ToBeClassified;
    // LookupPageId = "Sales Lines Nw";
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            //**Number Series Code
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesmgt.TestManual(SalesSetup.SalesOrderNw);
                    "No.Series" := '';
                    NoSeriesmgt.SetSeries("No.");
                end;
            end;
            //**Number Series
        }
        field(2; "Doument Type"; Enum DocumentType_Sales)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;

        }
        field(3; "Customer No."; code[10])
        {

            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            begin
                Cust.Reset();
                IF ((Page.RunModal(22, Cust)) = Action::LookupOK) then begin
                    "Customer No." := Cust."No.";
                    "Customer Name" := Cust.Name;
                    Address := cust.Address;
                    "Payment Term Code" := Cust."Payment Terms Code";
                end;
            end;
        }
        field(4; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;


        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(6; "Order No."; Code[10])
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;
        }
        field(7; "Payment Term Code"; Code[20])
        {
            Caption = 'Payment Term';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";
        }
        field(8; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(9; "No.Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10; "Amount To Customer"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line Nw".Amount where("Document No." = field("No.")));

        }

    }
    keys
    {
        key(PK; "Doument Type", "No.")

        {
            Clustered = true;
        }
    }
    //**Number Series Code
    trigger OnInsert()
    begin
        IF "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesOrderNw);
            NoSeriesmgt.InitSeries(SalesSetup.SalesOrderNw, xRec."No.Series", 0D, "No.", "No.Series");
        end;

    end;
    //**Number Series code
    //**Number Series Code
    procedure AssistEdit()
    begin
        SalesSetup.Get();
        SalesSetup.TestField(SalesOrderNw);
        if NoSeriesMgt.SelectSeries(SalesSetup.SalesOrderNw, xRec."No.Series", Rec."No.Series") then begin
            NoSeriesMgt.SetSeries(Rec."No.");


        end;
    end;
    //**Number Series code
    var
        Cust: Record Customer;
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesmgt: Codeunit NoSeriesManagement;
}
