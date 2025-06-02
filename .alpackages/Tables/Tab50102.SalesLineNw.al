table 50102 "Sales Line Nw"
{
    Caption = 'Sales Line Nw';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum DocumentType_Sales)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document No."; Code[10])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
            Editable = false;

        }

        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Customer No."; Code[50])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Customer name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Type"; Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = ,Item,"G/L Account";
            trigger OnValidate()
            begin
                SalesHrNw.Reset();
                SalesHrNw.SetRange(SalesHrNw."Doument Type", SalesHrNw."Doument Type"::Order);
                SalesHrNw.SetRange(SalesHrNw."No.", "Document No.");
                if SalesHrNw.FindFirst() then begin
                    "Customer No." := SalesHrNw."Customer No.";
                    "Customer name" := SalesHrNw."Customer Name";

                end;

            end;
        }
        field(7; "No."; Code[50])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            //Apply Table relation on condition
            TableRelation =
                        IF (Type = const(Item)) Item
            else
            IF (Type = const("G/L Account")) "G/L Account";


            trigger OnValidate()
            begin
                IF (Type = Type::Item) then begin
                    ItemRec.Reset();
                    IF (ItemRec.Get("No.")) then begin
                        Description := ItemRec.Description;
                        "Unit Price" := ItemRec."Unit Price";
                        UOM := ItemRec."Base Unit of Measure";
                    end;
                end;
                IF (Type = Type::"G/L Account") then begin
                    GLAccRec.Reset();
                    IF (GLAccRec.Get("No.")) then
                        Description := GLAccRec.Name;

                end;



            end;

        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(9; "Qty."; Decimal)
        {
            Caption = 'Qty.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Amount := "Qty." * "Unit Price";

            end;
        }
        field(10; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Amount := "Qty." * "Unit Price";


            end;

        }
        field(11; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(12; "GST %"; Decimal)
        {
            Caption = 'GST %';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "GST Amount" := Amount * ("GST %" / 100);
                "Total Amount with GST" := Amount + "GST Amount";
            end;
        }
        field(13; "GST Amount"; Decimal)
        {
            Caption = 'GST Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Total Amount with GST"; Decimal)
        {
            Caption = 'Total Amount with GST';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "UOM"; Code[15])
        {
            Caption = 'Unit Of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.")

        {
            Clustered = true;
        }
    }
    var
        ItemRec: Record Item;
        GLAccRec: Record "G/L Account";
        SalesHrNw: Record "Sales header Nw";
}
