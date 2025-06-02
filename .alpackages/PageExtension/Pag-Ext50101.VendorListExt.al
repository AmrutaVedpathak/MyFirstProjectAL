pageextension 50119 VendorListExt extends "Vendor List"
{
    actions
    {
        addlast("Ven&dor")
        {
            action("Copy Vedor list")
            {
                ApplicationArea = all;
                Image = Insert;
                trigger OnAction()
                begin



                    if Rec.FindFirst() then
                        repeat
                            if ((NOT (RecMyVendor.Get(Rec."No."))) AND (rec."Location Code" = 'BLUE')) then begin
                                RecMyVendor.Init();
                                RecMyVendor."No." := Rec."No.";
                                RecMyVendor.Name := Rec.Name;
                                RecMyVendor."Location Code" := Rec."Location Code";
                                RecMyVendor.Contact := Rec.Contact;
                                RecMyVendor.Insert();
                            end;
                        until Rec.Next() = 0;


                end;



            }
        }
    }
    var
        RecMyVendor: Record MyVendors;
}
