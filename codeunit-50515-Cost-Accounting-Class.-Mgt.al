codeunit 50515 "Cost Accounting Class. Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Master Data
        ClassifyAccount(RecordDeletion);

        // Core Operations
        ClassifyJournal(RecordDeletion);
        ClassifyLedger(RecordDeletion);

        // Planning & Setup
        ClassifyAllocation(RecordDeletion);
        ClassifyBudget(RecordDeletion);
    end;
    #endregion

    #region Master Data
    local procedure ClassifyAccount(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cost Center", 'CostAccounting', 'Account', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Cost Object", 'CostAccounting', 'Account', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Cost Type", 'CostAccounting', 'Account', 'Master', 999);
    end;
    #endregion

    #region Core Operations
    local procedure ClassifyJournal(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cost Journal Line", 'CostAccounting', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cost Journal Template", 'CostAccounting', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cost Journal Batch", 'CostAccounting', 'Journal', 'Setup', 999);
    end;

    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cost Entry", 'CostAccounting', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Cost Register", 'CostAccounting', 'Ledger', 'Register', 150);
    end;
    #endregion

    #region Planning & Setup
    local procedure ClassifyAllocation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cost Allocation Source", 'CostAccounting', 'Allocation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cost Allocation Target", 'CostAccounting', 'Allocation', 'Setup', 999);
    end;

    local procedure ClassifyBudget(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cost Budget Entry", 'CostAccounting', 'Budget', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Cost Budget Register", 'CostAccounting', 'Budget', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Cost Budget Name", 'CostAccounting', 'Budget', 'Setup', 999);
    end;
    #endregion

    #region Helper Functions
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
    #endregion
}