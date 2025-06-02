tableextension 50116 ItemEx extends Item
{
    fields
    {
        modify(Description)
        {
            trigger OnBeforeValidate()
            begin
                if (StrLen(Description) > 15) then
                    Error('Item dsecriptions should less than 15 charachters');

                ItemRec.RESET;
                ItemRec.setrange(ItemRec.Description, Rec.Description);
                if ItemRec.FindFirst() then
                    Error('This Item name is already exist for Item No %1 .Change the Item Decsription', ItemRec."No.");
            end;

            trigger OnAfterValidate()
            begin
                Rec."Gen. Prod. Posting Group" := 'MISC';
                Rec."Inventory Posting Group" := 'FINISHED';
                Rec."Common Item No." := Rec."No.";
                Rec.Modify();
            end;

        }
    }
    var
        ItemRec: Record Item;

}
