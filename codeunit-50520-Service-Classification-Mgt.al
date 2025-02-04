codeunit 50520 "Service Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyContract(RecordDeletion);
        ClassifyDocument(RecordDeletion);
        ClassifyItem(RecordDeletion);
        ClassifyLedger(RecordDeletion);
        ClassifyMaintenance(RecordDeletion);
        ClassifyPricing(RecordDeletion);
        ClassifyServiceManagementTables(RecordDeletion);
        ClassifyFieldServiceTables(RecordDeletion);
        ClassifyBookingTables(RecordDeletion);
        ClassifyServicePricingTables(RecordDeletion);
        ClassifyServiceArchiveTables(RecordDeletion);
        ClassifyStandardServiceTables(RecordDeletion);
        ClassifyServiceResourceTables(RecordDeletion);
        ClassifyTroubleshootingTables(RecordDeletion);
        ClassifyServiceDocumentTables(RecordDeletion);
    end;

    local procedure ClassifyServiceDocumentTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Service Shipment
        ClassifyTable(RecordDeletion, Database::"Service Shipment Header", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Shipment Line", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Shipment Item Line", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Invoice Header", 'Service', 'Document', 'Document', 300);

        // Service Contract
        ClassifyTable(RecordDeletion, Database::"Service Contract Account Group", 'Service', 'Contract', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Contract/Service Discount", 'Service', 'Contract', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Filed Contract Service Hour", 'Service', 'Contract', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Filed Contract/Serv. Discount", 'Service', 'Contract', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Filed Serv. Contract Cmt. Line", 'Service', 'Contract', 'History', 200);
    end;

    local procedure ClassifyServiceResourceTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Resource Setup
        ClassifyTable(RecordDeletion, Database::"Resource Service Zone", 'Service', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Zone", 'Service', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Resource Location", 'Service', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Work-Hour Template", 'Service', 'Resource', 'Setup', 999);

        // Skills
        ClassifyTable(RecordDeletion, Database::"Resource Skill", 'Service', 'Resource', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Skill Code", 'Service', 'Resource', 'Setup', 999);

        // Allocation
        ClassifyTable(RecordDeletion, Database::"Service Order Allocation", 'Service', 'Resource', 'Document', 300);
    end;

    local procedure ClassifyTroubleshootingTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Troubleshooting
        ClassifyTable(RecordDeletion, Database::"Troubleshooting Setup", 'Service', 'Troubleshooting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Troubleshooting Header", 'Service', 'Troubleshooting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Troubleshooting Line", 'Service', 'Troubleshooting', 'Document', 300);

        // Fault Codes
        ClassifyTable(RecordDeletion, Database::"Symptom Code", 'Service', 'Troubleshooting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Fault Reason Code", 'Service', 'Troubleshooting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Fault Area/Symptom Code", 'Service', 'Troubleshooting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Fault/Resol. Cod. Relationship", 'Service', 'Troubleshooting', 'Setup', 999);
    end;

    local procedure ClassifyFieldServiceTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Field Service
        ClassifyTable(RecordDeletion, Database::"FS Connection Setup", 'Service', 'FieldService', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FS Work Order Type", 'Service', 'FieldService', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"FS Work Order Substatus", 'Service', 'FieldService', 'Setup', 999);

        // Assets
        ClassifyTable(RecordDeletion, Database::"FS Customer Asset", 'Service', 'FieldService', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"FS Customer Asset Category", 'Service', 'FieldService', 'Setup', 999);

        // Resource Booking
        ClassifyTable(RecordDeletion, Database::"FS Bookable Resource", 'Service', 'FieldService', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"FS Bookable Resource Booking", 'Service', 'FieldService', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"FS BookableResourceBookingHdr", 'Service', 'FieldService', 'Document', 300);
    end;

    local procedure ClassifyBookingTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Booking
        ClassifyTable(RecordDeletion, Database::"Booking Service", 'Service', 'Booking', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Booking Staff", 'Service', 'Booking', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Booking Item", 'Service', 'Booking', 'Master', 999);

        // Booking Integration
        ClassifyTable(RecordDeletion, Database::"Booking Service Mapping", 'Service', 'Booking', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Booking Mailbox", 'Service', 'Booking', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Booking Sync", 'Service', 'Booking', 'Document', 300);
    end;

    local procedure ClassifyServicePricingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Serv. Price Group Setup", 'Service', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Price Adjustment Group", 'Service', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Serv. Price Adjustment Detail", 'Service', 'Pricing', 'Document', 300);
    end;

    local procedure ClassifyServiceArchiveTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Header Archive", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Item Line Archive", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Line Archive", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Comment Line Archive", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Order Allocat. Archive", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Cr.Memo Header", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Cr.Memo Line", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Invoice Line", 'Service', 'Archive', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Service Shipment Buffer", 'Service', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Order Posting Buffer", 'Service', 'Buffer', 'Document', 300);


    end;

    local procedure ClassifyStandardServiceTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Standard Service Code", 'Service', 'Standard', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Service Line", 'Service', 'Standard', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Service Item Gr. Code", 'Service', 'Standard', 'Setup', 999);
    end;

    local procedure ClassifyServiceManagementTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Service Tables
        ClassifyTable(RecordDeletion, Database::"Service Order Type", 'Service', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Hour", 'Service', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Mgt. Setup", 'Service', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Shelf", 'Service', 'Core', 'Setup', 999);

        // Service Features
        ClassifyTable(RecordDeletion, Database::"Loaner", 'Service', 'Loaner', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Loaner Entry", 'Service', 'Loaner', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Status Priority Setup", 'Service', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Email Queue", 'Service', 'Process', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Document Register", 'Service', 'Process', 'Register', 150);

        // Service Contracts
        ClassifyTable(RecordDeletion, Database::"Contract Group", 'Service', 'Contract', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Contract Template", 'Service', 'Contract', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Filed Service Contract Header", 'Service', 'Contract', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Filed Contract Line", 'Service', 'Contract', 'History', 200);
    end;

    local procedure ClassifyContract(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Contract Header", 'Service', 'Contract', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Contract Line", 'Service', 'Contract', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Contract Change Log", 'Service', 'Contract', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Contract Gain/Loss Entry", 'Service', 'Contract', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Customer Sales Buffer", 'Sales', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Item Trend Buffer", 'Service', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Contract Trend Buffer", 'Service', 'Buffer', 'Document', 300);
    end;

    local procedure ClassifyDocument(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Header", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Item Line", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Line", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Comment Line", 'Service', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Document Log", 'Service', 'Document', 'History', 200);
    end;

    local procedure ClassifyItem(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Item", 'Service', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Service Item Component", 'Service', 'Item', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Service Item Group", 'Service', 'Item', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Item Log", 'Service', 'Item', 'History', 200);
    end;

    local procedure ClassifyLedger(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Ledger Entry", 'Service', 'Ledger', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Service Register", 'Service', 'Ledger', 'Register', 150);
        ClassifyTable(RecordDeletion, Database::"Warranty Ledger Entry", 'Service', 'Ledger', 'Ledger', 100);
    end;

    local procedure ClassifyMaintenance(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Fault Area", 'Service', 'Maintenance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Fault Code", 'Service', 'Maintenance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Resolution Code", 'Service', 'Maintenance', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Repair Status", 'Service', 'Maintenance', 'Setup', 999);
    end;

    local procedure ClassifyPricing(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Service Cost", 'Service', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Price Group", 'Service', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Service Line Price Adjmt.", 'Service', 'Pricing', 'Document', 300);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := Enum::"Record Deletion Module"::Service;
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