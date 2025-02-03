codeunit 50519 "Assembly Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyAssemblyDoc(RecordDeletion);
        ClassifyAssemblyHistory(RecordDeletion);
        ClassifyAssemblySetup(RecordDeletion);
        ClassifyAssemblyComments(RecordDeletion);
    end;

    local procedure ClassifyAssemblyDoc(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Assembly Header", 'Assembly', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Assembly Line", 'Assembly', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Assemble-to-Order Link", 'Assembly', 'Document', 'Document', 300);
    end;

    local procedure ClassifyAssemblyHistory(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Posted Assembly Header", 'Assembly', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Assembly Line", 'Assembly', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Assemble-to-Order Link", 'Assembly', 'History', 'History', 200);
    end;

    local procedure ClassifyAssemblySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Assembly Setup", 'Assembly', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyAssemblyComments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Assembly Comment Line", 'Assembly', 'Comment', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Assembly;
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