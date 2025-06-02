table 50124 Calculation
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            //Editable = false;

        }
        field(2; "First No."; Decimal)
        {

        }
        field(3; "Second No."; Decimal)
        {

        }
        field(4; CalculationType; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Addition,Substration,Multiplication,Division;
        }
        field(5; Result; Decimal)
        {

        }
        field(6; CreatedBy; Code[50])
        {

        }
        field(7; CreationDate; Date)
        {



        }
        field(8; Customer_No; Code[50])
        {
            TableRelation = Customer;
        }
        field(9; Customer_Name; Text[100])
        {

            //FieldClass = FlowField;
            /// CalcFormula = lookup(Customer.Name where("No." = field(Customer_No)));
            // Editable = false;
        }
        //**Use of flowfied and flowfilters
        field(10; Customer_Balance; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field(Customer_No), "Posting Date" = field(DateFilter)));
            Editable = false;
        }
        field(11; Customer_Invoice_Count; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Detailed Cust. Ledg. Entry" where("Customer No." = field(Customer_No), "Document Type" = const(Invoice)));
            Editable = false;
        }
        field(12; Cust_CreditMemo_Extists; Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Detailed Cust. Ledg. Entry" where("Customer No." = field(Customer_No), "Document Type" = const("Credit Memo")));
        }
        //*Flowfilters--We can set filters for setting range in calculation of flowfields
        field(13; DateFilter; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filters';

        }
    }
    keys
    {
        key(Key1; "Entry No.")
        {
            //Clustered = true;

        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; CreatedBy, CreationDate)
        {

        }

        fieldgroup(Brick; Customer_Name, Customer_Balance)
        {

        }

    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin
        //Go To Events for code
        /*
         CreatedBy := UserId;
         CreationDate := Today;
         */
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin
        Message('Rename trigger fired..');
    end;

}