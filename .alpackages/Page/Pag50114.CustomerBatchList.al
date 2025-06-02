page 50114 CustomerBatch_List
{
    ApplicationArea = All;
    Caption = 'CustomerBatch_List';
    PageType = List;
    SourceTable = CustomerBatch;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                var
                    Buffer: Record "Excel Buffer" temporary;

                    RecCustBatch: Record CustomerBatch;
                    Ins: InStream;
                    FileName: Text;
                    Row: Integer;
                    LastRow: Integer;
                begin
                    if UploadIntoStream('Give Excel File', '', '', FileName, Ins) then begin
                        Buffer.OpenBookStream(Ins, 'Sheet1');
                        Buffer.ReadSheet();
                        Buffer.FindLast();
                        LastRow := Buffer."Row No.";
                        for Row := 9 to LastRow do begin
                            RecCustBatch.Init();
                            if Buffer.get(Row, 4) then
                                RecCustBatch."Customer No" := Buffer."Cell Value as Text";

                            if Buffer.get(Row, 5) then
                                RecCustBatch."Customer Name" := Buffer."Cell Value as Text";
                            if Buffer.get(Row, 6) then
                                RecCustBatch.City := Buffer."Cell Value as Text";
                            if Buffer.get(Row, 7) then
                                RecCustBatch.Address := Buffer."Cell Value as Text";
                            RecCustBatch.Insert();
                        end;
                    end;

                end;

            }
        }

    }
}
