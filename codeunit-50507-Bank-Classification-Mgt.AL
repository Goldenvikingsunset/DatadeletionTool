codeunit 50507 "Bank Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyBankAccount(RecordDeletion);
        ClassifyCheckLedger(RecordDeletion);
        ClassifyDirectDebit(RecordDeletion);
        ClassifyPayments(RecordDeletion);
        ClassifyBankReconciliation(RecordDeletion);
        ClassifyPositivePay(RecordDeletion);
        ClassifyBankingTables(RecordDeletion);
        ClassifyUKMTDTables(RecordDeletion);
    end;

    local procedure ClassifyUKMTDTables(var RecordDeletion: Record "Record Deletion")
    begin
        // MTD Current

        // MTD Historical
        ClassifyTable(RecordDeletion, Database::"MTD-Liability", 'VAT', 'MTD', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"MTD-Payment", 'VAT', 'MTD', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"MTD-Return Details", 'VAT', 'MTD', 'History', 200);

        // MTD Fraud Prevention
        ClassifyTable(RecordDeletion, Database::"MTD-Session Fraud Prev. Hdr", 'VAT', 'MTD', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"MTD-Default Fraud Prev. Hdr", 'VAT', 'MTD', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"MTD-Missing Fraud Prev. Hdr", 'VAT', 'MTD', 'History', 200);
    end;


    local procedure ClassifyBankingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Bank Export/Import Setup", 'Bank', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Credit Transfer Register", 'Bank', 'Transfer', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Credit Transfer Entry", 'Bank', 'Transfer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Credit Trans Re-export History", 'Bank', 'Transfer', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"SWIFT Code", 'Bank', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bank Clearing Standard", 'Bank', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Outstanding Bank Transaction", 'Bank', 'Transaction', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Application Proposal", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Applied Payment Entry", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Payment Recon. Hdr", 'Bank', 'Payment', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Payment Recon. Line", 'Bank', 'Payment', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Payment Matching Details", 'Bank', 'Payment', 'Document', 300);
        // BACS Tables
        ClassifyTable(RecordDeletion, Database::"BACS Ledger Entry", 'Bank', 'BACS', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"BACS Register", 'Bank', 'BACS', 'Register', 150);

    end;

    local procedure ClassifyBankAccount(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Bank Account", 'Bank', 'BankAccount', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Bank Account Posting Group", 'Bank', 'BankAccount', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Online Bank Acc. Link", 'Bank', 'BankAccount', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bank Account Balance Buffer", 'Bank', 'BankAccount', 'Document', 300);
    end;

    local procedure ClassifyCheckLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Check Ledger Entry", 'Bank', 'Check', 'Ledger', 100);
    end;

    local procedure ClassifyDirectDebit(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Direct Debit Collection", 'Bank', 'DirectDebit', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Direct Debit Collection Entry", 'Bank', 'DirectDebit', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"SEPA Direct Debit Mandate", 'Bank', 'DirectDebit', 'Master', 999);
    end;

    local procedure ClassifyPayments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Payment Export Data", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Registration Buffer", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Method", 'Bank', 'Payment', 'Setup', 999);
        // Payment Processing
        ClassifyTable(RecordDeletion, Database::"Payment Jnl. Export Error Text", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Export Remittance Text", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Text-to-Account Mapping", 'Bank', 'Payment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bank Pmt. Appl. Rule", 'Bank', 'Payment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bank Pmt. Appl. Settings", 'Bank', 'Payment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Direct Debit Collection Buffer", 'Bank', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Ledger Entry Matching Buffer", 'Bank', 'Payment', 'Document', 300);

        // Positive Pay
        ClassifyTable(RecordDeletion, Database::"Positive Pay Header", 'Bank', 'PositivePay', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Positive Pay Detail", 'Bank', 'PositivePay', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Positive Pay Footer", 'Bank', 'PositivePay', 'Document', 300);
    end;

    local procedure ClassifyBankReconciliation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Bank Acc. Reconciliation", 'Bank', 'Reconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Acc. Reconciliation Line", 'Bank', 'Reconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Statement Matching Buffer", 'Bank', 'Reconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Stmt Multiple Match Line", 'Bank', 'Reconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Account Statement", 'Bank', 'Statement', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Account Statement Line", 'Bank', 'Statement', 'Document', 300);
    end;

    local procedure ClassifyPositivePay(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Positive Pay Entry", 'Bank', 'PositivePay', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Positive Pay Entry Detail", 'Bank', 'PositivePay', 'Document', 300);
    end;

    procedure SuggestRecordsToDelete()
    begin
        SetSuggestedTable(Database::"Bank Account Ledger Entry");
        SetSuggestedTable(Database::"Check Ledger Entry");
        SetSuggestedTable(Database::"Bank Acc. Reconciliation");
        SetSuggestedTable(Database::"Bank Acc. Reconciliation Line");
        SetSuggestedTable(Database::"Bank Statement Matching Buffer");
        SetSuggestedTable(Database::"Direct Debit Collection");
        SetSuggestedTable(Database::"Direct Debit Collection Entry");
        SetSuggestedTable(Database::"Payment Export Data");
        SetSuggestedTable(Database::"Positive Pay Entry");
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Bank;
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