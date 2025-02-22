codeunit 50518 "eServices Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Document Services
        ClassifyEDocument(RecordDeletion);

        // Location Services
        ClassifyOnlineMap(RecordDeletion);
    end;
    #endregion

    #region Document Services
    local procedure ClassifyEDocument(var RecordDeletion: Record "Record Deletion")
    begin
        // Document Management
        ClassifyTable(RecordDeletion, Database::"Document Service Scenario", 'eServices', 'EDocument', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Incoming Document", 'eServices', 'EDocument', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Incoming Document Attachment", 'eServices', 'EDocument', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Inc. Doc. Attachment Overview", 'eServices', 'EDocument', 'Document', 300);

        // OCR Services
        ClassifyTable(RecordDeletion, Database::"OCR Service Setup", 'eServices', 'EDocument', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"OCR Service Document Template", 'eServices', 'EDocument', 'Setup', 999);
    end;
    #endregion

    #region Location Services
    local procedure ClassifyOnlineMap(var RecordDeletion: Record "Record Deletion")
    begin
        // Location Data
        ClassifyTable(RecordDeletion, Database::Geolocation, 'eServices', 'OnlineMap', 'Document', 300);

        // Map Configuration
        ClassifyTable(RecordDeletion, Database::"Online Map Setup", 'eServices', 'OnlineMap', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Online Map Parameter Setup", 'eServices', 'OnlineMap', 'Setup', 999);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Foundation;
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