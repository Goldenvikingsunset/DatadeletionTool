codeunit 50512 "Warehouse Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyActivity(RecordDeletion);
        ClassifyBinStructure(RecordDeletion);
        ClassifyDocuments(RecordDeletion);
        ClassifyHistory(RecordDeletion);
        ClassifyInternalMovement(RecordDeletion);
        ClassifyJournal(RecordDeletion);
        ClassifyLedger(RecordDeletion);
        ClassifyTracking(RecordDeletion);
        ClassifyWarehouseTables(RecordDeletion);
        ClassifyWarehouseOperationTables(RecordDeletion);
        ClassifyWarehouseWorksheetTables(RecordDeletion);
    end;



    local procedure ClassifyWarehouseWorksheetTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Worksheet Setup
        ClassifyTable(RecordDeletion, Database::"Whse. Worksheet Template", 'Warehouse', 'Worksheet', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Whse. Worksheet Name", 'Warehouse', 'Worksheet', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Whse. Worksheet Line", 'Warehouse', 'Worksheet', 'Document', 300);

        // Bin Management
        ClassifyTable(RecordDeletion, Database::"Bin Template", 'Warehouse', 'Bin', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bin Creation Wksh. Template", 'Warehouse', 'Bin', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bin Creation Wksh. Name", 'Warehouse', 'Bin', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bin Creation Worksheet Line", 'Warehouse', 'Bin', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bin Content Buffer", 'Warehouse', 'Bin', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Lot Bin Buffer", 'Warehouse', 'Bin', 'Document', 300);
    end;

    local procedure ClassifyWarehouseOperationTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Internal Put-away
        ClassifyTable(RecordDeletion, Database::"Whse. Internal Put-away Header", 'Warehouse', 'Operation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Whse. Internal Put-away Line", 'Warehouse', 'Operation', 'Document', 300);

        // Internal Pick
        ClassifyTable(RecordDeletion, Database::"Whse. Internal Pick Header", 'Warehouse', 'Operation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Whse. Internal Pick Line", 'Warehouse', 'Operation', 'Document', 300);

        // Setup and Parameters
        ClassifyTable(RecordDeletion, Database::"Create Pick Parameters", 'Warehouse', 'Operation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Warehouse Reason Code", 'Warehouse', 'Operation', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Report Selection Warehouse", 'Warehouse', 'Operation', 'Setup', 999);
    end;

    local procedure ClassifyWarehouseTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Warehouse
        ClassifyTable(RecordDeletion, Database::"Warehouse Employee", 'Warehouse', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Warehouse Class", 'Warehouse', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Special Equipment", 'Warehouse', 'Core', 'Setup', 999);

        // Warehouse Operations
        ClassifyTable(RecordDeletion, Database::"Put-away Template Header", 'Warehouse', 'Operations', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Put-away Template Line", 'Warehouse', 'Operations', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Whse. Put-away Request", 'Warehouse', 'Operations', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Whse. Pick Request", 'Warehouse', 'Operations', 'Document', 300);

        // Warehouse History
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Put-away Header", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Put-away Line", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Pick Header", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Pick Line", 'Warehouse', 'History', 'History', 200);

        // Setup
        ClassifyTable(RecordDeletion, Database::"Warehouse Setup", 'Warehouse', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Whse. Post Parameters", 'Warehouse', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Warehouse Source Filter", 'Warehouse', 'Setup', 'Setup', 999);


        // Operations
        ClassifyTable(RecordDeletion, Database::"Warehouse Request", 'Warehouse', 'Operation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Whse. Cross-Dock Opportunity", 'Warehouse', 'Operation', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Comment Line", 'Warehouse', 'Operation', 'Document', 300);
    end;

    local procedure ClassifyActivity(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Warehouse Activity Header", 'Warehouse', 'Activity', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Activity Line", 'Warehouse', 'Activity', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Registered Whse. Activity Hdr.", 'Warehouse', 'Activity', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Registered Whse. Activity Line", 'Warehouse', 'Activity', 'History', 200);
    end;

    local procedure ClassifyBinStructure(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Bin, 'Warehouse', 'Structure', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Bin Content", 'Warehouse', 'Structure', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::Zone, 'Warehouse', 'Structure', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Bin Type", 'Warehouse', 'Structure', 'Setup', 999);
    end;

    local procedure ClassifyDocuments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Warehouse Receipt Header", 'Warehouse', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Receipt Line", 'Warehouse', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Shipment Header", 'Warehouse', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Shipment Line", 'Warehouse', 'Document', 'Document', 300);
    end;

    local procedure ClassifyHistory(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Posted Whse. Receipt Header", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Whse. Receipt Line", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Whse. Shipment Header", 'Warehouse', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Whse. Shipment Line", 'Warehouse', 'History', 'History', 200);
    end;

    local procedure ClassifyInternalMovement(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Internal Movement Header", 'Warehouse', 'Internal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Internal Movement Line", 'Warehouse', 'Internal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Registered Invt. Movement Hdr.", 'Warehouse', 'Internal', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Registered Invt. Movement Line", 'Warehouse', 'Internal', 'History', 200);
    end;

    local procedure ClassifyJournal(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Warehouse Journal Line", 'Warehouse', 'Journal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Journal Batch", 'Warehouse', 'Journal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Warehouse Journal Template", 'Warehouse', 'Journal', 'Setup', 999);
    end;

    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Warehouse Entry", 'Warehouse', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Warehouse Register", 'Warehouse', 'Ledger', 'Register', 150);
    end;

    local procedure ClassifyTracking(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Whse. Item Tracking Line", 'Warehouse', 'Tracking', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Warehouse;
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
            'Ledger':
                exit(RecordDeletionTableType::Ledger);
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
}