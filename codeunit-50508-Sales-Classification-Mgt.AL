codeunit 50508 "Sales Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cust. Invoice Disc.", 'Sales', 'Setup', 'Setup', 999);

        ClassifyCustomer(RecordDeletion);
        ClassifyDocuments(RecordDeletion);
        ClassifyArchive(RecordDeletion);
        ClassifyHistory(RecordDeletion);
        ClassifyPricing(RecordDeletion);
        ClassifyReceivables(RecordDeletion);
        ClassifyReminder(RecordDeletion);
        ClassifyStandardSales(RecordDeletion);
        ClassifyPriceRelatedTables(RecordDeletion);
        ClassifySalesEntityTables(RecordDeletion);
        ClassifyTeamManagementTables(RecordDeletion);
        ClassifyMarketingTables(RecordDeletion);
        ClassifyContactTables(RecordDeletion);
    end;

    local procedure ClassifyContactTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Contact Core
        ClassifyTable(RecordDeletion, Database::"Contact Information Buffer", 'Sales', 'Contact', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Contact Alt. Addr. Date Range", 'Sales', 'Contact', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Contact Web Source", 'Sales', 'Contact', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cont. Duplicate Search String", 'Sales', 'Contact', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Contact Profile Answer", 'Sales', 'Contact', 'Document', 300);

        // Contact Setup/Master Data
        ClassifyTable(RecordDeletion, Database::"Web Source", 'Sales', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Salutation", 'Sales', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Salutation Formula", 'Sales', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Job Responsibility", 'Sales', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Contact Job Responsibility", 'Sales', 'Contact', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Organizational Level", 'Sales', 'Contact', 'Setup', 999);
    end;

    local procedure ClassifyMarketingTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Marketing Setup
        ClassifyTable(RecordDeletion, Database::"Marketing Setup", 'Sales', 'Marketing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Mailing Group", 'Sales', 'Marketing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Industry Group", 'Sales', 'Marketing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Interaction Group", 'Sales', 'Marketing', 'Setup', 999);

        // Segmentation
        ClassifyTable(RecordDeletion, Database::"Logged Segment", 'Sales', 'Marketing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Segment Wizard Filter", 'Sales', 'Marketing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Segment Criteria Line", 'Sales', 'Marketing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Saved Segment Criteria", 'Sales', 'Marketing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Saved Segment Criteria Line", 'Sales', 'Marketing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Rating", 'Sales', 'Marketing', 'Ledger', 100);
    end;

    local procedure ClassifyTeamManagementTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Team Setup
        ClassifyTable(RecordDeletion, Database::Team, 'Sales', 'Team', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Team Salesperson", 'Sales', 'Team', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Activity Step", 'Sales', 'Team', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Rlshp. Mgt. Comment Line", 'Sales', 'Team', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Close Opportunity Code", 'Sales', 'Team', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Delivery Sorter", 'Sales', 'Team', 'Setup', 999);
    end;

    local procedure ClassifySalesEntityTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Sales Documents
        ClassifyTable(RecordDeletion, Database::"Sales Order Entity Buffer", 'Sales', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Quote Entity Buffer", 'Sales', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Invoice Entity Aggregate", 'Sales', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Invoice Line Aggregate", 'Sales', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Cr. Memo Entity Buffer", 'Sales', 'API', 'Document', 300);
    end;

    local procedure ClassifyPriceRelatedTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Sales Price", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Line Discount", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchase Price", 'Purchase', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Purchase Line Discount", 'Purchase', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Discount Access", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Price Worksheet", 'Sales', 'Pricing', 'Document', 300);
    end;

    local procedure ClassifyStandardSales(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Standard Sales Code", 'Sales', 'Standard', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Standard Sales Line", 'Sales', 'Standard', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Standard Customer Sales Code", 'Sales', 'Standard', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Prepayment %", 'Sales', 'Standard', 'Document', 300);
    end;

    local procedure ClassifyCustomer(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::Customer, 'Sales', 'Customer', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Customer Bank Account", 'Sales', 'Customer', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Customer Posting Group", 'Sales', 'Customer', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Alt. Customer Posting Group", 'Sales', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Ship-to Address", 'Sales', 'Customer', 'Master', 999);
    end;

    local procedure ClassifyDocuments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Sales Header", 'Sales', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Line", 'Sales', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Comment Line", 'Sales', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Planning Line", 'Sales', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Charge Assignment (Sales)", 'Sales', 'Document', 'Document', 300);
    end;

    local procedure ClassifyArchive(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Sales Header Archive", 'Sales', 'Archive', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Sales Line Archive", 'Sales', 'Archive', 'Archive', 100);
        ClassifyTable(RecordDeletion, Database::"Sales Comment Line Archive", 'Sales', 'Archive', 'Archive', 100);
    end;

    local procedure ClassifyHistory(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Sales Invoice Header", 'Sales', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Sales Invoice Line", 'Sales', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Sales Shipment Header", 'Sales', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Sales Shipment Line", 'Sales', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Sales Cr.Memo Header", 'Sales', 'History', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Sales Cr.Memo Line", 'Sales', 'History', 'History', 200);
    end;

    local procedure ClassifyPricing(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Price Calculation Setup", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Price Calculation Buffer", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sales Price Access", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Customer Price Group", 'Sales', 'Pricing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Customer Discount Group", 'Sales', 'Pricing', 'Setup', 999);
    end;

    local procedure ClassifyReceivables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cust. Ledger Entry", 'Sales', 'Receivables', 'Ledger', 100);
        ClassifyTable(RecordDeletion, Database::"Detailed Cust. Ledg. Entry", 'Sales', 'Receivables', 'Ledger', 100);
    end;

    local procedure ClassifyReminder(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Reminder Header", 'Sales', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reminder Line", 'Sales', 'Reminder', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Issued Reminder Header", 'Sales', 'Reminder', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Issued Reminder Line", 'Sales', 'Reminder', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Reminder Terms", 'Sales', 'Reminder', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reminder Level", 'Sales', 'Reminder', 'Setup', 999);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::Sales;
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
            'Archive':
                exit(RecordDeletionTableType::Archive);
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