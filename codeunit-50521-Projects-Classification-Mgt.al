codeunit 50521 "Projects Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Job Management
        ClassifyJob(RecordDeletion);
        ClassifyPlanning(RecordDeletion);
        ClassifyWIP(RecordDeletion);

        // Resource Management
        ClassifyResource(RecordDeletion);
        ClassifyResourceTables(RecordDeletion);
        ClassifyResourcePricing(RecordDeletion);
        ClassifyTimesheet(RecordDeletion);

        // Financial Tracking
        ClassifyLedger(RecordDeletion);
        ClassifyJournal(RecordDeletion);
    end;
    #endregion

    #region Job Management
    local procedure ClassifyJob(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Job Data
        ClassifyTable(RecordDeletion, Database::Job, 'Project', 'Job', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Job Task", 'Project', 'Job', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Job Task Dimension", 'Project', 'Job', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Jobs Setup", 'Project', 'Job', 'Setup', 999);

        // Job Pricing
        ClassifyTable(RecordDeletion, Database::"Job Resource Price", 'Project', 'Job', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Job Item Price", 'Project', 'Job', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Job G/L Account Price", 'Project', 'Job', 'Master', 999);

        // Job WIP and Planning
        ClassifyTable(RecordDeletion, Database::"Job WIP Warning", 'Project', 'WIP', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Planning Line - Calendar", 'Project', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Usage Link", 'Project', 'Job', 'Document', 300);

        // Job Buffers & Archive
        ClassifyTable(RecordDeletion, Database::"Job Buffer", 'Project', 'Job', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job WIP Buffer", 'Project', 'WIP', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Difference Buffer", 'Project', 'Job', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Entry No.", 'Project', 'Job', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Job Archive", 'Project', 'Job', 'Archive', 200);
        ClassifyTable(RecordDeletion, Database::"Job Task Archive", 'Project', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Job Planning Line Archive", 'Project', 'Archive', 'History', 200);
    end;

    local procedure ClassifyPlanning(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job Planning Line", 'Project', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Planning Line Invoice", 'Project', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Task", 'Project', 'Planning', 'Master', 999);
    end;

    local procedure ClassifyWIP(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job WIP Entry", 'Project', 'WIP', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Job WIP G/L Entry", 'Project', 'WIP', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Job WIP Total", 'Project', 'WIP', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job WIP Method", 'Project', 'WIP', 'Setup', 999);
    end;
    #endregion

    #region Resource Management
    local procedure ClassifyResource(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Resource, 'Project', 'Resource', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Resource Group", 'Project', 'Resource', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Res. Capacity Entry", 'Project', 'Resource', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Res. Ledger Entry", 'Project', 'Resource', 'Ledger', 100);
    end;

    local procedure ClassifyResourceTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Resource Master Data
        ClassifyTable(RecordDeletion, Database::"Resource Unit of Measure", 'Project', 'Resource', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Resource Price Change", 'Project', 'Resource', 'Document', 300);


        // Resource Journals
        ClassifyTable(RecordDeletion, Database::"Res. Journal Template", 'Project', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Res. Journal Line", 'Project', 'Resource', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Res. Journal Batch", 'Project', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Resource Register", 'Project', 'Resource', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Job Journal Quantity", 'Project', 'Journal', 'Document', 300);

        // Job Setup
        ClassifyTable(RecordDeletion, Database::"Job Posting Group", 'Project', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Job Posting Buffer", 'Project', 'Setup', 'Document', 300);
    end;

    local procedure ClassifyResourcePricing(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Resource Price", 'Project', 'Resource', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Resource Cost", 'Project', 'Resource', 'Master', 999);
    end;

    local procedure ClassifyTimesheet(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Time Sheet Header", 'Project', 'Timesheet', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Line", 'Project', 'Timesheet', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Detail", 'Project', 'Timesheet', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Posting Entry", 'Project', 'Timesheet', 'Ledger', 100);

        ClassifyTable(RecordDeletion, Database::"Time Sheet Comment Line", 'Project', 'Timesheet', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Header Archive", 'Project', 'Timesheet', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Line Archive", 'Project', 'Timesheet', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Detail Archive", 'Project', 'Timesheet', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Cmt. Line Archive", 'Project', 'Timesheet', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Time Sheet Chart Setup", 'Project', 'Timesheet', 'Setup', 999);
    end;
    #endregion

    #region Financial Tracking
    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job Ledger Entry", 'Project', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Job Register", 'Project', 'Ledger', 'Register', 150);
    end;

    local procedure ClassifyJournal(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job Journal Line", 'Project', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Journal Batch", 'Project', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Job Journal Template", 'Project', 'Journal', 'Setup', 999);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Project;
            RecordDeletion."Table Type" := GetTableTypeOption(TableType);
            RecordDeletion."Deletion Priority" := Priority;
            RecordDeletion.Modify();
        end;
    end;

    local procedure GetTableTypeOption(TableType: Text[50]): Enum "Record Deletion Table Type"
    var
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        case TableType of
            'Master':
                exit(RecordDeletionTableType::Master);
            'Setup':
                exit(RecordDeletionTableType::Setup);
            'Document':
                exit(RecordDeletionTableType::Document);
            'Ledger':
                exit(RecordDeletionTableType::Ledger);
            'Register':
                exit(RecordDeletionTableType::Register);
            'Archive':
                exit(RecordDeletionTableType::Archive);
            else
                exit(RecordDeletionTableType::" ");
        end;
    end;

    local procedure SetSuggestedTable(TableID: Integer)
    var
        RecordDeletion: Record "Record Deletion";
    begin
        if RecordDeletion.Get(TableID) then begin
            RecordDeletion."Delete Records" := true;
            RecordDeletion.Modify();
        end;
    end;
    #endregion
}