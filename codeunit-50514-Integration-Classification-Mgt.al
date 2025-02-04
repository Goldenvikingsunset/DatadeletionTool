codeunit 50514 "Integration Class Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyD365Sales(RecordDeletion);
        ClassifyDataverse(RecordDeletion);
        ClassifyEntity(RecordDeletion);
        ClassifyPowerBI(RecordDeletion);
        ClassifySynchEngine(RecordDeletion);
        ClassifyIntegrationSetupTables(RecordDeletion);
        ClassifyCRMDocumentTables(RecordDeletion);
        ClassifyCRMSetupTables(RecordDeletion);
        ClassifyInteractionTables(RecordDeletion);
        ClassifySynchronizationTables(RecordDeletion);
        ClassifyShopifyPaymentTables(RecordDeletion);
    end;

    local procedure ClassifyShopifyPaymentTables(var RecordDeletion: Record "Record Deletion")
    begin

        ClassifyTable(RecordDeletion, Database::"Shpfy Refund Header", 'System', 'Shopify', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Shpfy Refund Line", 'System', 'Shopify', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Shpfy Catalog", 'System', 'Shopify', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Shpfy Catalog Price", 'System', 'Shopify', 'Document', 300);
    end;

    local procedure ClassifyIntegrationSetupTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Integration Setup - System module
        ClassifyTable(RecordDeletion, Database::"CRM Connection Setup", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Integration Table Mapping", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Integration Field Mapping", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CDS BC Table Relation", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CDS Field Security Profile", 'System', 'Setup', 'Setup', 999);

        // Manual Integration Setup
        ClassifyTable(RecordDeletion, Database::"Man. Integration Table Mapping", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Man. Integration Field Mapping", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Man. Int. Field Mapping", 'System', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyCRMDocumentTables(var RecordDeletion: Record "Record Deletion")
    begin
        // CRM Documents - Sales module since they're sales-related
        ClassifyTable(RecordDeletion, Database::"CRM Quote", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Quotedetail", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Salesorder", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Salesorderdetail", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Invoice", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Invoicedetail", 'Sales', 'CRM', 'Document', 300);

        // Base Records
        ClassifyTable(RecordDeletion, Database::"CRM Account", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Contact", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Product", 'Sales', 'CRM', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Contract", 'Sales', 'CRM', 'Document', 300);
    end;

    local procedure ClassifyCRMSetupTables(var RecordDeletion: Record "Record Deletion")
    begin
        // CRM Setup tables - System module since they're system configuration
        ClassifyTable(RecordDeletion, Database::"CRM Systemuser", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Organization", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Businessunit", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Team", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Role", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Systemuserroles", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Option Mapping", 'System', 'CRM', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CRM Post Configuration", 'System', 'CRM', 'Setup', 999);
    end;

    local procedure ClassifyInteractionTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Interaction tables - Sales module since they're CRM/sales related
        ClassifyTable(RecordDeletion, Database::"Communication Method", 'Sales', 'Interaction', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Interaction Tmpl. Language", 'Sales', 'Interaction', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Segment Interaction Language", 'Sales', 'Interaction', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"To-do Interaction Language", 'Sales', 'Interaction', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Inter. Log Entry Comment Line", 'Sales', 'Interaction', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Interaction Merge Data", 'Sales', 'Interaction', 'Document', 300);
    end;

    local procedure ClassifySynchronizationTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Sync tables - System module since they're system integration components
        ClassifyTable(RecordDeletion, Database::"Integration Synch. Job", 'System', 'Sync', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Integration Synch. Job Errors", 'System', 'Sync', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Synch Status", 'System', 'Sync', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Synch. Job Status Cue", 'System', 'Sync', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Full Synch. Review Line", 'System', 'Sync', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Synch. Conflict Buffer", 'System', 'Sync', 'Document', 300);
    end;

    local procedure ClassifyD365Sales(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"CDS BC Table Relation", 'System', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CDS Company", 'System', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Account", 'Sales', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Product", 'Sales', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Quote", 'Sales', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CRM Integration Record", 'System', 'D365Sales', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"O365 HTML Template", 'System', 'Office365', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"O365 Payment Service Logo", 'System', 'Office365', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"O365 Brand Color", 'System', 'Office365', 'Setup', 999);
    end;

    local procedure ClassifyDataverse(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"CDS Connection Setup", 'System', 'Dataverse', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CDS BC Table Relation", 'System', 'Dataverse', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CDS Field Security Profile", 'System', 'Dataverse', 'Setup', 999);
    end;

    local procedure ClassifyEntity(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Dataverse Entity Change", 'System', 'Entity', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Entity Text", 'System', 'Entity', 'Setup', 999);
    end;

    local procedure ClassifyPowerBI(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Power BI Chart Buffer", 'System', 'PowerBI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Power BI Report Labels", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Default Selection", 'System', 'PowerBI', 'Setup', 999);
    end;

    local procedure ClassifySynchEngine(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Integration Field Mapping", 'System', 'SynchEngine', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Integration Synch. Job", 'System', 'SynchEngine', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Integration Table Mapping", 'System', 'SynchEngine', 'Setup', 999);
    end;

    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
    begin
        if RecordDeletion.Get(TableNo) then begin
            case Module of
                'System':
                    RecordDeletion.Module := RecordDeletionModule::System;
                'Sales':
                    RecordDeletion.Module := RecordDeletionModule::Sales;
                'Foundation':
                    RecordDeletion.Module := RecordDeletionModule::Foundation;
            end;
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