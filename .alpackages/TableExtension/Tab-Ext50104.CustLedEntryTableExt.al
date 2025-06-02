tableextension 50104 CustLedEntryTableExt extends "Cust. Ledger Entry"
{
    fields
    {
        field(50111; Remarks; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = ToBeClassified;
        }

        //flowfield Lookup Example
        field(50112; Cust_Name; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));

        }

    }
    procedure SetStyle_Test() Style: Text
    begin
        if Open then begin
            if WorkDate > "Due Date" then
                exit('StandardAccent')
        end else
            if "Closed at Date" > "Due Date" then
                exit('StrongAccent');
        exit('');
    end;
}
