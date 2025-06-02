table 50103 "Purchase Requisition Header"
{
    Caption = 'Purchase Requisition Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            //**Number Series Code
            trigger OnValidate()
            begin
                IF "No." <> xRec."No." then begin
                    PurchSetup.Get();
                    NoSeriesmgt.TestManual(PurchSetup.PurchReqi);
                    "No.Series" := '';
                    NoSeriesmgt.SetSeries("No.");
                end;
            end;
            //**Number Series
        }
        field(2; "Desired Vendor No."; Code[50])
        {
            Caption = 'Desired Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
            trigger OnValidate()
            begin
                VendorRec.Reset();
                IF VendorRec.Get("Desired Vendor No.") then
                    "Vendor Name" := VendorRec.Name;
            end;
        }
        field(3; "Vendor Name"; Text[50])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Requistion Date"; Date)
        {
            Caption = 'Requistion Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Location Code"; Code[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = Draft,Pending,Rejected,Approved;
            // Editable = false;
        }
        field(7; "No.Series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
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
            PurchSetup.Get();
            PurchSetup.TestField(PurchReqi);
            NoSeriesmgt.InitSeries(PurchSetup.PurchReqi, xRec."No.Series", 0D, "No.", "No.Series");
        end;

    end;
    //**Number Series code
    //**Number Series Code
    procedure AssistEdit()
    begin
        PurchSetup.Get();
        PurchSetup.TestField(PurchReqi);
        if NoSeriesMgt.SelectSeries(PurchSetup.PurchReqi, xRec."No.Series", Rec."No.Series") then begin
            NoSeriesMgt.SetSeries(Rec."No.");


        end;
    end;
    //**Number Series code

    var
        VendorRec: Record Vendor;
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesmgt: Codeunit NoSeriesManagement;
}
