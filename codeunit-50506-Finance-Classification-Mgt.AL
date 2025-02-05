codeunit 50506 "Finance Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Financial Classifications
        ClassifyGeneralLedger(RecordDeletion);
        ClassifyDimensions(RecordDeletion);
        ClassifyVAT(RecordDeletion);
        ClassifyReceivablesPayables(RecordDeletion);

        // Setup & Configuration
        ClassifyPostingSetup(RecordDeletion);
        ClassifyDocumentSetup(RecordDeletion);
        ClassifyTaxSetup(RecordDeletion);
        ClassifyCurrencyManagement(RecordDeletion);
        ClassifyDeferrals(RecordDeletion);

        // Reporting & Analysis
        ClassifyFinancialReporting(RecordDeletion);
        ClassifyFinancialReports(RecordDeletion);
        ClassifyAnalytics(RecordDeletion);
        ClassifyConsolidation(RecordDeletion);

        // Collection Management
        ClassifyReminders(RecordDeletion);
        ClassifyFinanceCharges(RecordDeletion);

        // Payment Processing
        ClassifyPaymentReconciliation(RecordDeletion);
        ClassifyPaymentServices(RecordDeletion);

        // Additional Financial
        ClassifyPayrollTables(RecordDeletion);
        ClassifyAnalysisRelatedTables(RecordDeletion);
        ClassifyFinanceEntityTables(RecordDeletion);
        ClassifyFinanceBuffers(RecordDeletion);
    end;
    #endregion

    #region Core Financial
    local procedure ClassifyGeneralLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"G/L Entry", 'Finance', 'GeneralLedger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"G/L Register", 'Finance', 'GeneralLedger', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"G/L Account", 'Finance', 'GeneralLedger', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Line", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Batch", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Template", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"G/L Budget Entry", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Budget Name", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Posted Gen. Journal Batch", 'Finance', 'GeneralLedger', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Copy Gen. Journal Parameters", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"G/L Account Where-Used", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reversal Entry", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Exch. Rate Adjmt. Ledg. Entry", 'Finance', 'GeneralLedger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Gen. Jnl. Allocation", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Account Net Change", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bank Account Ledger Entry", 'Finance', 'GeneralLedger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Standard General Journal", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard General Journal Line", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Method Translation", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"G/L Entry Posting Preview", 'Finance', 'PostingPreview', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Entry Posting Preview", 'Finance', 'PostingPreview', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L - Item Ledger Relation", 'Finance', 'GeneralLedger', 'Ledger', 100);
    end;

    local procedure ClassifyDimensions(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Dimension, 'Finance', 'Dimension', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Dimension Value", 'Finance', 'Dimension', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Default Dimension", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dimension Set Entry", 'Finance', 'Dimension', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Dimension Set Tree Node", 'Finance', 'Dimension', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Analysis by Dim. User Param.", 'Finance', 'Analysis', 'Setup', 999);
        // Core Dimension Setup
        ClassifyTable(RecordDeletion, Database::"Default Dimension Priority", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dimension Set ID Filter Line", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dim. Value per Account", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Gen. Jnl. Dim. Filter", 'Finance', 'Dimension', 'Setup', 999);

        // Dimension Buffers
        ClassifyTable(RecordDeletion, Database::"Dimension Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Code Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Selection Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Selected Dimension", 'Finance', 'Dimension', 'Document', 300);

        // Setup and Master Data
        ClassifyTable(RecordDeletion, Database::"Dimension Combination", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dimension Value Combination", 'Finance', 'Dimension', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dimension Translation", 'Finance', 'Dimension', 'Setup', 999);

        // Buffer Tables
        ClassifyTable(RecordDeletion, Database::"Dimension ID Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Entry Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Code Amount Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Posting Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimension Set Entry Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reclas. Dimension Set Buffer", 'Finance', 'Dimension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Change Global Dim. Log Entry", 'Finance', 'Dimension', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Change Global Dim. Header", 'Finance', 'Dimension', 'Document', 300);

        // Setup and Configuration
        ClassifyTable(RecordDeletion, Database::"Dim Correction Blocked Setup", 'Finance', 'DimCorrection', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dim Correct Selection Criteria", 'Finance', 'DimCorrection', 'Setup', 999);

        // Processing
        ClassifyTable(RecordDeletion, Database::"Dimension Correction", 'Finance', 'DimCorrection', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dim Correction Change", 'Finance', 'DimCorrection', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dim Correction Entry Log", 'Finance', 'DimCorrection', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dim Correction Set Buffer", 'Finance', 'DimCorrection', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invalidated Dim Correction", 'Finance', 'DimCorrection', 'Document', 300);
    end;

    local procedure ClassifyVAT(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"VAT Entry", 'Finance', 'VAT', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"VAT Posting Setup", 'Finance', 'VAT', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Business Posting Group", 'Finance', 'VAT', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Product Posting Group", 'Finance', 'VAT', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"VAT Report Header", 'Finance', 'VAT', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"VAT Report Line", 'Finance', 'VAT', 'Document', 300);
    end;

    local procedure ClassifyReceivablesPayables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Detailed Cust. Ledg. Entry", 'Finance', 'Receivables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Detailed Vendor Ledg. Entry", 'Finance', 'Payables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Cust. Ledger Entry", 'Finance', 'Receivables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Vendor Ledger Entry", 'Finance', 'Payables', 'Ledger', 100);
    end;
    #endregion

    #region Setup & Configuration
    local procedure ClassifyPostingSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Gen. Business Posting Group", 'Finance', 'PostingSetup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Gen. Product Posting Group", 'Finance', 'PostingSetup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"General Posting Setup", 'Finance', 'PostingSetup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Drop Shpt. Post. Buffer", 'Finance', 'PostingSetup', 'Document', 300);
    end;

    local procedure ClassifyDocumentSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Incoming Documents Setup", 'Finance', 'Documents', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Incoming Document Approver", 'Finance', 'Documents', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Posted Docs. With No Inc. Buf.", 'Finance', 'Documents', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Currency Amount", 'Finance', 'Amounts', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Currency", 'Finance', 'Amounts', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Customer Amount", 'Finance', 'Amounts', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Amount", 'Finance', 'Amounts', 'Document', 300);
    end;

    local procedure ClassifyTaxSetup(var RecordDeletion: Record "Record Deletion")
    begin
        // Tax Areas
        ClassifyTable(RecordDeletion, Database::"Tax Area", 'Finance', 'Tax', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Area Line", 'Finance', 'Tax', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Area Translation", 'Finance', 'Tax', 'Setup', 999);

        // Tax Configuration
        ClassifyTable(RecordDeletion, Database::"Tax Jurisdiction", 'Finance', 'Tax', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Jurisdiction Translation", 'Finance', 'Tax', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Group", 'Finance', 'Tax', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Detail", 'Finance', 'Tax', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Tax Setup", 'Finance', 'Tax', 'Setup', 999);
    end;

    local procedure ClassifyCurrencyManagement(var RecordDeletion: Record "Record Deletion")
    begin
        // Currency Setup
        ClassifyTable(RecordDeletion, Database::"Currency Exchange Rate", 'Finance', 'Currency', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Currency for Fin. Charge Terms", 'Finance', 'Currency', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Currency for Reminder Level", 'Finance', 'Currency', 'Setup', 999);

        // Currency Buffers
        ClassifyTable(RecordDeletion, Database::"Adjust Exchange Rate Buffer", 'Finance', 'Currency', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Currency Total Buffer", 'Finance', 'Currency', 'Document', 300);
    end;

    local procedure ClassifyDeferrals(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Deferral Template", 'Finance', 'Deferral', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Deferral Header", 'Finance', 'Deferral', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Deferral Line", 'Finance', 'Deferral', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Deferral Header", 'Finance', 'Deferral', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Deferral Line", 'Finance', 'Deferral', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Deferral Posting Buffer", 'Finance', 'Deferral', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Deferral Header Archive", 'Finance', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Deferral Line Archive", 'Finance', 'Archive', 'History', 200);
    end;
    #endregion

    #region Reporting & Analysis
    local procedure ClassifyFinancialReporting(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Acc. Sched. KPI Web Srv. Setup", 'Finance', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Acc. Sched. KPI Web Srv. Line", 'Finance', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Acc. Sched. KPI Buffer", 'Finance', 'Reporting', 'Document', 300);
    end;

    local procedure ClassifyFinancialReports(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Acc. Schedule Line", 'Finance', 'Reports', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Acc. Schedule Name", 'Finance', 'Reports', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Column Layout", 'Finance', 'Reports', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Column Layout Name", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Acc. Sched. Cell Value", 'Foundation', 'Reporting', 'Setup', 999);
    end;

    local procedure ClassifyAnalytics(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Analysis View", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis View Entry", 'Finance', 'Analysis', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Analysis View Budget Entry", 'Finance', 'Analysis', 'Document', 300);
        // Analysis Setup
        ClassifyTable(RecordDeletion, Database::"Analysis View", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis View Filter", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis by Dim. Parameters", 'Finance', 'Analysis', 'Setup', 999);

        // Analysis Entries
        ClassifyTable(RecordDeletion, Database::"Analysis View Entry", 'Finance', 'Analysis', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Analysis View Budget Entry", 'Finance', 'Analysis', 'Document', 300);

        ClassifyTable(RecordDeletion, Database::"Account Schedules Chart Setup", 'Finance', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Acc. Sched. Chart Setup Line", 'Finance', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Analysis Report Chart Setup", 'Finance', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Report Chart Line", 'Finance', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Chart Setup", 'Finance', 'CashFlow', 'Setup', 999);
    end;

    local procedure ClassifyConsolidation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Business Unit", 'Finance', 'Consolidation', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Consolidation Process", 'Finance', 'Consolidation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Consolidation Account", 'Finance', 'Consolidation', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Bus. Unit Consolidation Data", 'Finance', 'Consolidation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Net Balances Parameters", 'Finance', 'Consolidation', 'Setup', 999);
    end;
    #endregion

    #region Collection Management
    local procedure ClassifyReminders(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Reminder Text", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Comment Line", 'Finance', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reminder/Fin. Charge Entry", 'Finance', 'Reminder', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Finance Charge Text", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Finance Charge Terms", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Attachment Text", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Email Text", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Attachment Text Line", 'Finance', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Line Fee Note on Report Hist.", 'Finance', 'Reminder', 'History', 200);
    end;

    local procedure ClassifyFinanceCharges(var RecordDeletion: Record "Record Deletion")
    begin
        // Active Finance Charges
        ClassifyTable(RecordDeletion, Database::"Finance Charge Memo Header", 'Finance', 'FinanceCharge', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Finance Charge Memo Line", 'Finance', 'FinanceCharge', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Fin. Charge Comment Line", 'Finance', 'FinanceCharge', 'Document', 300);

        // Posted/Issued Finance Charges
        ClassifyTable(RecordDeletion, Database::"Issued Fin. Charge Memo Header", 'Finance', 'FinanceCharge', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Issued Fin. Charge Memo Line", 'Finance', 'FinanceCharge', 'History', 200);

        // Setup
        ClassifyTable(RecordDeletion, Database::"Create Reminders Setup", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Issue Reminders Setup", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Send Reminders Setup", 'Finance', 'Reminder', 'Setup', 999);

        // Actions
        ClassifyTable(RecordDeletion, Database::"Reminder Action", 'Finance', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Action Group", 'Finance', 'Reminder', 'Setup', 999);

        // Logging
        ClassifyTable(RecordDeletion, Database::"Reminder Action Log", 'Finance', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reminder Action Group Log", 'Finance', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reminder Automation Error", 'Finance', 'Reminder', 'Document', 300);
    end;
    #endregion

    #region Payment Processing
    local procedure ClassifyPaymentReconciliation(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Payment Rec. Related Entry", 'Finance', 'PaymentReconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Pmt. Rec. Applied-to Entry", 'Finance', 'PaymentReconciliation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Allocation Policy", 'Finance', 'Allocation', 'Setup', 999);
    end;

    local procedure ClassifyPaymentServices(var RecordDeletion: Record "Record Deletion")
    begin
        // Payment Setup
        ClassifyTable(RecordDeletion, Database::"Payment Service Setup", 'Finance', 'Payment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Payment Reporting Argument", 'Finance', 'Payment', 'Document', 300);

        ClassifyTable(RecordDeletion, Database::"Cost Accounting Setup", 'Finance', 'CostAccounting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Additional Fee Setup", 'Finance', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Terms Translation", 'Finance', 'Reminder', 'Setup', 999);
    end;
    #endregion

    #region Additional Financial
    local procedure ClassifyPayrollTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Payroll Setup", 'Finance', 'Payroll', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Import G/L Transaction", 'Finance', 'Payroll', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payroll Import Buffer", 'Finance', 'Payroll', 'Document', 300);
    end;

    local procedure ClassifyAnalysisRelatedTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Analysis Field Value", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Report Name", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Line Template", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Type", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Line", 'Finance', 'Analysis', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Analysis Column Template", 'Finance', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Analysis Column", 'Finance', 'Analysis', 'Document', 300);
    end;

    local procedure ClassifyFinanceEntityTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Financial Reports
        ClassifyTable(RecordDeletion, Database::"Balance Sheet Buffer", 'Finance', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Trial Balance Entity Buffer", 'Finance', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Aged Report Entity", 'Finance', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Acc. Schedule Line Entity", 'Finance', 'API', 'Document', 300);

        // Tax Related
        ClassifyTable(RecordDeletion, Database::"Tax Area Buffer", 'Finance', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Tax Rate Buffer", 'Finance', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Tax Group Buffer", 'Finance', 'API', 'Document', 300);
    end;

    local procedure ClassifyFinanceBuffers(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Close Income Statement Buffer", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Budget Buffer", 'Finance', 'Budget', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Acc. Budget Buffer", 'Finance', 'Budget', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Account (Analysis View)", 'Finance', 'Analysis', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CV Ledger Entry Buffer", 'Finance', 'Ledger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Detailed CV Ledg. Entry Buffer", 'Finance', 'Ledger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reconcile CV Acc Buffer", 'Finance', 'Ledger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Entry No. Amount Buffer", 'Finance', 'Ledger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Account Category", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"G/L Account Source Currency", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Finance Charge Interest Rate", 'Finance', 'FinanceCharge', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Apply Unapply Parameters", 'Finance', 'GeneralLedger', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Payment Registration Setup", 'Finance', 'Payment', 'Setup', 999);

        // Exchange Rate Management
        ClassifyTable(RecordDeletion, Database::"Exch. Rate Adjmt. Buffer", 'Finance', 'Currency', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Exch. Rate Adjmt. Parameters", 'Finance', 'Currency', 'Setup', 999);

        ClassifyTable(RecordDeletion, Database::"G/L Acc. Balance/Budget Buffer", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Acc. Balance Buffer", 'Finance', 'GeneralLedger', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Receivables-Payables Buffer", 'Finance', 'Ledger', 'Document', 300);

        ClassifyTable(RecordDeletion, Database::"Payment Application Buffer", 'Finance', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Payment Period Setup", 'Finance', 'Payment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Accounting Period GB", 'Finance', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Fin. Charge Interest Rate", 'Finance', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Allocation Account", 'Finance', 'Allocation', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Alloc. Account Distribution", 'Finance', 'Allocation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Allocation Line", 'Finance', 'Allocation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Alloc. Acc. Manual Override", 'Finance', 'Allocation', 'Document', 300);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Finance;
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
    #endregion
}