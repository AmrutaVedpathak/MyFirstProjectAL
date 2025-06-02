table 50107 CustomerBatch
{
    Caption = 'CustomerBatch';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No"; Code[10])
        {
            Caption = 'Customer No';
            DataClassification = ToBeClassified;
        }
        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(3; City; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(4; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Customer No")
        {
            Clustered = true;
        }
    }
}
