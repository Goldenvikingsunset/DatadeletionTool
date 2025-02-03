codeunit 50516 "Fixed Assets Class. Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyFixedAssets(RecordDeletion);
        ClassifyDepreciation(RecordDeletion);
        ClassifyInsurance(RecordDeletion);
        ClassifyMaintenance(RecordDeletion);
        ClassifyJournal(RecordDeletion);
        ClassifyLedger(RecordDeletion);
        ClassifyFixedAssetTables(RecordDeletion);
    end;

    local procedure ClassifyFixedAssetTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Setup
        ClassifyTable(RecordDeletion, Database::"FA Setup", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Posting Type Setup", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Journal Setup", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Posting Group", 'FixedAssets', 'Setup', 'Setup', 999);

        // Posting Types
        ClassifyTable(RecordDeletion, Database::"FA Posting Type", 'FixedAssets', 'Posting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Date Type", 'FixedAssets', 'Posting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Matrix Posting Type", 'FixedAssets', 'Posting', 'Setup', 999);

        // Journals
        ClassifyTable(RecordDeletion, Database::"FA Reclass. Journal Template", 'FixedAssets', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Reclass. Journal Batch", 'FixedAssets', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Insurance Journal Template", 'FixedAssets', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Insurance Journal Batch", 'FixedAssets', 'Journal', 'Setup', 999);

        // Buffers
        ClassifyTable(RecordDeletion, Database::"FA G/L Posting Buffer", 'FixedAssets', 'Posting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"FA Buffer Projection", 'FixedAssets', 'Posting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"FA Posting Group Buffer", 'FixedAssets', 'Posting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Depreciation Table Buffer", 'FixedAssets', 'Posting', 'Document', 300);
    end;

    local procedure ClassifyFixedAssets(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Fixed Asset", 'FixedAssets', 'Master', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"FA Class", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Subclass", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Location", 'FixedAssets', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Main Asset Component", 'FixedAssets', 'Master', 'Master', 999);
    end;

    local procedure ClassifyDepreciation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Depreciation Book", 'FixedAssets', 'Depreciation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Depreciation Book", 'FixedAssets', 'Depreciation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Depreciation Table Header", 'FixedAssets', 'Depreciation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Depreciation Table Line", 'FixedAssets', 'Depreciation', 'Setup', 999);
    end;

    local procedure ClassifyInsurance(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Insurance, 'FixedAssets', 'Insurance', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Insurance Type", 'FixedAssets', 'Insurance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Insurance Journal Line", 'FixedAssets', 'Insurance', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Ins. Coverage Ledger Entry", 'FixedAssets', 'Insurance', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Insurance Register", 'FixedAssets', 'Insurance', 'Register', 150);
    end;

    local procedure ClassifyMaintenance(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Maintenance, 'FixedAssets', 'Maintenance', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Maintenance Registration", 'FixedAssets', 'Maintenance', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Maintenance Ledger Entry", 'FixedAssets', 'Maintenance', 'Ledger', 100);
    end;

    local procedure ClassifyJournal(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"FA Journal Line", 'FixedAssets', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"FA Journal Template", 'FixedAssets', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Journal Batch", 'FixedAssets', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FA Reclass. Journal Line", 'FixedAssets', 'Journal', 'Document', 300);
    end;

    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"FA Ledger Entry", 'FixedAssets', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"FA Register", 'FixedAssets', 'Ledger', 'Register', 150);
    end;

    procedure SuggestRecordsToDelete()
    begin
        SetSuggestedTable(Database::"FA Ledger Entry");
        SetSuggestedTable(Database::"FA Journal Line");
        SetSuggestedTable(Database::"FA Reclass. Journal Line");
        SetSuggestedTable(Database::"Maintenance Ledger Entry");
        SetSuggestedTable(Database::"Ins. Coverage Ledger Entry");
        SetSuggestedTable(Database::"FA Register");
        SetSuggestedTable(Database::"Insurance Register");
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Finance;
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