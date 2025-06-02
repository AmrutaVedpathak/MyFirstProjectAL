table 50108 "API Table"
{
    Caption = 'API Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            DataClassification = CustomerContent;
            AutoIncrement = true;
            /*
            trigger OnValidate()
            var
                CUJSONConnect: Codeunit JSONConnect;
            begin
                CUJSONConnect.JSONReadAndWrite(Rec);
            end;
            */
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "User Name"; Text[50])
        {
            Caption = 'User Name';
            DataClassification = CustomerContent;
        }
        field(4; Email; Code[50])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }
        field(5; Street; Text[50])
        {
            Caption = 'Street';
            DataClassification = CustomerContent;
        }
        field(6; Suit; Text[20])
        {
            Caption = 'Suit';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
