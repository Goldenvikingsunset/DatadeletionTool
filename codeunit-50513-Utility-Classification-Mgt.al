codeunit 50513 "Utility Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyActivityLog(RecordDeletion);
        ClassifyAuditTrail(RecordDeletion);
        ClassifyDocuments(RecordDeletion);
        ClassifyPreferences(RecordDeletion);
    end;

    local procedure ClassifyActivityLog(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Activity Log", 'System', 'ActivityLog', 'History', 100);
    end;

    local procedure ClassifyAuditTrail(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cancelled Document", 'System', 'Audit', 'History', 100);
        ClassifyTable(RecordDeletion, Database::"Change Log Entry", 'System', 'Audit', 'History', 100);
    end;

    local procedure ClassifyDocuments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Certificate of Supply", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Document Entry", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Standard Text", 'System', 'Document', 'Setup', 999);
    end;

    local procedure ClassifyPreferences(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Journal User Preferences", 'System', 'Preferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Line Number Buffer", 'System', 'Preferences', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Name/Value Buffer", 'System', 'Preferences', 'Document', 300);
    end;

    procedure SuggestRecordsToDelete()
    begin
        SetSuggestedTable(Database::"Activity Log");
        SetSuggestedTable(Database::"Change Log Entry");
        SetSuggestedTable(Database::"Error Buffer");
        SetSuggestedTable(Database::"Error Message");
        SetSuggestedTable(Database::"Line Number Buffer");
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::System;
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
            'History':
                exit(RecordDeletionTableType::History);
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
}