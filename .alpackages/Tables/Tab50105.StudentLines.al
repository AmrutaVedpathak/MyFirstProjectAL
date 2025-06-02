table 50105 Student_Lines
{
    Caption = 'Student_Lines';
    DataClassification = ToBeClassified;
    LookupPageId = StudentLinesList;
    DrillDownPageId = StudentLinesList;
    fields
    {
        field(1; "Document No."; Code[10])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Student No"; Code[10])
        {
            Caption = 'Student No';
            DataClassification = ToBeClassified;

        }
        field(4; Class; Option)
        {
            Caption = 'Class';
            DataClassification = ToBeClassified;
            OptionMembers = "1st","2nd","3rd","4th","5th";
        }
        field(5; "Payment Month"; Option)
        {
            Caption = 'Payment Month';
            DataClassification = ToBeClassified;
            OptionMembers = "Jan","Feb","March","April","May","June","July","Aug","Sept","Oct","Nov","Dec";
            trigger OnValidate()
            begin
                CheckMonthalreadyexist();
                checkcorrectMonthIsSelected();
            end;

        }
        field(6; "Payment Received"; Decimal)
        {
            Caption = 'Payment Received';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CheckMonthalreadyexist();

                Balance := "Fixed Amount Per Month" - "Payment Received";
            end;

        }
        field(7; Balance; Decimal)
        {
            Caption = 'Balance ';
            DataClassification = ToBeClassified;
        }
        field(8; "Fixed Amount Per Month"; Decimal)
        {
            Caption = 'Fixed Amount Per Month';
            DataClassification = ToBeClassified;
        }
        field(9; SaveRecord; Boolean)
        {
            Caption = 'save Record';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(SK; "Student No", Class)
        {

        }
    }
    procedure CheckMonthalreadyexist()
    begin
        RecStuLi.Reset();
        RecStuLi.SetRange(RecStuLi."Document No.", Rec."Document No.");
        if RecStuLi.FindFirst() then begin
            repeat
                if (Rec."Payment Month" = RecStuLi."Payment Month") then
                    Error('Payment is alreay received for this month for this document');
            until RecStuLi.Next() = 0;
        end;

    end;

    procedure checkcorrectMonthIsSelected()
    begin

        RecStuLi2.Reset();
        RecStuLi2.SetRange(RecStuLi2."Document No.", Rec."Document No.");
        count2 := 0;
        if RecStuLi2.FindFirst() then begin
            repeat

                count2 := count2 + 1;

            until RecStuLi2.Next() = 0;
        end;
        if (count2 <> Rec."Payment Month") then begin

            rec."Payment Month" := count2;
            Message('Kindly make payment for Month " %1 "first', Rec."Payment Month");
        end;


    end;

    procedure GetMonth()
    begin
        RecStuLi1.Reset();
        RecStuLi1.SetRange(RecStuLi1."Document No.", Rec."Document No.");
        count1 := 0;
        if RecStuLi1.FindFirst() then begin
            repeat
                count1 := count1 + 1;
            until RecStuLi1.Next() = 0;
        end;
        rec."Payment Month" := count1;

    end;



    trigger OnModify()
    begin
        if Rec.SaveRecord = true then begin

            Error('You Can not modifty this record..');
        end;

    end;

    var
        RecStuHr: Record Student_Header;
        RecStuLi: Record Student_Lines;
        RecStuLi1: Record Student_Lines;
        count1: Integer;
        RecStuli2: Record Student_Lines;
        count2: Integer;
}
