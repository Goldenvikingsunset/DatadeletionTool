page 50500 "Record Deletion"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Record Deletion";
    Caption = 'Record Deletion';

    layout
    {
        area(Content)
        {
            repeater(Records)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the table';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the table';
                }
                field(Module; Rec.Module)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the module this table belongs to';
                }
                field("Table Type"; Rec."Table Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of table (Master, Setup, etc)';
                }
                field("No. of Records"; Rec."No. of Records")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of records in the table';
                }
                field("Delete Records"; Rec."Delete Records")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if records should be deleted from this table';
                }
                field("Deletion Priority"; Rec."Deletion Priority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the deletion order priority';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(InsertUpdateTables)
            {
                ApplicationArea = All;
                Caption = 'Insert/Update Tables';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Initialize or update the list of tables';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.InsertUpdateTables();
                end;
            }
            action(SuggestRecords)
            {
                ApplicationArea = All;
                Caption = 'Suggest Records to Delete';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Get suggestions for tables to delete from';

                trigger OnAction()
                var
                    TableClassificationMgt: Codeunit "Table Classification Core Mgt.";
                begin
                    TableClassificationMgt.SuggestRecordsToDelete();
                end;
            }
            action(ClearRecords)
            {
                ApplicationArea = All;
                Caption = 'Clear Records to Delete';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Clear all delete selections';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.ClearRecordsToDelete();
                end;
            }
            action(DeleteRecordsNoTrigger)
            {
                ApplicationArea = All;
                Caption = 'Delete Records (no trigger!)';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Delete records without running triggers';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.DeleteRecords(false);
                end;
            }
            action(DeleteRecordsWithTrigger)
            {
                ApplicationArea = All;
                Caption = 'Delete Records (with trigger!)';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Delete records and run triggers';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.DeleteRecords(true);
                end;
            }
            action(CheckTableRelations)
            {
                ApplicationArea = All;
                Caption = 'Check Table Relations';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Check relationships between tables';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.CheckTableRelations();
                end;
            }
            action(ViewRecords)
            {
                ApplicationArea = All;
                Caption = 'View Records';
                Image = Table;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'View the records in the selected table';

                trigger OnAction()
                var
                    RecordDeletionMgt: Codeunit "Record Deletion Mgt.";
                begin
                    RecordDeletionMgt.ViewRecords(Rec);
                end;
            }
        }
    }
}