codeunit 50517 "CRM Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyBusinessRelation(RecordDeletion);
        ClassifyCampaign(RecordDeletion);
        ClassifyContact(RecordDeletion);
        ClassifyDuplicates(RecordDeletion);
        ClassifyInteraction(RecordDeletion);
        ClassifyOpportunity(RecordDeletion);
        ClassifyProfiling(RecordDeletion);
        ClassifySegment(RecordDeletion);
        ClassifyToDo(RecordDeletion);
    end;

    local procedure ClassifyBusinessRelation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Business Relation", 'CRM', 'BusinessRelation', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Business Relation", 'CRM', 'BusinessRelation', 'Master', 999);
    end;

    local procedure ClassifyCampaign(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Campaign, 'CRM', 'Campaign', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Campaign Entry", 'CRM', 'Campaign', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Campaign Status", 'CRM', 'Campaign', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Campaign Target Group", 'CRM', 'Campaign', 'Document', 300);
    end;

    local procedure ClassifyContact(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Contact, 'CRM', 'Contact', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Alt. Address", 'CRM', 'Contact', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Mailing Group", 'CRM', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Industry Group", 'CRM', 'Contact', 'Setup', 999);
    end;

    local procedure ClassifyDuplicates(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Duplicate Search String Setup", 'CRM', 'Duplicates', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Duplicate", 'CRM', 'Duplicates', 'Document', 300);
    end;

    local procedure ClassifyInteraction(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Attachment, 'CRM', 'Interaction', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Interaction Log Entry", 'CRM', 'Interaction', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Interaction Template", 'CRM', 'Interaction', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Interaction Template Setup", 'CRM', 'Interaction', 'Setup', 999);
    end;

    local procedure ClassifyOpportunity(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Opportunity, 'CRM', 'Opportunity', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Opportunity Entry", 'CRM', 'Opportunity', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Sales Cycle", 'CRM', 'Opportunity', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Cycle Stage", 'CRM', 'Opportunity', 'Setup', 999);
    end;

    local procedure ClassifyProfiling(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Profile Questionnaire Header", 'CRM', 'Profiling', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Profile Questionnaire Line", 'CRM', 'Profiling', 'Document', 300);
    end;

    local procedure ClassifySegment(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Segment Header", 'CRM', 'Segment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Segment Line", 'CRM', 'Segment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Segment History", 'CRM', 'Segment', 'History', 200);
    end;

    local procedure ClassifyToDo(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"To-do", 'CRM', 'ToDo', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::Activity, 'CRM', 'ToDo', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::Attendee, 'CRM', 'ToDo', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Sales;
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