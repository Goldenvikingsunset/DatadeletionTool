codeunit 50524 "Pricing Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyPriceList(RecordDeletion);
        ClassifyCalculation(RecordDeletion);
        ClassifyAsset(RecordDeletion);
        ClassifySource(RecordDeletion);
        ClassifyWorksheet(RecordDeletion);
    end;

    local procedure ClassifyPriceList(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price List Header", 'Pricing', 'PriceList', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Price List Line", 'Pricing', 'PriceList', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Price Line Filters", 'Pricing', 'PriceList', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Duplicate Price Line", 'Pricing', 'PriceList', 'Document', 300);
    end;

    local procedure ClassifyCalculation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price Calculation Setup", 'Pricing', 'Calculation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Price Calculation Buffer", 'Pricing', 'Calculation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dtld. Price Calculation Setup", 'Pricing', 'Calculation', 'Setup', 999);
    end;

    local procedure ClassifyAsset(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price Asset", 'Pricing', 'Asset', 'Master', 999);
    end;

    local procedure ClassifySource(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price Source", 'Pricing', 'Source', 'Master', 999);
    end;

    local procedure ClassifyWorksheet(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price Worksheet Line", 'Pricing', 'Worksheet', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Pricing;  // Need to add Pricing to enum
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