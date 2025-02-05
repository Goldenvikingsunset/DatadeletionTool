codeunit 50505 "System Classification Mgt."
{
    #region Public
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core System Classifications
        ClassifySystemTables(RecordDeletion);
        ClassifyBufferTables(RecordDeletion);
        ClassifySystemBuffers(RecordDeletion);
        ClassifyUIElements(RecordDeletion);

        // Authentication & Security
        ClassifyAzureADTables(RecordDeletion);
        ClassifyOAuthTables(RecordDeletion);
        ClassifyPermissionsTables(RecordDeletion);
        ClassifyUserTables(RecordDeletion);

        // Integration & Data Exchange
        ClassifyDataExchangeTables(RecordDeletion);
        ClassifyEmailTables(RecordDeletion);
        ClassifyOfficeIntegrationTables(RecordDeletion);
        ClassifyPowerBITables(RecordDeletion);
        ClassifySharePointTables(RecordDeletion);
        ClassifyXMLTables(RecordDeletion);

        // Processing & Automation
        ClassifyJobQueueTables(RecordDeletion);
        ClassifyFlowTables(RecordDeletion);

        // Setup & Configuration
        ClassifyApplicationAreaTables(RecordDeletion);
        ClassifyModuleSetup(RecordDeletion);
        ClassifyConfigurationTables(RecordDeletion);
        ClassifyTemplates(RecordDeletion);

        // AI & Analytics
        ClassifyAITables(RecordDeletion);
        ClassifyGenericChartTables(RecordDeletion);
        ClassifyChartTables(RecordDeletion);

        // Development & Testing
        ClassifyDevToolsTables(RecordDeletion);
        ClassifyTestTables(RecordDeletion);
        ClassifyErrorMessageTables(RecordDeletion);

        // Business Process
        ClassifyChangeLogTables(RecordDeletion);
        ClassifyNotificationTables(RecordDeletion);
        ClassifyRapidStartTables(RecordDeletion);
        ClassifyRetentionPolicyTables(RecordDeletion);

        // Additional Classifications
        ClassifyBusinessUnitTables(RecordDeletion);
        ClassifyDataMigrationTables(RecordDeletion);
        ClassifyExtensionTables(RecordDeletion);
        ClassifyGuidedExperienceTables(RecordDeletion);
        ClassifyIsolatedStorageTables(RecordDeletion);
        ClassifyStructuralTables(RecordDeletion);
        ClassifyUKGovernmentTables(RecordDeletion);
        ClassifyUserCueTables(RecordDeletion);
        ClassifyUserProfileTables(RecordDeletion);
        ClassifyUtilityTables(RecordDeletion);
        ClassifyWordTemplateTables(RecordDeletion);

        // New Classifications
        ClassifyApprovalTables(RecordDeletion);
        ClassifyWorkflowTables(RecordDeletion);
        ClassifyPaymentTables(RecordDeletion);
        ClassifyWarehouseTables(RecordDeletion);
        ClassifyCueTables(RecordDeletion);
    end;
    #endregion

    #region Core System Classifications
    local procedure ClassifySystemTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Date Lookup Buffer", 'System', 'Core', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Media Repository", 'System', 'Core', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Object Translation", 'System', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Printer Selection", 'System', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Excel Buffer", 'System', 'Integration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"No. Series Generation", 'System', 'NoSeries', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"No. Series Generation Detail", 'System', 'NoSeries', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"No. Series Line", 'System', 'NoSeries', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Bar Chart Buffer", 'System', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Report Inbox", 'System', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Queue Category", 'System', 'JobQueue', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dimensions Template", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Trial Balance Setup", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Activities Cue", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"User Tours", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Field Monitoring Setup", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Edit in Excel Settings", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Custom Report Selection", 'System', 'Reporting', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Report Layout Update Log", 'System', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Office Add-in", 'System', 'Office', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Office Admin. Credentials", 'System', 'Office', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Office Job Journal", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Office Document Selection", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Office Contact Details", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Office Suggested Line Item", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Invoiced Booking Item", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Curr. Exch. Rate Update Setup", 'System', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Option Lookup Buffer", 'System', 'Setup', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Tenant Web Service Columns", 'System', 'Setup', 'Document', 300);

        ClassifyTable(RecordDeletion, Database::"Record Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Error Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Recorded Event Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"TempStack", 'System', 'Buffer', 'Document', 300);

        // New Tables
        ClassifyTable(RecordDeletion, Database::Currency, 'System', 'Core', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Finance Charge Terms", 'System', 'Core', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Responsibility Center", 'System', 'Core', 'Master', 999);
    end;

    local procedure ClassifyBufferTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Analysis Dim. Selection Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Record Selection Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Record Set Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Field Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"G/L Acc. Cat. Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Shipment Buffer", 'System', 'Buffer', 'Document', 300);

        // New Tables
        ClassifyTable(RecordDeletion, Database::"Contact Dupl. Details Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Reservation Entry Buffer", 'System', 'Buffer', 'Document', 300);
    end;

    local procedure ClassifySystemBuffers(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job Queue Entry Buffer", 'System', 'JobQueue', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Business Chart Buffer", 'System', 'Chart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Business Chart Map", 'System', 'Chart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Business Chart User Setup", 'System', 'Chart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Parallel Session Entry", 'System', 'Session', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Availability Info. Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflows Entries Buffer", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Azure AI Buffer", 'Finance', 'CashFlow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Excel Template Storage", 'System', 'Integration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"ATO Sales Buffer", 'Sales', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Res. Gr. Availability Buffer", 'Project', 'Resource', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Item Turnover Buffer", 'Inventory', 'Item', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"User Details", 'System', 'User', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Trailing Sales Orders Setup", 'Sales', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cash Flow Report Selection", 'Finance', 'CashFlow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Cost Budget Buffer", 'Finance', 'CostAccounting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Report Totals Buffer", 'System', 'Reporting', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Document Search Result", 'System', 'Search', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sorting Table", 'System', 'Core', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Data Privacy Entities", 'System', 'Privacy', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Privacy Records", 'System', 'Privacy', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Price and Line Disc Buff", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Purch. Price Line Disc. Buff.", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Trial Balance Cache", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Trial Balance Cache Info", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Top Customers By Sales Buffer", 'System', 'Buffer', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Connection", 'System', 'Service', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Named Forward Link", 'System', 'Service', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Notification Schedule", 'System', 'Service', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Sent Notification Entry", 'System', 'Service', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Notification Context", 'System', 'Service', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Restricted Record", 'System', 'Service', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dynamic Request Page Entity", 'System', 'DynamicPages', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Dynamic Request Page Field", 'System', 'DynamicPages', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"API Data Upgrade", 'System', 'Upgrade', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"No. Series Line Sales", 'System', 'NoSeries', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"No. Series Line Purchase", 'System', 'NoSeries', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Permission Set In Plan Buffer", 'System', 'Security', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Security Group Buffer", 'System', 'Security', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Security Group Member Buffer", 'System', 'Security', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"User Security Status", 'System', 'Security', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"AAD Application", 'System', 'Login', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"API Entities Setup", 'System', 'API', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"API Extension Upload", 'System', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Timeline Event", 'System', 'Timeline', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Timeline Event Change", 'System', 'Timeline', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Attachment Entity Buffer", 'System', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Picture Entity", 'System', 'API', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Onboarding Signal Buffer", 'System', 'API', 'Document', 300);

    end;

    local procedure ClassifyUIElements(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"O365 Device Setup Instructions", 'System', 'UI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"O365 Getting Started Page Data", 'System', 'UI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"O365 Getting Started", 'System', 'UI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Last Used Chart", 'System', 'UI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales by Cust. Grp.Chart Setup", 'System', 'UI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Role Center Notifications", 'System', 'UI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"RC Headlines User Data", 'System', 'UI', 'Document', 300);
    end;
    #endregion

    #region Authentication & Security
    local procedure ClassifyAzureADTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Azure AD App Setup", 'System', 'AzureAD', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Azure AD Mgt. Setup", 'System', 'AzureAD', 'Setup', 999);
        // Azure Blob Storage
        ClassifyTable(RecordDeletion, Database::"ABS Container", 'System', 'Storage', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"ABS Container Content", 'System', 'Storage', 'Document', 300);

        // Azure File Storage
        ClassifyTable(RecordDeletion, Database::"AFS Handle", 'System', 'Storage', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"AFS Directory Content", 'System', 'Storage', 'Document', 300);
    end;

    local procedure ClassifyOAuthTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"OAuth 2.0 Setup", 'System', 'OAuth', 'Setup', 999);
    end;

    local procedure ClassifyPermissionsTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Permission Set Buffer", 'System', 'Permissions', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Permission Range", 'System', 'Permissions', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Permission Buffer", 'System', 'Permission', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Permission Set Link", 'System', 'Permission', 'Setup', 999);
    end;

    local procedure ClassifyUserTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"User Setup", 'System', 'User', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"User Preference", 'System', 'User', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"User Task", 'System', 'UserTask', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"User Task Group", 'System', 'UserTask', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"User Task Group Member", 'System', 'UserTask', 'Document', 300);
    end;
    #endregion

    #region Integration & Data Exchange
    local procedure ClassifyDataExchangeTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Data Exch.", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Def", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Field Mapping", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Column Def", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exchange Type", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Intermediate Data Import", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Field", 'System', 'DataExchange', 'Setup', 999);
        // Data Exchange Core
        ClassifyTable(RecordDeletion, Database::"Data Exch. Mapping", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Line Def", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Table Filter", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Field Grouping", 'System', 'DataExchange', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Exch. FlowField Gr. Buff.", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Data Exch. Field Mapping Buf.", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Doc. Exch. Service Setup", 'System', 'DataExchange', 'Setup', 999);

        // Data Format Buffers
        ClassifyTable(RecordDeletion, Database::"CSV Buffer", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"XML Buffer", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"JSON Buffer", 'System', 'DataExchange', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Transformation Rule", 'System', 'DataExchange', 'Setup', 999);
    end;

    local procedure ClassifyEmailTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Email
        ClassifyTable(RecordDeletion, Database::"Email Account", 'System', 'Email', 'Setup', 999);

        // Email Setup
        ClassifyTable(RecordDeletion, Database::"Email Related Record", 'System', 'Email', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Scenario Attachments", 'System', 'Email', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Email Attachments", 'System', 'Email', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Address Lookup", 'System', 'Email', 'Document', 300);

        // Email Processing
        ClassifyTable(RecordDeletion, Database::"Sent Email", 'System', 'Email', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Email Outbox", 'System', 'Email', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Inbox", 'System', 'Email', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Retrieval Filters", 'System', 'Email', 'Setup', 999);

        ClassifyTable(RecordDeletion, Database::"Email Item", 'System', 'Email', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Related Attachment", 'System', 'Email', 'Document', 300);
    end;

    local procedure ClassifyOfficeIntegrationTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Office Add-in Context", 'System', 'Office', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Office Add-in Setup", 'System', 'Office', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Exchange Object", 'System', 'Office', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Office Invoice", 'System', 'Office', 'Document', 300);
    end;

    local procedure ClassifyPowerBITables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Power BI Chart Buffer", 'System', 'PowerBI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Power BI Report Labels", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Context Settings", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Default Selection", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Report Configuration", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Report Buffer", 'System', 'PowerBI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Power BI User Configuration", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Report Uploads", 'System', 'PowerBI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Power BI Customer Reports", 'System', 'PowerBI', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Power BI Displayed Element", 'System', 'PowerBI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Power BI Selection Element", 'System', 'PowerBI', 'Document', 300);

        ClassifyTable(RecordDeletion, Database::"Power BI User Status", 'System', 'PowerBI', 'Document', 300);
    end;

    local procedure ClassifySharePointTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"SharePoint Folder", 'System', 'SharePoint', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"SharePoint List", 'System', 'SharePoint', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"SharePoint List Item", 'System', 'SharePoint', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"SharePoint List Item Atch", 'System', 'SharePoint', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"SharePoint File", 'System', 'SharePoint', 'Document', 300);
    end;

    local procedure ClassifyXMLTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"XML Schema", 'System', 'XML', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"XML Schema Element", 'System', 'XML', 'Document', 300);
    end;
    #endregion

    #region Processing & Automation
    local procedure ClassifyJobQueueTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Job Queue Entry", 'System', 'JobQueue', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Queue Log Entry", 'System', 'JobQueue', 'History', 200);
    end;

    local procedure ClassifyFlowTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Flow Service Configuration", 'System', 'Flow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Flow User Environment Buffer", 'System', 'Flow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Flow User Environment Config", 'System', 'Flow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Webhook Sub Buffer", 'System', 'Flow', 'Document', 300);
    end;
    #endregion

    #region Setup & Configuration
    local procedure ClassifyApplicationAreaTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Application Area Setup", 'System', 'ApplicationArea', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Experience Tier Setup", 'System', 'ApplicationArea', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Application Area Buffer", 'System', 'ApplicationArea', 'Document', 300);
    end;

    local procedure ClassifyModuleSetup(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Sales & Receivables Setup", 'Sales', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Inventory Setup", 'Inventory', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Resources Setup", 'Project', 'Setup', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Jobs Setup", 'Project', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyConfigurationTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Configuration
        ClassifyTable(RecordDeletion, Database::"Config. Setup", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Package Filter", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Package Record", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Package Field", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Package Error", 'System', 'Configuration', 'Document', 300);

        // Configuration Relations
        ClassifyTable(RecordDeletion, Database::"Config. Related Table", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Related Field", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Field Map", 'System', 'Configuration', 'Setup', 999);

        // Configuration Processing
        ClassifyTable(RecordDeletion, Database::"Config. Record For Processing", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Table Processing Rule", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Media Buffer", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"DataExch-RapidStart Buffer", 'System', 'Configuration', 'Document', 300);

        // Configuration Templates
        ClassifyTable(RecordDeletion, Database::"Config. Selection", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Tmpl. Selection Rules", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Questionnaire", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Question Area", 'System', 'Configuration', 'Setup', 999);

        ClassifyTable(RecordDeletion, Database::"Config. Questionnaire", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Question Area", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Package Record", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Package Field", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Package Error", 'System', 'Configuration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Setup", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Field Map", 'System', 'Configuration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Media Buffer", 'System', 'Configuration', 'Document', 300);
    end;

    local procedure ClassifyTemplates(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Customer Templ.", 'System', 'Template', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Item Templ.", 'System', 'Template', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Employee Templ.", 'System', 'Template', 'Setup', 999);
    end;
    #endregion

    #region AI & Analytics
    local procedure ClassifyAITables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Time Series Buffer", 'System', 'AI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Time Series Forecast", 'System', 'AI', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Image Analysis Scenario", 'System', 'AI', 'Setup', 999);
    end;

    local procedure ClassifyGenericChartTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Chart Definition", 'System', 'GenericChart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Generic Chart Captions Buffer", 'System', 'GenericChart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Generic Chart Setup", 'System', 'GenericChart', 'Setup', 999);
    end;

    local procedure ClassifyChartTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Generic Chart Memo Buffer", 'System', 'Chart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Generic Chart Query Column", 'System', 'Chart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Generic Chart Y-Axis", 'System', 'Chart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Generic Chart Filter", 'System', 'Chart', 'Setup', 999);
    end;
    #endregion

    #region Development & Testing
    local procedure ClassifyDevToolsTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"CAL Test Line", 'System', 'DevTools', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CAL Test Method", 'System', 'DevTools', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CAL Test Result", 'System', 'DevTools', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CAL Test Suite", 'System', 'DevTools', 'Setup', 999);
    end;

    local procedure ClassifyTestTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Semi-Manual Execution Log", 'System', 'Testing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Semi-Manual Test Wizard", 'System', 'Testing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CAL Test Coverage Map", 'System', 'Testing', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"CAL Test Enabled Codeunit", 'System', 'Testing', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"CAL Test Codeunit", 'System', 'Testing', 'Setup', 999);
    end;

    local procedure ClassifyErrorMessageTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Error Message", 'System', 'ErrorMessage', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Error Message Register", 'System', 'ErrorMessage', 'Register', 150);
    end;
    #endregion

    #region Business Process
    local procedure ClassifyChangeLogTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Change Log Entry", 'System', 'ChangeLog', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Change Log Setup", 'System', 'ChangeLog', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Change Log Setup (Field)", 'System', 'ChangeLog', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Change Log Setup (Table)", 'System', 'ChangeLog', 'Setup', 999);
    end;

    local procedure ClassifyNotificationTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Notification Entry", 'System', 'Notifications', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Notification Setup", 'System', 'Notifications', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Notifications", 'System', 'Notifications', 'Setup', 999);
    end;

    local procedure ClassifyRapidStartTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Config. Package", 'System', 'RapidStart', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Package Data", 'System', 'RapidStart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Package Table", 'System', 'RapidStart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Line", 'System', 'RapidStart', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Config. Question", 'System', 'RapidStart', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Template Header", 'System', 'RapidStart', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Config. Template Line", 'System', 'RapidStart', 'Document', 300);
    end;

    local procedure ClassifyRetentionPolicyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Setup
        ClassifyTable(RecordDeletion, Database::"Retention Policy Setup", 'System', 'RetentionPolicy', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Retention Policy Setup Line", 'System', 'RetentionPolicy', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Retention Period", 'System', 'RetentionPolicy', 'Setup', 999);

        // Processing
        ClassifyTable(RecordDeletion, Database::"Reten. Pol. Filtering Param", 'System', 'RetentionPolicy', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Reten. Pol. Deleting Param", 'System', 'RetentionPolicy', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Record Deletion", 'System', 'RetentionPolicy', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Record Deletion Rel. Error", 'System', 'RetentionPolicy', 'Document', 300);
    end;
    #endregion

    #region Additional Classifications
    local procedure ClassifyBusinessUnitTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Business Unit Setup", 'System', 'BusinessUnit', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Business Unit Information", 'System', 'BusinessUnit', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Bus. Unit In Cons. Process", 'System', 'BusinessUnit', 'Document', 300);
    end;

    local procedure ClassifyDataMigrationTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Migration Tables
        ClassifyTable(RecordDeletion, Database::"Data Migration Setup", 'System', 'Migration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Migration Parameters", 'System', 'Migration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Migration Entity", 'System', 'Migration', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Data Migrator Registration", 'System', 'Migration', 'Setup', 999);

        // Migration Status and Errors
        ClassifyTable(RecordDeletion, Database::"Data Migration Status", 'System', 'Migration', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Data Migration Error", 'System', 'Migration', 'Document', 300);
    end;

    local procedure ClassifyExtensionTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Extension Management
        ClassifyTable(RecordDeletion, Database::"Extension Deployment Status", 'System', 'Extension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Extension Pending Setup", 'System', 'Extension', 'Setup', 999);

        // Feature Management
        ClassifyTable(RecordDeletion, Database::"Feature Key Buffer", 'System', 'Extension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Feature Data Update Status", 'System', 'Extension', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Feature Dependency", 'System', 'Extension', 'Setup', 999);
    end;

    local procedure ClassifyGuidedExperienceTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Setup Status
        ClassifyTable(RecordDeletion, Database::"Assisted Company Setup Status", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Approval Workflow Wizard", 'System', 'GuidedExperience', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Approval Entry", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Approval Comment Line", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Approval Entry", 'System', 'GuidedExperience', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Approval Entry", 'System', 'GuidedExperience', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Approval Comment Line", 'System', 'GuidedExperience', 'History', 200);
        Classifytable(RecordDeletion, Database::"Overdue Approval Entry", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Webhook Entry", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Webhook Notification", 'System', 'GuidedExperience', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Webhook Subscription", 'System', 'GuidedExperience', 'Document', 300);
    end;

    local procedure ClassifyIsolatedStorageTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Isolated Certificate", 'System', 'IsolatedStorage', 'Document', 300);
    end;

    local procedure ClassifyStructuralTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Record Set Definition", 'System', 'Structure', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Record Set Tree", 'System', 'Structure', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Dimensions Field Map", 'System', 'Structure', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Over-Receipt Code", 'Purchase', 'Setup', 'Setup', 999);
    end;

    local procedure ClassifyUKGovernmentTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"GovTalk Setup", 'System', 'GovTalk', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"GovTalk Message Parts", 'System', 'GovTalk', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"GovTalkMessage", 'System', 'GovTalk', 'Document', 300);
    end;

    local procedure ClassifyUserCueTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"My Customer", 'System', 'UserPreferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Item", 'System', 'UserPreferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Account", 'System', 'UserPreferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Job", 'System', 'UserPreferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"My Time Sheets", 'System', 'UserPreferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"SB Owner Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Approvals Activities Cue", 'System', 'Cues', 'Document', 300);
    end;

    local procedure ClassifyUserProfileTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"User Settings", 'System', 'Profile', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Profile Import", 'System', 'Profile', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Experience Tier Buffer", 'System', 'Profile', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Designer Diagnostic", 'System', 'Profile', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Profile Designer Diagnostic", 'System', 'Profile', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Application User Settings", 'System', 'Profile', 'Setup', 999);
    end;

    local procedure ClassifyUtilityTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Web Service Aggregate", 'System', 'WebService', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Table Filter", 'System', 'Utility', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Document Sharing", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Document Service Cache", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Email Parameter", 'System', 'Email', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Barcode Encode Settings", 'System', 'Barcode', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Barcode Encode Settings 2D", 'System', 'Barcode', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Terms And Conditions", 'System', 'Legal', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Terms And Conditions State", 'System', 'Legal', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Date Compr. Settings Buffer", 'System', 'Utility', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Date Compr. Retain Fields", 'System', 'Utility', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Error Handling Parameters", 'System', 'Utility', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"SAS Parameters", 'System', 'Utility', 'Setup', 999);
    end;

    local procedure ClassifyWordTemplateTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Word Template", 'System', 'WordTemplate', 'Setup', 999);
    end;
    #endregion

    #region New Classifications
    local procedure ClassifyApprovalTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Approval Entry", 'System', 'Approval', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Approval Comment Line", 'System', 'Approval', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Approval Entry", 'System', 'Approval', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Approval Comment Line", 'System', 'Approval', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Overdue Approval Entry", 'System', 'Approval', 'Document', 300);
    end;

    local procedure ClassifyWorkflowTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Workflow Buffer", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::Workflow, 'System', 'Workflow', 'Master', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Step", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Step Instance", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow - Table Relation", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Table Relation Value", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Step Buffer", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Category", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"WF Event/Response Combination", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Event", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Response", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Event Queue", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Step Argument", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow Rule", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow - Record Change", 'System', 'Workflow', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Workflow Record Change Archive", 'System', 'Workflow', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Workflow Step Instance Archive", 'System', 'Workflow', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Workflow Step Argument Archive", 'System', 'Workflow', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Workflow User Group", 'System', 'Workflow', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Workflow User Group Member", 'System', 'Workflow', 'Setup', 999);
    end;

    local procedure ClassifyPaymentTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Payment Application Proposal", 'System', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Applied Payment Entry", 'System', 'Payment', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Payment Recon. Hdr", 'System', 'Payment', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Payment Recon. Line", 'System', 'Payment', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Payment Matching Details", 'System', 'Payment', 'Document', 300);
    end;


    local procedure ClassifyWarehouseTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Put-away Template Header", 'Warehouse', 'PutAway', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Put-away Template Line", 'Warehouse', 'PutAway', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Whse. Put-away Request", 'Warehouse', 'PutAway', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Whse. Pick Request", 'Warehouse', 'Pick', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Put-away Header", 'Warehouse', 'PutAway', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Put-away Line", 'Warehouse', 'PutAway', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Pick Header", 'Warehouse', 'Pick', 'History', 200);
        ClassifyTable(RecordDeletion, Database::"Posted Invt. Pick Line", 'Warehouse', 'Pick', 'History', 200);
    end;

    local procedure ClassifyCueTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Team Member Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Basic Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse WMS Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Service Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Sales Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Finance Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Manufacturing Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Job Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Warehouse Worker WMS Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Administration Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"RapidStart Services Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Relationship Mgmt. Cue", 'System', 'Cues', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Accounting Services Cue", 'System', 'Cues', 'Document', 300);
    end;
    #endregion

    #region Helper Functions
    local procedure ClassifyTable(var RecordDeletion: Record "Record Deletion"; TableNo: Integer; Module: Text[50]; Submodule: Text[50]; TableType: Text[50]; Priority: Integer)
    var
        RecordDeletionModule: Enum "Record Deletion Module";
        RecordDeletionTableType: Enum "Record Deletion Table Type";
    begin
        if RecordDeletion.Get(TableNo) then begin
            RecordDeletion.Module := RecordDeletionModule::System;
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