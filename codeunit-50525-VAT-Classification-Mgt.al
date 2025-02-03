codeunit 50525 "VAT Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyCalculation(RecordDeletion);
        ClassifyClause(RecordDeletion);
        ClassifyLedger(RecordDeletion);
        ClassifyRateChange(RecordDeletion);
        ClassifyRegistration(RecordDeletion);
        ClassifyReporting(RecordDeletion);
        ClassifySetup(RecordDeletion);
        ClassifyVATRelated(RecordDeletion);
        ClassifyVATTables(RecordDeletion);
    end;



    local procedure ClassifyVATTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Setup Posting Groups", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Assisted Setup Templates", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Assisted Setup Bus. Grp.", 'VAT', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyVATRelated(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Alt. Cust. VAT Reg.", 'VAT', 'Registration', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"ECSL VAT Report Line Relation", 'VAT', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Reg. No. Srv. Template", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Reg. No. Srv Config", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Statement Template", 'VAT', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Amount Line", 'VAT', 'Document', 'Document', 300);
    end;

    local procedure ClassifyCalculation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Posting Parameters", 'VAT', 'Calculation', 'Setup', 999);
    end;

    local procedure ClassifyClause(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Clause", 'VAT', 'Clause', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Clause Translation", 'VAT', 'Clause', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Clause by Doc. Type", 'VAT', 'Clause', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Clause by Doc. Type Trans.", 'VAT', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Entry", 'VAT', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"G/L Entry - VAT Entry Link", 'VAT', 'Ledger', 'Ledger', 100);
    end;

    local procedure ClassifyRateChange(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Rate Change Setup", 'VAT', 'RateChange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Rate Change Conversion", 'VAT', 'RateChange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Rate Change Log Entry", 'VAT', 'RateChange', 'History', 200);
    end;

    local procedure ClassifyRegistration(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Registration Log", 'VAT', 'Registration', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"VAT Registration Log Details", 'VAT', 'Registration', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"VAT Registration No. Format", 'VAT', 'Registration', 'Setup', 999);
    end;

    local procedure ClassifyReporting(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Report Header", 'VAT', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Report Line", 'VAT', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Report Archive", 'VAT', 'Reporting', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"VAT Statement Line", 'VAT', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Statement Name", 'VAT', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"ECSL VAT Report Line", 'VAT', 'Reporting', 'Document', 300);

        // Setup
        ClassifyTable(RecordDeletion, Database::"VAT Return Period", 'VAT', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Report Setup", 'VAT', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Reports Configuration", 'VAT', 'Reporting', 'Setup', 999);

        // Documents
        ClassifyTable(RecordDeletion, Database::"VAT Statement Report Line", 'VAT', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Report Line Relation", 'VAT', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Report Error Log", 'VAT', 'Reporting', 'Document', 300);
    end;

    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Setup", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Posting Setup", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Business Posting Group", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Product Posting Group", 'VAT', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Reporting Code", 'VAT', 'Setup', 'Setup', 999);
    end;

    procedure SuggestRecordsToDelete()
    begin
        SetSuggestedTable(Database::"VAT Entry");
        SetSuggestedTable(Database::"VAT Report Line");
        SetSuggestedTable(Database::"ECSL VAT Report Line");
        SetSuggestedTable(Database::"VAT Registration Log");
        SetSuggestedTable(Database::"VAT Rate Change Log Entry");
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::VAT;  // Could be changed to VAT if enum is extended
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
            'History':
                exit(RecordDeletionTableType::History);
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
}