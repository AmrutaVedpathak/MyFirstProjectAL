codeunit 50105 "Import Data To General Journal"
{
    TableNo = "Gen. Journal Line";

    trigger OnRun()
    begin

    end;

    procedure ImportData()
    begin
        GenJnlBatch.Reset();
        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
        GenJnlBatch.SetRange(GenJnlBatch.Name, 'CASH');
        if GenJnlBatch.FindFirst() then;
        if UploadIntoStream('Give Excel File', '', '', FileName, Ins) then begin
            Buffer.OpenBookStream(Ins, 'Sheet1');
            Buffer.ReadSheet();
            Buffer.FindLast();
            LastRow := Buffer."Row No.";
            ExDocNO := '';
            for Row := 2 to LastRow do begin
                RecGenJoLine.Init();
                if Buffer.get(Row, 1) then
                    RecGenJoLine."Journal Template Name" := Buffer."Cell Value as Text";


                if Buffer.get(Row, 2) then
                    RecGenJoLine."Journal Batch Name" := Buffer."Cell Value as Text";

                if Buffer.get(Row, 3) then begin
                    Evaluate(PD, Buffer."Cell Value as Text");
                    PD := CalcDate('CM', PD);
                    RecGenJoLine."Posting Date" := PD;
                end;


                if Buffer.get(Row, 4) then begin
                    Evaluate(LN, Buffer."Cell Value as Text");
                    RecGenJoLine."Line No." := LN;
                end;

                if Buffer.get(Row, 5) then begin
                    Evaluate(AT, Buffer."Cell Value as Text");
                    RecGenJoLine."Account Type" := AT;
                end;

                if Buffer.get(Row, 6) then
                    RecGenJoLine."Account No." := Buffer."Cell Value as Text";

                if Buffer.get(Row, 7) then begin
                    Evaluate(AMT, Buffer."Cell Value as Text");
                    RecGenJoLine.Amount := AMT;
                end;
                if Buffer.get(Row, 8) then
                    RecGenJoLine."External Document No." := Buffer."Cell Value as Text";
                if ExDocNO <> RecGenJoLine."External Document No." then begin
                    DoCNo2 := CUNOSeries.GetNextNo(GenJnlBatch."No. Series", WorkDate(), true);

                end;
                RecGenJoLine."Document No." := DoCNo2;
                RecGenJoLine.Insert();
                ExDocNO := RecGenJoLine."External Document No.";
            end;
            Message('General Journal Lines inserted successfully');
        end;
    end;


    procedure ReverseEntries()
    begin
        RecGenJoLine.Reset();
        RecGenJoLine.SetRange(RecGenJoLine."Journal Template Name", 'GENERAL');
        RecGenJoLine.SetRange(RecGenJoLine."Journal Batch Name", 'CASH');
        if RecGenJoLine.findlast then
            LineNo := RecGenJoLine."Line No.";
        countRec := RecGenJoLine.Count;
        i := 0;
        GenJnlBatch.Reset();
        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", 'GENERAL');
        GenJnlBatch.SetRange(GenJnlBatch.Name, 'CASH');
        if GenJnlBatch.FindFirst() then;
        RecGenJoLine1.Reset();
        RecGenJoLine1.SetRange(RecGenJoLine1."Journal Template Name", 'GENERAL');
        RecGenJoLine1.SetRange(RecGenJoLine1."Journal Batch Name", 'CASH');

        DOCNo := '';
        if RecGenJoLine1.FindFirst() then
            repeat
                if (i = countRec) then
                    break;
                if (DOCNo <> RecGenJoLine1."Document No.") then
                    DocNo1 := CUNOSeries.GetNextNo(GenJnlBatch."No. Series", WorkDate(), true);
                RecGenJoLine2.Init();
                RecGenJoLine2."Journal Template Name" := RecGenJoLine1."Journal Template Name";
                RecGenJoLine2."Journal Batch Name" := RecGenJoLine1."Journal Batch Name";
                PD1 := CalcDate('+1D', RecGenJoLine1."Posting Date");
                RecGenJoLine2."Posting Date" := PD1;
                RecGenJoLine2."Document No." := DocNo1;
                LineNo := LineNo + 10000;
                RecGenJoLine2."Line No." := LineNo;
                RecGenJoLine2."Account Type" := RecGenJoLine1."Account Type";
                RecGenJoLine2."Account No." := RecGenJoLine1."Account No.";
                RecGenJoLine2.Amount := RecGenJoLine1.Amount * -1;
                RecGenJoLine2."External Document No." := RecGenJoLine1."External Document No.";
                RecGenJoLine2.Insert();
                DOCNo := RecGenJoLine1."Document No.";
                i := i + 1;
            until RecGenJoLine1.Next() = 0;
        Message('Reversal Entries entered successfully...');

    end;

    var
        Buffer: Record "Excel Buffer" temporary;
        RecGenJoLine: Record "Gen. Journal Line";
        RecGenJoLine1: Record "Gen. Journal Line";
        RecGenJoLine2: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        DOCNo: Code[20];
        DocNo1: Code[20];
        DoCNo2: Code[20];
        PD1: Date;
        PD: Date;
        LN: Integer;
        AMT: Decimal;
        AT: Enum "Gen. Journal Account Type";
        Ins: InStream;
        FileName: Text;
        Row: Integer;
        LastRow: Integer;
        countRec: Integer;
        i: Integer;
        CUNOSeries: Codeunit NoSeriesManagement;
        ExDocNO: Code[20];
}
