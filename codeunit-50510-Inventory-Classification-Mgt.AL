codeunit 50510 "Inventory Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Item Translation", 'Inventory', 'Master', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Picture Buffer", 'Inventory', 'Document', 'Document', 300);
        ClassifyInventorySetup(RecordDeletion);
        ClassifyItemTables(RecordDeletion);
        ClassifyItemJournals(RecordDeletion);
        ClassifyItemLedger(RecordDeletion);
        ClassifyItemTracking(RecordDeletion);
        ClassifyPhysicalInventory(RecordDeletion);
        ClassifyLocationSetup(RecordDeletion);
        ClassifyPlanningTables(RecordDeletion);
        ClassifyInternationalTrade(RecordDeletion);
        ClassifyInventoryAndItemTables(RecordDeletion);
        ClassifyItemAttributeTables(RecordDeletion);
        ClassifyItemAnalysisTables(RecordDeletion);
        ClassifyInventoryTrackingTables(RecordDeletion);
        ClassifyPhysicalInventoryTables(RecordDeletion);
        ClassifyInventoryDocumentTables(RecordDeletion);
        ClassifyInventoryCostingTables(RecordDeletion);
        ClassifyInventoryPeriodTables(RecordDeletion);
        ClassifyTransferTables(RecordDeletion);
    end;

    local procedure ClassifyTransferTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Transfer Header", 'Inventory', 'Transfer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Transfer Line", 'Inventory', 'Transfer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Transfer Route", 'Inventory', 'Transfer', 'Setup', 999);
    end;

    local procedure ClassifyInventoryPeriodTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Inventory Period", 'Inventory', 'Period', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Inventory Period Entry", 'Inventory', 'Period', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Inventory Report Header", 'Inventory', 'Period', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Inventory Report Entry", 'Inventory', 'Period', 'Document', 300);
    end;

    local procedure ClassifyInventoryCostingTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Cost Calculation
        ClassifyTable(RecordDeletion, Database::"Average Cost Calc. Overview", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cost Element Buffer", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cost Adj. Item Bucket", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Charge", 'Inventory', 'Costing', 'Setup', 999);

        // Cost Adjustment
        ClassifyTable(RecordDeletion, Database::"Cost Adjustment Log", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cost Adjustment Detailed Log", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Avg. Cost Adjmt. Entry Point", 'Inventory', 'Costing', 'Document', 300);

        // Posting Buffers
        ClassifyTable(RecordDeletion, Database::"Post Value Entry to G/L", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Post to G/L Test Buffer", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Rounding Residual Buffer", 'Inventory', 'Costing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Statistics Buffer", 'Inventory', 'Costing', 'Document', 300);
    end;

    local procedure ClassifyInventoryDocumentTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Documents
        ClassifyTable(RecordDeletion, Database::"Invt. Document Header", 'Inventory', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Document Line", 'Inventory', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Receipt Header", 'Inventory', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Receipt Line", 'Inventory', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Shipment Header", 'Inventory', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invt. Shipment Line", 'Inventory', 'Document', 'Document', 300);

        // Direct Transfer
        ClassifyTable(RecordDeletion, Database::"Direct Trans. Header", 'Inventory', 'Transfer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Direct Trans. Line", 'Inventory', 'Transfer', 'Document', 300);
    end;

    local procedure ClassifyPhysicalInventoryTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Physical Inventory Records
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Record Header", 'Inventory', 'PhysicalInventory', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Record Line", 'Inventory', 'PhysicalInventory', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Tracking", 'Inventory', 'PhysicalInventory', 'Document', 300);

        // Posted Physical Inventory
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Order Hdr", 'Inventory', 'PhysicalInventory', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Record Line", 'Inventory', 'PhysicalInventory', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Tracking", 'Inventory', 'PhysicalInventory', 'History', 200);

        // Buffers
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Count Buffer", 'Inventory', 'PhysicalInventory', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cost Share Buffer", 'Inventory', 'PhysicalInventory', 'Document', 300);
    end;

    local procedure ClassifyInventoryTrackingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Invt. Order Tracking", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Exp. Invt. Order Tracking", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Pstd.Exp.Invt.Order.Tracking", 'Inventory', 'Tracking', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Whse. Item Entry Relation", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Tracing History Buffer", 'Inventory', 'Tracking', 'Document', 300);
    end;

    local procedure ClassifyItemAnalysisTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Item Budget
        ClassifyTable(RecordDeletion, Database::"Item Budget Name", 'Inventory', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Budget Entry", 'Inventory', 'Analysis', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Budget Buffer", 'Inventory', 'Analysis', 'Document', 300);

        // Item Analysis
        ClassifyTable(RecordDeletion, Database::"Item Analysis View", 'Inventory', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Analysis View Filter", 'Inventory', 'Analysis', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Analysis View Entry", 'Inventory', 'Analysis', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Analysis View Budg. Entry", 'Inventory', 'Analysis', 'Document', 300);
    end;

    local procedure ClassifyItemAttributeTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Item Attribute", 'Inventory', 'Attribute', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Attribute Value", 'Inventory', 'Attribute', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Attribute Translation", 'Inventory', 'Attribute', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Attr. Value Translation", 'Inventory', 'Attribute', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Attribute Value Selection", 'Inventory', 'Attribute', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Attribute Value Mapping", 'Inventory', 'Attribute', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Filter Item Attributes Buffer", 'Inventory', 'Attribute', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item From Picture Buffer", 'Inventory', 'AI', 'Document', 300);
    end;

    local procedure ClassifyInventoryAndItemTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Inventory
        ClassifyTable(RecordDeletion, Database::"Stockkeeping Unit Comment Line", 'Inventory', 'Core', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Substitution", 'Inventory', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Substitution Condition", 'Inventory', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Nonstock Item Setup", 'Inventory', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Manufacturer", 'Inventory', 'Core', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Identifier", 'Inventory', 'Core', 'Setup', 999);

        // Item Tracking
        ClassifyTable(RecordDeletion, Database::"Item Tracking Code", 'Inventory', 'Tracking', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Tracking Comment", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Entry Relation", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Tracking Setup", 'Inventory', 'Tracking', 'Setup', 999);

        // Posted Documents
        ClassifyTable(RecordDeletion, Database::"Transfer Shipment Header", 'Inventory', 'Transfer', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Transfer Shipment Line", 'Inventory', 'Transfer', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Transfer Receipt Header", 'Inventory', 'Transfer', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Transfer Receipt Line", 'Inventory', 'Transfer', 'History', 200);
    end;

    local procedure ClassifyInventorySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Item Vendor", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Work Type", 'Inventory', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Inventory Buffer", 'Inventory', 'Buffer', 'Document', 300);
    end;

    local procedure ClassifyInternationalTrade(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Transaction Type", 'Inventory', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Transport Method", 'Inventory', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Tariff Number", 'Inventory', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Entry/Exit Point", 'Inventory', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Area, 'Inventory', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Transaction Specification", 'Foundation', 'InternationalTrade', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Territory, 'Inventory', 'InternationalTrade', 'Setup', 999);
    end;

    local procedure ClassifyItemTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Item, 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Category", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Unit of Measure", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Variant", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Reference", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Nonstock Item", 'Inventory', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Availability at Date", 'Inventory', 'Availability', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Entry Summary", 'Inventory', 'Item', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Application Entry", 'Inventory', 'Item', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Item Discount Group", 'Inventory', 'Item', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Copy Item Parameters", 'Inventory', 'Item', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Copy Item Buffer", 'Inventory', 'Item', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Availability Buffer", 'Inventory', 'Item', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Res. Availability Buffer", 'Inventory', 'Item', 'Document', 300);
    end;

    local procedure ClassifyItemJournals(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Item Journal Line", 'Inventory', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Journal Batch", 'Inventory', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Journal Template", 'Inventory', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Item Journal", 'Inventory', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Item Journal Line", 'Inventory', 'Journal', 'Document', 300);
    end;

    local procedure ClassifyItemLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Item Ledger Entry", 'Inventory', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Value Entry", 'Inventory', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Item Register", 'Inventory', 'Ledger', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Value Entry Relation", 'Inventory', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Cost Entry", 'Inventory', 'Ledger', 'Ledger', 100);
    end;

    local procedure ClassifyItemTracking(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Lot No. Information", 'Inventory', 'Tracking', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Serial No. Information", 'Inventory', 'Tracking', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Item Tracing Buffer", 'Inventory', 'Tracking', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Reservation Entry", 'Inventory', 'Tracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Tracking Specification", 'Inventory', 'ItemTracking', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Application Entry History", 'Inventory', 'ItemTracking', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Reservation Wksh. Batch", 'Inventory', 'Reservation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reservation Wksh. Line", 'Inventory', 'Reservation', 'Document', 300);
    end;

    local procedure ClassifyPhysicalInventory(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Phys. Inventory Ledger Entry", 'Inventory', 'Counting', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Order Header", 'Inventory', 'Counting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Order Line", 'Inventory', 'Counting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Record Hdr", 'Inventory', 'Counting', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Order Line", 'Inventory', 'Counting', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Pstd. Phys. Invt. Tracking", 'Inventory', 'Counting', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Phys. Invt. Counting Period", 'Inventory', 'Counting', 'Setup', 999);
    end;

    local procedure ClassifyLocationSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Location, 'Inventory', 'Location', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Stockkeeping Unit", 'Inventory', 'Location', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Inventory Posting Setup", 'Inventory', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyPlanningTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Planning Assignment", 'Inventory', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Planning Component", 'Inventory', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Planning Error Log", 'Inventory', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Requisition Line", 'Inventory', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reservation Worksheet Log", 'Inventory', 'Reservation', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Inventory;
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