table 50127 MyCustomers
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No"; Code[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Customer City"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Location Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Customer No")
        {
            //Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin


    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}