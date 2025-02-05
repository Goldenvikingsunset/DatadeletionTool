codeunit 50504 "Foundation Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Setup Classifications
        ClassifySystemSetup(RecordDeletion);
        ClassifyCompanyTables(RecordDeletion);
        ClassifyFinancialSetup(RecordDeletion);
        ClassifyManufacturingSetup(RecordDeletion);

        // Master Data Classifications
        ClassifyAddressTables(RecordDeletion);
        ClassifyUOMTables(RecordDeletion);
        ClassifyShippingTables(RecordDeletion);
        ClassifyNoSeriesTables(RecordDeletion);

        // Document & Processing Classifications
        ClassifyAttachmentTables(RecordDeletion);
        ClassifyCommentTables(RecordDeletion);
        ClassifyExtendedTextTables(RecordDeletion);
        ClassifyNavigateTables(RecordDeletion);

        // Other Core Classifications
        ClassifyAuditCodeTables(RecordDeletion);
        ClassifyBatchProcessingTables(RecordDeletion);
        ClassifyCalendarTables(RecordDeletion);
        ClassifyPaymentTermsTables(RecordDeletion);
        ClassifyPeriodTables(RecordDeletion);
        ClassifyReportingTables(RecordDeletion);

        // Additional Classifications
        ClassifyBufferTables(RecordDeletion);
        ClassifyLicenseRelated(RecordDeletion);
        ClassifyDisputeManagement(RecordDeletion);
        ClassifyAttachments(RecordDeletion);
    end;
    #endregion

    #region Setup Classifications
    local procedure ClassifySystemSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Language, 'Foundation', 'SystemSetup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Salesperson/Purchaser", 'Foundation', 'SystemSetup', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Rounding Method", 'Foundation', 'SystemSetup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"User Time Register", 'Foundation', 'SystemSetup', 'Document', 300);
    end;

    local procedure ClassifyCompanyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Company Information", 'Foundation', 'Company', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Company Size", 'Foundation', 'Company', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Deposits Page Setup", 'Foundation', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyFinancialSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Exch. Rate Adjmt. Reg.", 'Foundation', 'Finance', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Financial Report", 'Foundation', 'Finance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Financial Report User Filters", 'Foundation', 'Finance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"General Ledger Setup", 'Foundation', 'Finance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Invoice Posting Parameters", 'Foundation', 'Finance', 'Setup', 999);
    end;

    local procedure ClassifyManufacturingSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"BOM Component", 'Foundation', 'Manufacturing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Inventory Posting Group", 'Foundation', 'Manufacturing', 'Setup', 999);
    end;
    #endregion

    #region Master Data Classifications
    local procedure ClassifyAddressTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Country/Region", 'Foundation', 'Address', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Country/Region Translation", 'Foundation', 'Address', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Post Code", 'Foundation', 'Address', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Address", 'Foundation', 'Address', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Custom Address Format", 'Foundation', 'Address', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Custom Address Format Line", 'Foundation', 'Address', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Postcode Service Config", 'Foundation', 'Address', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Autocomplete Address", 'Foundation', 'Address', 'Document', 300);
    end;

    local procedure ClassifyUOMTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Unit of Measure", 'Foundation', 'UOM', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Unit Group", 'Foundation', 'UOM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Unit of Measure Translation", 'Foundation', 'UOM', 'Setup', 999);
    end;

    local procedure ClassifyShippingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Shipment Method", 'Foundation', 'Shipping', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Shipment Method Translation", 'Foundation', 'Shipping', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Shipping Agent", 'Foundation', 'Shipping', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Shipping Agent Services", 'Foundation', 'Shipping', 'Master', 999);
    end;

    local procedure ClassifyNoSeriesTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"No. Series", 'Foundation', 'NoSeries', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"No. Series Line", 'Foundation', 'NoSeries', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"No. Series Relationship", 'Foundation', 'NoSeries', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"No. Series Tenant", 'Foundation', 'NoSeries', 'Setup', 999);
    end;
    #endregion

    #region Document Classifications
    local procedure ClassifyAttachmentTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Document Attachment", 'Foundation', 'Attachment', 'Document', 300);
    end;

    local procedure ClassifyCommentTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Comment Line", 'Foundation', 'Comment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Comment Line Archive", 'Foundation', 'Comment', 'Archive', 100);
    end;

    local procedure ClassifyExtendedTextTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Extended Text Header", 'Foundation', 'ExtendedText', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Extended Text Line", 'Foundation', 'ExtendedText', 'Document', 300);
    end;

    local procedure ClassifyNavigateTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Document Entry", 'Foundation', 'Navigate', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Order Tracking Entry", 'Foundation', 'Navigate', 'Document', 300);
    end;
    #endregion

    #region Core Classifications
    local procedure ClassifyAuditCodeTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Reason Code", 'Foundation', 'AuditCodes', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Return Reason", 'Foundation', 'AuditCodes', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Source Code", 'Foundation', 'AuditCodes', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Source Code Setup", 'Foundation', 'AuditCodes', 'Setup', 999);
    end;

    local procedure ClassifyBatchProcessingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Batch Processing Parameter", 'Foundation', 'BatchProcessing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Batch Processing Artifact", 'Foundation', 'BatchProcessing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Batch Processing Session Map", 'Foundation', 'BatchProcessing', 'Document', 300);
    end;

    local procedure ClassifyCalendarTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Base Calendar", 'Foundation', 'Calendar', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Base Calendar Change", 'Foundation', 'Calendar', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Customized Calendar Change", 'Foundation', 'Calendar', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Customized Calendar Entry", 'Foundation', 'Calendar', 'Document', 300);
    end;

    local procedure ClassifyPaymentTermsTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Payment Terms", 'Foundation', 'PaymentTerms', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Payment Term Translation", 'Foundation', 'PaymentTerms', 'Setup', 999);
    end;

    local procedure ClassifyPeriodTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Accounting Period", 'Foundation', 'Period', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Date Compr. Register", 'Foundation', 'Period', 'Register', 150);
    end;

    local procedure ClassifyReportingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Custom Report Layout", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Document Sending Profile", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Electronic Document Format", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Report Layout Selection", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Report List Translation", 'Foundation', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Report Selections", 'Foundation', 'Reporting', 'Setup', 999);
    end;
    #endregion

    #region Additional Classifications
    local procedure ClassifyBufferTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Processing Buffers
        ClassifyTable(RecordDeletion, Database::"Aging Band Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Posting Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invoice Post. Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invoice Posting Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Record Export Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Account Use Buffer", 'Foundation', 'Buffer', 'Document', 300);

        // Merge Buffers
        ClassifyTable(RecordDeletion, Database::"Merge Duplicates Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Merge Duplicates Line Buffer", 'Foundation', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Merge Duplicates Conflict", 'Foundation', 'Buffer', 'Document', 300);
    end;

    local procedure ClassifyLicenseRelated(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"License Agreement", 'Foundation', 'License', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Signup Context Values", 'Foundation', 'License', 'Setup', 999);
    end;

    local procedure ClassifyDisputeManagement(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Dispute Status", 'Foundation', 'Dispute', 'Setup', 999);
    end;

    local procedure ClassifyAttachments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Unlinked Attachment", 'Foundation', 'Attachment', 'Document', 300);
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
            'Archive':
                exit(RecordDeletionTableType::Archive);
            'Register':
                exit(RecordDeletionTableType::Register);
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