report 50113 "Material Status Report"
{
    ApplicationArea = All;
    Caption = 'Material Status Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Material Status Report.rdl';
    dataset
    {
        dataitem(TransferShipmentHeader; "Transfer Shipment Header")
        {
            column(No; "No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Item_No_; "Item No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }


            }

            trigger OnPreDataItem()
            begin
                if (StartDate = 0D) then
                    Error('Enter Start Date');
                if (EndDate = 0D) then
                    EndDate := WorkDate();
            end;


        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        StartDate: Date;
        EndDate: Date;
        TransferOrderNo: Code[20];
}
