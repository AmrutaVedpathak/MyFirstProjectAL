table 50109 MyVendors
{
    Caption = 'MyVendors';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(4; Contact; Text[100])
        {
            Caption = 'Contact';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
