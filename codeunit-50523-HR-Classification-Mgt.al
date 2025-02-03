codeunit 50523 "HR Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyEmployee(RecordDeletion);
        ClassifyAbsence(RecordDeletion);
        ClassifyConfidential(RecordDeletion);
        ClassifyPayables(RecordDeletion);
        ClassifySetup(RecordDeletion);
        ClassifyQualification(RecordDeletion);
        ClassifyHumanResourceTables(RecordDeletion);
    end;

    local procedure ClassifyHumanResourceTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Human Resource Comment Line", 'HumanResource', 'Core', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Human Resource Unit of Measure", 'HumanResource', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Payable Employee Ledger Entry", 'HumanResource', 'Payroll', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Employee Payment Buffer", 'HumanResource', 'Payroll', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Human Resources Setup", 'HumanResource', 'Payroll', 'Document', 300);
    end;

    local procedure ClassifyEmployee(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Employee, 'HumanResource', 'Employee', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Employee Posting Group", 'HumanResource', 'Employee', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Alternative Address", 'HumanResource', 'Employee', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Employee Relative", 'HumanResource', 'Employee', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Employee Statistics Group", 'HumanResource', 'Employee', 'Setup', 999);
    end;

    local procedure ClassifyAbsence(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Employee Absence", 'HumanResource', 'Absence', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cause of Absence", 'HumanResource', 'Absence', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cause of Inactivity", 'HumanResource', 'Absence', 'Setup', 999);
    end;

    local procedure ClassifyConfidential(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Confidential Information", 'HumanResource', 'Confidential', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::Confidential, 'HumanResource', 'Confidential', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"HR Confidential Comment Line", 'HumanResource', 'Confidential', 'Document', 300);
    end;

    local procedure ClassifyPayables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Employee Ledger Entry", 'HumanResource', 'Payables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Detailed Employee Ledger Entry", 'HumanResource', 'Payables', 'Ledger', 100);
    end;

    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Human Resources Setup", 'HumanResource', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Employment Contract", 'HumanResource', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Grounds for Termination", 'HumanResource', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Union, 'HumanResource', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Employee Time Reg Buffer", 'HumanResource', 'API', 'Document', 300);
    end;

    local procedure ClassifyQualification(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Employee Qualification", 'HumanResource', 'Qualification', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Qualification, 'HumanResource', 'Qualification', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Misc. Article Information", 'HumanResource', 'Qualification', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Misc. Article", 'HumanResource', 'Qualification', 'Setup', 999);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::HumanResource;
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