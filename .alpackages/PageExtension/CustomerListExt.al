pageextension 50129 CustomerExt1 extends "Customer List"
{
    actions
    {

        addlast(Functions)
        {
            action("Insert Data")
            {
                ApplicationArea = All;
                Image = Insert;
                trigger OnAction()
                begin

                    if Rec.FindFirst() then
                        repeat

                            IF ((NOT (MyCust.get(Rec."No.")))) then begin
                                IF (Rec."Location Code" = 'BLUE') then begin
                                    MyCust.Init();
                                    MyCust."Customer No" := Rec."No.";
                                    MyCust."Customer Name" := Rec.Name;
                                    MyCust."Customer Address" := Rec.Address;
                                    MyCust."Customer City" := Rec.City;
                                    MyCust."Location Code" := Rec."Location Code";
                                    MyCust.Insert();
                                end;

                            end;


                        until Rec.Next() = 0;

                end;

                //mycust.insert(True);
                ////mycust.insert(True,true);

            }
            action("ImportXML")
            {
                ApplicationArea = All;
                Image = XMLFile;
                trigger OnAction()
                begin
                    Xmlport.Run(50100);
                end;
            }
        }


    }
    var
        MyCust: Record MyCustomers;

}
