report 50123 GLReport
{
    ApplicationArea = All;
    Caption = 'GLReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/GLReport.rdl';
    dataset
    {
        dataitem(GLEntry; "G/L Entry")
        {
            RequestFilterFields = "G/L Account No.", "Posting Date";
            column(Filter1; str1)
            {

            }

            dataitem(GLEntry1; "G/L Entry")
            {
                DataItemLink = "Posting Date" = field("Posting Date"), "Document No." = field("Document No.");
                column(Document_No_; "Document No.")
                {

                }
                column(Posting_Date; "Posting Date")
                {

                }

                column(G_L_Account_No_; "G/L Account No.")
                {

                }
                column(AccNm; AccNm)
                {

                }
                column(Amount; Amount)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    RecGLAC.Reset();
                    if RecGLAC.Get("G/L Account No.") then
                        AccNm := RecGLAC.Name;

                end;
            }

        }

    }
    trigger OnPreReport()
    begin
        Filter1 := GLEntry.GetFilter("G/L Account No.");
        if Filter1 = '' then
            Error('Enter G/L Account No..');
        str1 := 'G/L Account No: ' + Filter1;
    end;



    var
        AccNo: Code[30];
        AccNm: Text[50];
        RecGLAC: Record "G/L Account";
        Filter1: Text[100];
        filter2: Text[100];
        str1: Text[100];

}
