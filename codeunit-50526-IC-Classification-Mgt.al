codeunit 50526 "IC Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Master Data
        ClassifyPartner(RecordDeletion);
        ClassifyGLAccount(RecordDeletion);
        ClassifyBankAccount(RecordDeletion);
        ClassifyDimension(RecordDeletion);

        // Document Flow
        ClassifyInbox(RecordDeletion);
        ClassifyOutbox(RecordDeletion);
        ClassifyDataExchange(RecordDeletion);

        // Additional Data
        ClassifyComment(RecordDeletion);
        ClassifySetup(RecordDeletion);
        ClassifyIntercompany(RecordDeletion);
    end;
    #endregion

    #region Master Data
    local procedure ClassifyPartner(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC Partner", 'Intercompany', 'Partner', 'Master', 999);
    end;

    local procedure ClassifyGLAccount(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC G/L Account", 'Intercompany', 'GLAccount', 'Master', 999);
    end;

    local procedure ClassifyBankAccount(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC Bank Account", 'Intercompany', 'BankAccount', 'Master', 999);
    end;

    local procedure ClassifyDimension(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC Dimension", 'Intercompany', 'Dimension', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"IC Dimension Value", 'Intercompany', 'Dimension', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"IC Document Dimension", 'Intercompany', 'Dimension', 'Document', 300);
    end;
    #endregion

    #region Document Flow
    local procedure ClassifyInbox(var RecordDeletion: Record "Record Deletion")
    begin
        // Active Documents
        ClassifyTable(RecordDeletion, Database::"IC Inbox Transaction", 'Intercompany', 'Inbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox Purchase Line", 'Intercompany', 'Inbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox Purchase Header", 'Intercompany', 'Inbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox Sales Header", 'Intercompany', 'Inbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox Sales Line", 'Intercompany', 'Inbox', 'Document', 300);

        // History
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Trans.", 'Intercompany', 'Inbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Purch. Header", 'Intercompany', 'Inbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Purch. Line", 'Intercompany', 'Inbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Sales Header", 'Intercompany', 'Inbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Sales Line", 'Intercompany', 'Inbox', 'History', 200);
    end;

    local procedure ClassifyOutbox(var RecordDeletion: Record "Record Deletion")
    begin
        // Active Documents
        ClassifyTable(RecordDeletion, Database::"IC Outbox Transaction", 'Intercompany', 'Outbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Outbox Purchase Header", 'Intercompany', 'Outbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Outbox Purchase Line", 'Intercompany', 'Outbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Outbox Sales Header", 'Intercompany', 'Outbox', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Outbox Sales Line", 'Intercompany', 'Outbox', 'Document', 300);

        // History
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Trans.", 'Intercompany', 'Outbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Purch. Hdr", 'Intercompany', 'Outbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Purch. Line", 'Intercompany', 'Outbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Sales Header", 'Intercompany', 'Outbox', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Sales Line", 'Intercompany', 'Outbox', 'History', 200);
    end;

    local procedure ClassifyDataExchange(var RecordDeletion: Record "Record Deletion")
    begin
        // Buffer Tables
        ClassifyTable(RecordDeletion, Database::"Buffer IC Comment Line", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Document Dimension", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Jnl. Line", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Purchase Line", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Purch Header", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Sales Header", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Sales Line", 'Intercompany', 'DataExchange', 'Document', 300);

        // Notifications
        ClassifyTable(RecordDeletion, Database::"IC Incoming Notification", 'Intercompany', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Outgoing Notification", 'Intercompany', 'DataExchange', 'Document', 300);
    end;
    #endregion

    #region Additional Data
    local procedure ClassifyComment(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC Comment Line", 'Intercompany', 'Comment', 'Document', 300);
    end;

    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"IC Setup", 'Intercompany', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Intercompany Setup Diagnostic", 'Intercompany', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyIntercompany(var RecordDeletion: Record "Record Deletion")
    begin
        // Active Entries
        ClassifyTable(RecordDeletion, Database::"IC Outbox Jnl. Line", 'Intercompany', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox Jnl. Line", 'Intercompany', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"IC Inbox/Outbox Jnl. Line Dim.", 'Intercompany', 'Journal', 'Document', 300);

        // History
        ClassifyTable(RecordDeletion, Database::"Handled IC Outbox Jnl. Line", 'Intercompany', 'Journal', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Handled IC Inbox Jnl. Line", 'Intercompany', 'Journal', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Buffer IC Inbox Transaction", 'Intercompany', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Buffer IC InOut Jnl. Line Dim.", 'Intercompany', 'Buffer', 'Document', 300);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Intercompany; // Could be changed to Intercompany if enum is extended
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
    #endregion
}