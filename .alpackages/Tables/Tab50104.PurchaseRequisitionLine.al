table 50104 "Purchase Requisition Line"
{
    Caption = 'Purchase Requisition Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[50])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
            trigger OnValidate()
            begin
                IF ItemRec.Get("Item No.") then begin
                    "Item Description" := ItemRec.Description;
                    UOM := ItemRec."Base Unit of Measure";
                    "Unit Cost" := ItemRec."Unit Cost";
                end;
            end;
        }
        field(4; "Item Description"; Text[60])
        {
            Caption = 'Item Description';
            DataClassification = ToBeClassified;
        }
        field(5; UOM; Text[50])
        {
            Caption = 'UOM';
            DataClassification = ToBeClassified;
        }
        field(6; Qty; Decimal)
        {
            Caption = 'Qty';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Amount := Qty * "Unit Cost";
            end;
        }
        field(7; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Amount := Qty * "Unit Cost";
            end;
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    var
        ItemRec: Record Item;
}
