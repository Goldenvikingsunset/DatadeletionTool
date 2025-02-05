codeunit 50509 "Purchase Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Master Data & Setup
        ClassifyVendor(RecordDeletion);
        ClassifySetup(RecordDeletion);

        // Document Management
        ClassifyDocuments(RecordDeletion);
        ClassifyJournals(RecordDeletion);
        ClassifyArchive(RecordDeletion);
        ClassifyHistory(RecordDeletion);

        // Financial Operations
        ClassifyPricing(RecordDeletion);
        ClassifyPayables(RecordDeletion);
        ClassifyPrepayment(RecordDeletion);
        ClassifyRemittance(RecordDeletion);

        // Analytics & Planning
        ClassifyStatistics(RecordDeletion);
        ClassifyPurchasePlanning(RecordDeletion);

        // Integration
        ClassifyPurchaseEntityTables(RecordDeletion);
    end;
    #endregion

    #region Master Data & Setup
    local procedure ClassifyVendor(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Vendor Data
        ClassifyTable(RecordDeletion, Database::Vendor, 'Purchase', 'Vendor', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Vendor Bank Account", 'Purchase', 'Vendor', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Order Address", 'Purchase', 'Vendor', 'Master', 999);

        // Vendor Setup
        ClassifyTable(RecordDeletion, Database::"Vendor Posting Group", 'Purchase', 'Vendor', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Alt. Vendor Posting Group", 'Purchase', 'Vendor', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Vendor", 'Purchase', 'Vendor', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Vendor Templ.", 'Purchase', 'Vendor', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchasing", 'Purchase', 'Vendor', 'Setup', 999);

        // Vendor Buffers
        ClassifyTable(RecordDeletion, Database::"Vendor Purchase Buffer", 'Purchase', 'Vendor', 'Document', 300);
    end;

    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchases & Payables Setup", 'Purchase', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchase Price Access", 'Purchase', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Vendor Amount", 'Purchase', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Vendor Invoice Disc.", 'Purchase', 'Setup', 'Setup', 999);
    end;
    #endregion

    #region Document Management
    local procedure ClassifyDocuments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Header", 'Purchase', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purchase Line", 'Purchase', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purch. Comment Line", 'Purchase', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Charge Assignment (Purch)", 'Purchase', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Standard Purchase Code", 'Purchase', 'Document', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Purchase Line", 'Purchase', 'Document', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Vendor Purchase Code", 'Purchase', 'Document', 'Setup', 999);
        // Returns
        ClassifyTable(RecordDeletion, Database::"Return Shipment Header", 'Purchase', 'Returns', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Return Shipment Line", 'Purchase', 'Returns', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Return Receipt Header", 'Purchase', 'Returns', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Return Receipt Line", 'Purchase', 'Returns', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Returns-Related Document", 'Purchase', 'Returns', 'Document', 300);
    end;

    local procedure ClassifyJournals(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Line", 'Purchase', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Template", 'Purchase', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Gen. Journal Batch", 'Purchase', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Posted Gen. Journal Line", 'Purchase', 'Journal', 'History', 200);
    end;

    local procedure ClassifyArchive(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Header Archive", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purchase Line Archive", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Comment Line Archive", 'Purchase', 'History', 'History', 200);
    end;

    local procedure ClassifyHistory(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purch. Inv. Header", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Inv. Line", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Rcpt. Header", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Rcpt. Line", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Cr. Memo Hdr.", 'Purchase', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Purch. Cr. Memo Line", 'Purchase', 'History', 'History', 200);
    end;
    #endregion

    #region Financial Operations
    local procedure ClassifyPricing(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Price Access", 'Purchase', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchase Discount Access", 'Purchase', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchase Price Access", 'Purchase', 'Pricing', 'Setup', 999);
    end;

    local procedure ClassifyPayables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Vendor Ledger Entry", 'Purchase', 'Payables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Detailed Vendor Ledg. Entry", 'Purchase', 'Payables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Payable Vendor Ledger Entry", 'Purchase', 'Payables', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Vendor Payment Buffer", 'Purchase', 'Payables', 'Document', 300);
    end;

    local procedure ClassifyPrepayment(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Prepayment %", 'Purchase', 'Prepayment', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Prepayment Inv. Line Buffer", 'Purchase', 'Prepayment', 'Document', 300);
    end;

    local procedure ClassifyRemittance(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Remit Address", 'Purchase', 'Remittance', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Remit Address Buffer", 'Purchase', 'Remittance', 'Document', 300);
    end;
    #endregion

    #region Analytics & Planning
    local procedure ClassifyStatistics(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Cue", 'Purchase', 'Statistics', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Vendor Ledger Entry Buffer", 'Purchase', 'Statistics', 'Document', 300);
    end;

    local procedure ClassifyPurchasePlanning(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Req. Wksh. Template", 'Purchase', 'Planning', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Requisition Wksh. Name", 'Purchase', 'Planning', 'Setup', 999);
    end;
    #endregion

    #region Integration
    local procedure ClassifyPurchaseEntityTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Purchase Order Entity Buffer", 'Purchase', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purch. Inv. Entity Aggregate", 'Purchase', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purch. Inv. Line Aggregate", 'Purchase', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purch. Cr. Memo Entity Buffer", 'Purchase', 'API', 'Document', 300);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Purchase;
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