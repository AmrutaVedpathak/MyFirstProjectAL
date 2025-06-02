codeunit 50111 Warehouse
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Put-away", 'OnAssignPlaceBinZoneOnAfterBin2SetFilters', '', true, true)]
    local procedure MyProcedure(Location: Record Location; PostedWhseRcptLine: Record "Posted Whse. Receipt Line"; var Bin2: Record Bin; WhseActivLine: Record "Warehouse Activity Line")
    begin
        Message('%1', WhseActivLine."Action Type");
        Message('\n%1', WhseActivLine."Bin Code");
    end;

}
