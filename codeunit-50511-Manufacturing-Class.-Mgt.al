codeunit 50511 "Manufacturing Class. Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Production Core
        ClassifyProductionOrders(RecordDeletion);
        ClassifyBOM(RecordDeletion);
        ClassifyBOMTables(RecordDeletion);
        ClassifyRouting(RecordDeletion);
        ClassifyRoutingTables(RecordDeletion);

        // Resource Management
        ClassifyWorkCenters(RecordDeletion);
        ClassifyMachineCenters(RecordDeletion);
        ClassifyCapacity(RecordDeletion);

        // Planning & Forecasting
        ClassifyProductionPlanningTables(RecordDeletion);
        ClassifyForecast(RecordDeletion);
        ClassifyFamily(RecordDeletion);

        // Quality & Standards
        ClassifyQuality(RecordDeletion);
        ClassifyStandardCost(RecordDeletion);

        // Setup
        ClassifySetup(RecordDeletion);
    end;
    #endregion

    #region Production Core
    local procedure ClassifyProductionOrders(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Production Order", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Line", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Component", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Routing Line", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Capacity Need", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Comment Line", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Routing Personnel", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Routing Tool", 'Manufacturing', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Rtng Qlty Meas.", 'Manufacturing', 'Production', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Rtng Comment Line", 'Manufacturing', 'Production', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Prod. Order Comp. Cmt Line", 'Manufacturing', 'Production', 'Document', 300);
    end;

    local procedure ClassifyBOM(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Production BOM Header", 'Manufacturing', 'BOM', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Production BOM Line", 'Manufacturing', 'BOM', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Production BOM Version", 'Manufacturing', 'BOM', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Production BOM Comment Line", 'Manufacturing', 'BOM', 'Document', 300);
    end;

    local procedure ClassifyBOMTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Where-Used Line", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Production Matrix  BOM Entry", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Production Matrix BOM Line", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Shop Calendar", 'Manufacturing', 'BOM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"BOM Buffer", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"BOM Warning Log", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Availability by Date", 'Manufacturing', 'BOM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Memoized Result", 'Manufacturing', 'BOM', 'Document', 300);
    end;

    local procedure ClassifyRouting(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Routing Header", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Line", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Tool", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Personnel", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Quality Measure", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Task", 'Manufacturing', 'Routing', 'Master', 999);
    end;

    local procedure ClassifyRoutingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Routing Version", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Task Personnel", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Task Tool", 'Manufacturing', 'Routing', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Capacity Unit of Measure", 'Manufacturing', 'Routing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Link", 'Manufacturing', 'Routing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Comment Line", 'Manufacturing', 'Routing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Manufacturing Comment Line", 'Manufacturing', 'Routing', 'Document', 300);
    end;
    #endregion

    #region Resource Management
    local procedure ClassifyWorkCenters(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Work Center", 'Manufacturing', 'WorkCenter', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Work Center Group", 'Manufacturing', 'WorkCenter', 'Master', 999);
    end;

    local procedure ClassifyMachineCenters(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Machine Center", 'Manufacturing', 'MachineCenter', 'Master', 999);
    end;

    local procedure ClassifyCapacity(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Capacity Ledger Entry", 'Manufacturing', 'Capacity', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Calendar Entry", 'Manufacturing', 'Capacity', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Shop Calendar Working Days", 'Manufacturing', 'Capacity', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Shop Calendar Holiday", 'Manufacturing', 'Capacity', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Capacity Constrained Resource", 'Manufacturing', 'Capacity', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Calendar Absence Entry", 'Manufacturing', 'Capacity', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Registered Absence", 'Manufacturing', 'Capacity', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Load Buffer", 'Manufacturing', 'Capacity', 'Document', 300);
    end;
    #endregion

    #region Planning & Forecasting
    local procedure ClassifyProductionPlanningTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Planning Tables
        ClassifyTable(RecordDeletion, Database::"Order Promising Line", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Order Promising Setup", 'Manufacturing', 'Planning', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Planning Parameters", 'Manufacturing', 'Planning', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Untracked Planning Element", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Inventory Profile Track Buffer", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Inventory Profile", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Action Message Entry", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Planning Buffer", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Availability Line", 'Manufacturing', 'Planning', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Planning Routing Line", 'Manufacturing', 'Planning', 'Document', 300);
    end;

    local procedure ClassifyForecast(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Production Forecast Entry", 'Manufacturing', 'Forecast', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Production Forecast Name", 'Manufacturing', 'Forecast', 'Master', 999);
    end;

    local procedure ClassifyFamily(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Family, 'Manufacturing', 'Family', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Family Line", 'Manufacturing', 'Family', 'Document', 300);
    end;
    #endregion

    #region Quality & Standards
    local procedure ClassifyQuality(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Quality Measure", 'Manufacturing', 'Quality', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Task Quality Measure", 'Manufacturing', 'Quality', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Routing Quality Measure", 'Manufacturing', 'Quality', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Task Description", 'Manufacturing', 'Quality', 'Setup', 999);
    end;

    local procedure ClassifyStandardCost(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Standard Cost Worksheet", 'Manufacturing', 'StandardCost', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Standard Cost Worksheet Name", 'Manufacturing', 'StandardCost', 'Setup', 999);
    end;
    #endregion

    #region Setup
    local procedure ClassifySetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Manufacturing Setup", 'Manufacturing', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Manufacturing User Template", 'Manufacturing', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Scrap, 'Manufacturing', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::Stop, 'Manufacturing', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Work Shift", 'Manufacturing', 'Setup', 'Setup', 999);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Manufacturing;
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
    #endregion
}