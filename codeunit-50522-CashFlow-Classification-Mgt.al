codeunit 50522 "CashFlow Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyAccount(RecordDeletion);
        ClassifyForecast(RecordDeletion);
        ClassifySetup(RecordDeletion);
        ClassifyWorksheet(RecordDeletion);
    end;

    local procedure ClassifyAccount(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cash Flow Account", 'CashFlow', 'Account', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Account Comment", 'CashFlow', 'Account', 'Document', 300);
    end;

    local procedure ClassifyForecast(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cash Flow Forecast", 'CashFlow', 'Forecast', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Forecast Entry", 'CashFlow', 'Forecast', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Availability Buffer", 'CashFlow', 'Forecast', 'Document', 300);
    end;

    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cash Flow Manual Expense", 'CashFlow', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Manual Revenue", 'CashFlow', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Setup", 'CashFlow', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyWorksheet(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cash Flow Worksheet Line", 'CashFlow', 'Worksheet', 'Document', 300);
    end;


    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::CashFlow;
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