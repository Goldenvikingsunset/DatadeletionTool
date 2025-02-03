codeunit 50513 "Utility Classification Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyActivityLog(RecordDeletion);
        ClassifyAuditTrail(RecordDeletion);
        ClassifyDocuments(RecordDeletion);
        ClassifyPreferences(RecordDeletion);
        ClassifyAMCBankingTables(RecordDeletion);
        ClassifyAuditFileTables(RecordDeletion);
        ClassifyBankRecAITables(RecordDeletion);
        ClassifyCompanyHubTables(RecordDeletion);
        ClassifyContosoCoffeeTables(RecordDeletion);
        ClassifyGPHistoricalTables(RecordDeletion);
        ClassifyGPMigrationTables(RecordDeletion);
        ClassifySearchAPI(RecordDeletion);
        ClassifyDataArchiveTables(RecordDeletion);
        ClassifyDataSearchTables(RecordDeletion);
        ClassifyExcelReportsTables(RecordDeletion);
        ClassifyEDocumentConnectorTables(RecordDeletion);
        ClassifyEDocumentCoreTables(RecordDeletion);
        ClassifyEDocExternalEndpointTables(RecordDeletion);
        ClassifyDigitalVouchersTables(RecordDeletion);
        ClassifyEmailSMTPTables(RecordDeletion);
        ClassifyBusinessHeadlineTables(RecordDeletion);
        ClassifyGetAddressPostcodeTables(RecordDeletion);
        ClassifyIntelligentCloudTables(RecordDeletion);
        ClassifyIntrastatTables(RecordDeletion);
        ClassifyLatePaymentPredictionTables(RecordDeletion);
        ClassifyMTDTables(RecordDeletion);
        ClassifyQuickbooksMigrationTables(RecordDeletion);
        ClassifyPayPalTables(RecordDeletion);
        ClassifyPaymentPracticeTables(RecordDeletion);
        ClassifyPowerBITables(RecordDeletion);
        ClassifyRecommendedAppsTables(RecordDeletion);
        ClassifyGLReviewTables(RecordDeletion);
        ClassifySalesForecastTables(RecordDeletion);
        ClassifySalesAITables(RecordDeletion);
        ClassifyEmailPrinterTables(RecordDeletion);
        ClassifyShopifyTables(RecordDeletion);
    end;

    local procedure ClassifyEmailPrinterTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 2650, 'System', 'EmailPrinter', 'Setup', 999); // Email Printer Settings
    end;

    local procedure ClassifyShopifyTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Setup Tables
        ClassifyTable(RecordDeletion, 30102, 'System', 'Shopify', 'Setup', 999); // Shpfy Shop 
        ClassifyTable(RecordDeletion, 30103, 'System', 'Shopify', 'Setup', 999); // Shpfy Synchronization Info
        ClassifyTable(RecordDeletion, 30150, 'System', 'Shopify', 'Setup', 999); // Shpfy Company
        ClassifyTable(RecordDeletion, 30151, 'System', 'Shopify', 'Setup', 999); // Shpfy Company Location
        ClassifyTable(RecordDeletion, 30156, 'System', 'Shopify', 'Setup', 999); // Shpfy Language
        ClassifyTable(RecordDeletion, 30157, 'System', 'Shopify', 'Setup', 999); // Shpfy Translation
        ClassifyTable(RecordDeletion, 30158, 'System', 'Shopify', 'Setup', 999); // Shpfy Payment Terms

        // Master Data
        ClassifyTable(RecordDeletion, 30105, 'System', 'Shopify', 'Master', 999); // Shpfy Customer
        ClassifyTable(RecordDeletion, 30106, 'System', 'Shopify', 'Master', 999); // Shpfy Customer Address
        ClassifyTable(RecordDeletion, 30107, 'System', 'Shopify', 'Setup', 999); // Shpfy Customer Template
        ClassifyTable(RecordDeletion, 30108, 'System', 'Shopify', 'Setup', 999); // Shpfy Province
        ClassifyTable(RecordDeletion, 30109, 'System', 'Shopify', 'Setup', 999); // Shpfy Tax Area
        ClassifyTable(RecordDeletion, 30126, 'System', 'Shopify', 'Master', 999); // Shpfy Inventory Item
        ClassifyTable(RecordDeletion, 30127, 'System', 'Shopify', 'Master', 999); // Shpfy Product
        ClassifyTable(RecordDeletion, 30129, 'System', 'Shopify', 'Master', 999); // Shpfy Variant

        // Order Processing
        ClassifyTable(RecordDeletion, 30118, 'System', 'Shopify', 'Document', 300); // Shpfy Order Header
        ClassifyTable(RecordDeletion, 30119, 'System', 'Shopify', 'Document', 300); // Shpfy Order Line
        ClassifyTable(RecordDeletion, 30116, 'System', 'Shopify', 'Document', 300); // Shpfy Order Attribute
        ClassifyTable(RecordDeletion, 30117, 'System', 'Shopify', 'Document', 300); // Shpfy Order Disc.Appl.
        ClassifyTable(RecordDeletion, 30121, 'System', 'Shopify', 'Document', 300); // Shpfy Orders to Import
        ClassifyTable(RecordDeletion, 30122, 'System', 'Shopify', 'Document', 300); // Shpfy Order Tax Line
        ClassifyTable(RecordDeletion, 30123, 'System', 'Shopify', 'Document', 300); // Shpfy Order Risk
        ClassifyTable(RecordDeletion, 30130, 'System', 'Shopify', 'Document', 300); // Shpfy Order Shipping Charges
        ClassifyTable(RecordDeletion, 30149, 'System', 'Shopify', 'Document', 300); // Shpfy Order Line Attribute

        // Fulfillment & Returns
        ClassifyTable(RecordDeletion, 30111, 'System', 'Shopify', 'Document', 300); // Shpfy Order Fulfillment
        ClassifyTable(RecordDeletion, 30139, 'System', 'Shopify', 'Document', 300); // Shpfy Fulfillment Line
        ClassifyTable(RecordDeletion, 30143, 'System', 'Shopify', 'Document', 300); // Shpfy FulFillment Order Header
        ClassifyTable(RecordDeletion, 30144, 'System', 'Shopify', 'Document', 300); // Shpfy FulFillment Order Line
        ClassifyTable(RecordDeletion, 30141, 'System', 'Shopify', 'Document', 300); // Shpfy Return Line
        ClassifyTable(RecordDeletion, 30147, 'System', 'Shopify', 'Document', 300); // Shpfy Return Header

        // Payment & Finance
        ClassifyTable(RecordDeletion, 30110, 'System', 'Shopify', 'Document', 300); // Shpfy Gift Card
        ClassifyTable(RecordDeletion, 30124, 'System', 'Shopify', 'Document', 300); // Shpfy Payment Transaction
        ClassifyTable(RecordDeletion, 30125, 'System', 'Shopify', 'Document', 300); // Shpfy Payout
        ClassifyTable(RecordDeletion, 30133, 'System', 'Shopify', 'Document', 300); // Shpfy Order Transaction
        ClassifyTable(RecordDeletion, 30154, 'System', 'Shopify', 'Document', 300); // Shpfy Suggest Payment
        ClassifyTable(RecordDeletion, 30155, 'System', 'Shopify', 'Document', 300); // Shpfy Dispute
        ClassifyTable(RecordDeletion, 30161, 'System', 'Shopify', 'Document', 300); // Shpfy Invoice Header

        // Mapping & Integration
        ClassifyTable(RecordDeletion, 30131, 'System', 'Shopify', 'Setup', 999); // Shpfy Shipment Method Mapping
        ClassifyTable(RecordDeletion, 30134, 'System', 'Shopify', 'Setup', 999); // Shpfy Payment Method Mapping
        ClassifyTable(RecordDeletion, 30136, 'System', 'Shopify', 'Setup', 999); // Shpfy Registered Store
        ClassifyTable(RecordDeletion, 30138, 'System', 'Shopify', 'Setup', 999); // Shpfy Registered Store New
        ClassifyTable(RecordDeletion, 30146, 'System', 'Shopify', 'Document', 300); // Shpfy Doc. Link To Doc.

        // Miscellaneous
        ClassifyTable(RecordDeletion, 30100, 'System', 'Shopify', 'Document', 300); // Shpfy Cue
        ClassifyTable(RecordDeletion, 30101, 'System', 'Shopify', 'Document', 300); // Shpfy Metafield
        ClassifyTable(RecordDeletion, 30104, 'System', 'Shopify', 'Setup', 999); // Shpfy Tag
        ClassifyTable(RecordDeletion, 30112, 'System', 'Shopify', 'Document', 300); // Shpfy Shop Inventory
        ClassifyTable(RecordDeletion, 30113, 'System', 'Shopify', 'Setup', 999); // Shpfy Shop Location
        ClassifyTable(RecordDeletion, 30114, 'System', 'Shopify', 'Document', 300); // Shpfy Data Capture
        ClassifyTable(RecordDeletion, 30115, 'System', 'Shopify', 'History', 200); // Shpfy Log Entry
        ClassifyTable(RecordDeletion, 30137, 'System', 'Shopify', 'Document', 300); // Shpfy Initial Import Line
        ClassifyTable(RecordDeletion, 30140, 'System', 'Shopify', 'Document', 300); // Shpfy Templates Warnings
        ClassifyTable(RecordDeletion, 30148, 'System', 'Shopify', 'Document', 300); // Shpfy Bulk Operation
    end;

    local procedure ClassifyPayPalTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 1070, 'System', 'PayPal', 'Setup', 999); // MS - PayPal Standard Account
        ClassifyTable(RecordDeletion, 1071, 'System', 'PayPal', 'Setup', 999); // MS - PayPal Standard Template
        ClassifyTable(RecordDeletion, 1077, 'System', 'PayPal', 'Document', 300); // MS - PayPal Transaction
    end;

    local procedure ClassifyPaymentPracticeTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 685, 'System', 'PaymentPractice', 'Setup', 999); // Payment Period
        ClassifyTable(RecordDeletion, 686, 'System', 'PaymentPractice', 'Document', 300); // Payment Practice Data
        ClassifyTable(RecordDeletion, 687, 'System', 'PaymentPractice', 'Document', 300); // Payment Practice Header
        ClassifyTable(RecordDeletion, 688, 'System', 'PaymentPractice', 'Document', 300); // Payment Practice Line
    end;

    local procedure ClassifyPowerBITables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 36950, 'System', 'PowerBI', 'Document', 300); // Dimension Set Entry
        ClassifyTable(RecordDeletion, 36951, 'System', 'PowerBI', 'Setup', 999); // PowerBI Reports Setup
        ClassifyTable(RecordDeletion, 36952, 'System', 'PowerBI', 'Setup', 999); // Working Day
        ClassifyTable(RecordDeletion, 36953, 'System', 'PowerBI', 'Setup', 999); // Account Category
    end;

    local procedure ClassifyRecommendedAppsTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 4750, 'System', 'RecommendedApps', 'Document', 300); // Recommended Apps
    end;

    local procedure ClassifyGLReviewTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 22216, 'System', 'GLReview', 'Document', 300); // G/L Entry Review Entry
        ClassifyTable(RecordDeletion, 22217, 'System', 'GLReview', 'Setup', 999); // G/L Entry Review Setup
    end;

    local procedure ClassifySalesForecastTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 1850, 'System', 'SalesForecast', 'Document', 300); // MS - Sales Forecast
        ClassifyTable(RecordDeletion, 1851, 'System', 'SalesForecast', 'Setup', 999); // MS - Sales Forecast Parameter
        ClassifyTable(RecordDeletion, 1853, 'System', 'SalesForecast', 'Setup', 999); // MS - Sales Forecast Setup
    end;

    local procedure ClassifySalesAITables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 7275, 'System', 'SalesAI', 'Document', 300); // Sales Line AI Suggestions
        ClassifyTable(RecordDeletion, 7276, 'System', 'SalesAI', 'Document', 300); // Search API Response
        ClassifyTable(RecordDeletion, 7277, 'System', 'SalesAI', 'Setup', 999); // Attachment Mapping
        ClassifyTable(RecordDeletion, 7278, 'System', 'SalesAI', 'Document', 300); // Mapping Cache
    end;

    local procedure ClassifyIntrastatTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 4810, 'System', 'Intrastat', 'Setup', 999); // Intrastat Report Setup
        ClassifyTable(RecordDeletion, 4811, 'System', 'Intrastat', 'Document', 300); // Intrastat Report Header
        ClassifyTable(RecordDeletion, 4812, 'System', 'Intrastat', 'Document', 300); // Intrastat Report Line
        ClassifyTable(RecordDeletion, 4813, 'System', 'Intrastat', 'Document', 300); // Intrastat Report Checklist
    end;

    local procedure ClassifyLatePaymentPredictionTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 1950, 'System', 'LatePayment', 'Setup', 999); // LP Machine Learning Setup
        ClassifyTable(RecordDeletion, 1951, 'System', 'LatePayment', 'Document', 300); // LP ML Input Data
    end;

    local procedure ClassifyMTDTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 10530, 'System', 'MTD', 'Document', 300); // MTD Liability
        ClassifyTable(RecordDeletion, 10531, 'System', 'MTD', 'Document', 300); // MTD Payment
        ClassifyTable(RecordDeletion, 10532, 'System', 'MTD', 'Document', 300); // MTD Return Details
        ClassifyTable(RecordDeletion, 10539, 'System', 'MTD', 'Document', 300); // MTD Missing Fraud Prev. Hdr
        ClassifyTable(RecordDeletion, 10540, 'System', 'MTD', 'Setup', 999); // MTD Default Fraud Prev. Hdr
        ClassifyTable(RecordDeletion, 10541, 'System', 'MTD', 'Document', 300); // MTD Session Fraud Prev. Hdr
    end;

    local procedure ClassifyQuickbooksMigrationTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Master Data
        ClassifyTable(RecordDeletion, 1911, 'System', 'QBMigration', 'Document', 300); // MigrationQB Account
        ClassifyTable(RecordDeletion, 1912, 'System', 'QBMigration', 'Document', 300); // MigrationQB Customer
        ClassifyTable(RecordDeletion, 1914, 'System', 'QBMigration', 'Document', 300); // MigrationQB Vendor
        ClassifyTable(RecordDeletion, 1916, 'System', 'QBMigration', 'Document', 300); // MigrationQB Item

        // Transaction Data
        ClassifyTable(RecordDeletion, 1913, 'System', 'QBMigration', 'Document', 300); // MigrationQB CustomerTrans
        ClassifyTable(RecordDeletion, 1915, 'System', 'QBMigration', 'Document', 300); // MigrationQB VendorTrans

        // Setup
        ClassifyTable(RecordDeletion, 1917, 'System', 'QBMigration', 'Setup', 999); // MigrationQB Config
        ClassifyTable(RecordDeletion, 1918, 'System', 'QBMigration', 'Setup', 999); // MigrationQB Account Setup
    end;

    local procedure ClassifyDigitalVouchersTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 5579, 'System', 'DigitalVouchers', 'Setup', 999); // Digital Voucher Entry Setup
        ClassifyTable(RecordDeletion, 5580, 'System', 'DigitalVouchers', 'Setup', 999); // Voucher Entry Source Code
        ClassifyTable(RecordDeletion, 5581, 'System', 'DigitalVouchers', 'Setup', 999); // Digital Voucher Setup
    end;

    local procedure ClassifyEmailSMTPTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 4511, 'System', 'EmailSMTP', 'Setup', 999); // SMTP Account
    end;

    local procedure ClassifyBusinessHeadlineTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 1436, 'System', 'Headlines', 'Document', 300); // Ess. Business Headline Per Usr
        ClassifyTable(RecordDeletion, 1437, 'System', 'Headlines', 'Document', 300); // Headline Details Per User
        ClassifyTable(RecordDeletion, 1438, 'System', 'Headlines', 'Setup', 999); // Essential Business Headline
        ClassifyTable(RecordDeletion, 1439, 'System', 'Headlines', 'Document', 300); // Headline Details
    end;

    local procedure ClassifyGetAddressPostcodeTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 9092, 'System', 'GetAddress', 'Setup', 999); // Postcode GetAddress.io Config
    end;

    local procedure ClassifyIntelligentCloudTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Core Setup Tables
        ClassifyTable(RecordDeletion, 4000, 'System', 'IntCloud', 'Setup', 999); // Hybrid Product Type
        ClassifyTable(RecordDeletion, 4003, 'System', 'IntCloud', 'Setup', 999); // Intelligent Cloud Setup
        ClassifyTable(RecordDeletion, 4005, 'System', 'IntCloud', 'Setup', 999); // Hybrid Company
        ClassifyTable(RecordDeletion, 40025, 'System', 'IntCloud', 'Setup', 999); // Cloud Migration ADL Setup

        // Replication Tables
        ClassifyTable(RecordDeletion, 4001, 'System', 'IntCloud', 'Document', 300); // Hybrid Replication Summary
        ClassifyTable(RecordDeletion, 4002, 'System', 'IntCloud', 'Document', 300); // Hybrid Replication Detail
        ClassifyTable(RecordDeletion, 40026, 'System', 'IntCloud', 'Document', 300); // Replication Run Completed Arg
        ClassifyTable(RecordDeletion, 40027, 'System', 'IntCloud', 'Document', 300); // Hybrid Company Status

        // Mapping Tables
        ClassifyTable(RecordDeletion, 4007, 'System', 'IntCloud', 'Setup', 999); // User Mapping Source
        ClassifyTable(RecordDeletion, 4009, 'System', 'IntCloud', 'Setup', 999); // Migration Table Mapping
        ClassifyTable(RecordDeletion, 4022, 'System', 'IntCloud', 'Document', 300); // User Mapping Work

        // Status and Logging Tables
        ClassifyTable(RecordDeletion, 4008, 'System', 'IntCloud', 'Document', 300); // Post Migration Checklist
        ClassifyTable(RecordDeletion, 4010, 'System', 'IntCloud', 'Document', 300); // Intelligent Cloud Table Status
        ClassifyTable(RecordDeletion, 4019, 'System', 'IntCloud', 'Document', 300); // Intelligent Cloud Not Migrated
        ClassifyTable(RecordDeletion, 40028, 'System', 'IntCloud', 'Document', 300); // Hybrid DA Approval
        ClassifyTable(RecordDeletion, 40032, 'System', 'IntCloud', 'Document', 300); // Hybrid Table Status
        ClassifyTable(RecordDeletion, 40041, 'System', 'IntCloud', 'History', 200); // Cloud Migration Override Log
    end;

    local procedure ClassifyDataArchiveTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 600, 'System', 'DataArchive', 'Setup', 999); // Data Archive
        ClassifyTable(RecordDeletion, 601, 'System', 'DataArchive', 'Document', 300); // Data Archive Table
        ClassifyTable(RecordDeletion, 602, 'System', 'DataArchive', 'Document', 300); // Data Archive Media Field
    end;

    local procedure ClassifyDataSearchTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 2680, 'System', 'DataSearch', 'Document', 300); // Data Search Result
        ClassifyTable(RecordDeletion, 2681, 'System', 'DataSearch', 'Setup', 999); // Data Search Setup (Table)
        ClassifyTable(RecordDeletion, 2682, 'System', 'DataSearch', 'Setup', 999); // Data Search Setup (Field)
        ClassifyTable(RecordDeletion, 2683, 'System', 'DataSearch', 'Document', 300); // Data Search Source Temp
    end;

    local procedure ClassifyExcelReportsTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 4401, 'System', 'ExcelReports', 'Document', 300); // EXR Aging Report Buffer
        ClassifyTable(RecordDeletion, 4402, 'System', 'ExcelReports', 'Document', 300); // EXR Trial Balance Buffer
        ClassifyTable(RecordDeletion, 4404, 'System', 'ExcelReports', 'Document', 300); // EXR Top Vendor Report Buffer
        ClassifyTable(RecordDeletion, 4405, 'System', 'ExcelReports', 'Document', 300); // EXR Top Customer Report Buffer
    end;

    local procedure ClassifyEDocumentConnectorTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 6371, 'System', 'EDocConnector', 'Setup', 999); // Mandate
        ClassifyTable(RecordDeletion, 6372, 'System', 'EDocConnector', 'Setup', 999); // Connection Setup
        ClassifyTable(RecordDeletion, 6375, 'System', 'EDocConnector', 'Setup', 999); // Company
    end;

    local procedure ClassifyEDocumentCoreTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 6103, 'System', 'EDocCore', 'Setup', 999); // E-Document Service
        ClassifyTable(RecordDeletion, 6104, 'System', 'EDocCore', 'Setup', 999); // Service Participant
        ClassifyTable(RecordDeletion, 6118, 'System', 'EDocCore', 'Setup', 999); // E-Doc. Mapping
        ClassifyTable(RecordDeletion, 6121, 'System', 'EDocCore', 'Document', 300); // E-Document
        ClassifyTable(RecordDeletion, 6122, 'System', 'EDocCore', 'Setup', 999); // E-Doc. Service Supported Type
        ClassifyTable(RecordDeletion, 6123, 'System', 'EDocCore', 'History', 200); // E-Doc. Mapping Log
        ClassifyTable(RecordDeletion, 6124, 'System', 'EDocCore', 'History', 200); // E-Document Log
        ClassifyTable(RecordDeletion, 6125, 'System', 'EDocCore', 'Document', 300); // E-Doc. Data Storage
        ClassifyTable(RecordDeletion, 6127, 'System', 'EDocCore', 'History', 200); // E-Document Integration Log
        ClassifyTable(RecordDeletion, 6138, 'System', 'EDocCore', 'Document', 300); // E-Document Service Status
        ClassifyTable(RecordDeletion, 6139, 'System', 'EDocCore', 'Setup', 999); // E-Doc. Service Data Exch. Def.
        ClassifyTable(RecordDeletion, 6163, 'System', 'EDocCore', 'Document', 300); // E-Doc. PO Match Prop. Buffer
        ClassifyTable(RecordDeletion, 6164, 'System', 'EDocCore', 'Document', 300); // E-Doc. Order Match
        ClassifyTable(RecordDeletion, 6165, 'System', 'EDocCore', 'Document', 300); // E-Doc. Imported Line
    end;

    local procedure ClassifyEDocExternalEndpointTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 6361, 'System', 'EDocEndpoints', 'Setup', 999); // E-Doc. Ext. Connection Setup
    end;

    local procedure ClassifyGPMigrationTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 4015, 'System', 'GPMigration', 'Document', 300); // GP Migration Errors
        ClassifyTable(RecordDeletion, 4016, 'System', 'GPMigration', 'Document', 300); // GP Item Location
        ClassifyTable(RecordDeletion, 4024, 'System', 'GPMigration', 'Setup', 999); // GP Configuration
        ClassifyTable(RecordDeletion, 4025, 'System', 'GPMigration', 'Setup', 999); // GP Codes
        ClassifyTable(RecordDeletion, 4026, 'System', 'GPMigration', 'Setup', 999); // GP Payment Terms
        ClassifyTable(RecordDeletion, 4027, 'System', 'GPMigration', 'Setup', 999); // GP Posting Accounts
        ClassifyTable(RecordDeletion, 4028, 'System', 'GPMigration', 'Setup', 999); // GP Segments
        ClassifyTable(RecordDeletion, 4031, 'System', 'GPMigration', 'Document', 300); // GPForecastTemp
        ClassifyTable(RecordDeletion, 4035, 'System', 'GPMigration', 'History', 200); // GPIVBinQtyTransferHist
        ClassifyTable(RecordDeletion, 4036, 'System', 'GPMigration', 'History', 200); // GPIVDistributionHist
        ClassifyTable(RecordDeletion, 4038, 'System', 'GPMigration', 'History', 200); // GPIVSerialLotNumberHist
        ClassifyTable(RecordDeletion, 4039, 'System', 'GPMigration', 'History', 200); // GPIVTrxAmountsHist
        ClassifyTable(RecordDeletion, 4040, 'System', 'GPMigration', 'Setup', 999); // GP Segment Name
        ClassifyTable(RecordDeletion, 4044, 'System', 'GPMigration', 'Setup', 999); // GP Company Migration Settings
        ClassifyTable(RecordDeletion, 4048, 'System', 'GPMigration', 'Document', 300); // GP Customer Address
        ClassifyTable(RecordDeletion, 4049, 'System', 'GPMigration', 'Document', 300); // GP Vendor Address
        ClassifyTable(RecordDeletion, 4050, 'System', 'GPMigration', 'History', 200); // GPIVTrxBinQtyHist
        ClassifyTable(RecordDeletion, 4051, 'System', 'GPMigration', 'History', 200); // GPIVTrxDetailHist
        ClassifyTable(RecordDeletion, 4052, 'System', 'GPMigration', 'History', 200); // GPIVTrxHist
        ClassifyTable(RecordDeletion, 4053, 'System', 'GPMigration', 'History', 200); // GPPMHist
        ClassifyTable(RecordDeletion, 4054, 'System', 'GPMigration', 'History', 200); // GPPOPBinQtyHist
        ClassifyTable(RecordDeletion, 4055, 'System', 'GPMigration', 'History', 200); // GPPOPDistributionHist
        ClassifyTable(RecordDeletion, 4056, 'System', 'GPMigration', 'History', 200); // GPPOPLandedCostHist
        ClassifyTable(RecordDeletion, 4057, 'System', 'GPMigration', 'History', 200); // GPPOPPOHist
        ClassifyTable(RecordDeletion, 4058, 'System', 'GPMigration', 'History', 200); // GPPOPPOLineHist
        ClassifyTable(RecordDeletion, 4059, 'System', 'GPMigration', 'History', 200); // GPPOPPOTaxHist
        ClassifyTable(RecordDeletion, 4060, 'System', 'GPMigration', 'Document', 300); // GPPOPReceiptApply
        ClassifyTable(RecordDeletion, 4061, 'System', 'GPMigration', 'History', 200); // GPPOPReceiptHist
        ClassifyTable(RecordDeletion, 4062, 'System', 'GPMigration', 'History', 200); // GPPOPReceiptLineHist
        ClassifyTable(RecordDeletion, 4063, 'System', 'GPMigration', 'History', 200); // GPPOPSerialLotHist
        ClassifyTable(RecordDeletion, 4064, 'System', 'GPMigration', 'History', 200); // GPPOPTaxHist
        ClassifyTable(RecordDeletion, 4065, 'System', 'GPMigration', 'History', 200); // GPRMHist
        ClassifyTable(RecordDeletion, 4066, 'System', 'GPMigration', 'Document', 300); // GPRMOpen
        ClassifyTable(RecordDeletion, 4067, 'System', 'GPMigration', 'History', 200); // GPSOPBinQuantityWorkHist
        ClassifyTable(RecordDeletion, 4068, 'System', 'GPMigration', 'History', 200); // GPSOPCommissionsWorkHist
        ClassifyTable(RecordDeletion, 4069, 'System', 'GPMigration', 'History', 200); // GPSOPDepositHist
        ClassifyTable(RecordDeletion, 4070, 'System', 'GPMigration', 'History', 200); // GPSOPDistributionWorkHist
        ClassifyTable(RecordDeletion, 4071, 'System', 'GPMigration', 'History', 200); // GPSOPLineCommentWorkHist
        ClassifyTable(RecordDeletion, 4072, 'System', 'GPMigration', 'History', 200); // GPSOPPaymentWorkHist
        ClassifyTable(RecordDeletion, 4073, 'System', 'GPMigration', 'History', 200); // GPSOPProcessHoldWorkHist
        ClassifyTable(RecordDeletion, 4074, 'System', 'GPMigration', 'History', 200); // GPSOPSerialLotWorkHist
        ClassifyTable(RecordDeletion, 4075, 'System', 'GPMigration', 'History', 200); // GPSOPTaxesWorkHist
        ClassifyTable(RecordDeletion, 4076, 'System', 'GPMigration', 'History', 200); // GPSOPTrackingNumbersWorkHist
        ClassifyTable(RecordDeletion, 4077, 'System', 'GPMigration', 'History', 200); // GPSOPTrxAmountsHist
        ClassifyTable(RecordDeletion, 4078, 'System', 'GPMigration', 'History', 200); // GPSOPTrxHist
        ClassifyTable(RecordDeletion, 4079, 'System', 'GPMigration', 'History', 200); // GPSOPUserDefinedWorkHist
        ClassifyTable(RecordDeletion, 4080, 'System', 'GPMigration', 'History', 200); // GPSOPWorkflowWorkHist
        ClassifyTable(RecordDeletion, 4081, 'System', 'GPMigration', 'History', 200); // GPIVLotAttributeHist
        ClassifyTable(RecordDeletion, 4090, 'System', 'GPMigration', 'Document', 300); // GP Account
        ClassifyTable(RecordDeletion, 4091, 'System', 'GPMigration', 'Document', 300); // GP GLTransactions
        ClassifyTable(RecordDeletion, 4092, 'System', 'GPMigration', 'Setup', 999); // GP Fiscal Periods
        ClassifyTable(RecordDeletion, 4093, 'System', 'GPMigration', 'Document', 300); // GP Customer
        ClassifyTable(RecordDeletion, 4094, 'System', 'GPMigration', 'Document', 300); // GP Customer Transactions
        ClassifyTable(RecordDeletion, 4095, 'System', 'GPMigration', 'Document', 300); // GP Item
        ClassifyTable(RecordDeletion, 4096, 'System', 'GPMigration', 'Document', 300); // GP Vendor
        ClassifyTable(RecordDeletion, 4097, 'System', 'GPMigration', 'Document', 300); // GP Vendor Transactions
        ClassifyTable(RecordDeletion, 4098, 'System', 'GPMigration', 'Document', 300); // GP Item Transaction
        ClassifyTable(RecordDeletion, 4104, 'System', 'GPMigration', 'Document', 300); // GP Item Transactions

        // 40xxx series
        ClassifyTable(RecordDeletion, 40099, 'System', 'GPMigration', 'Document', 300); // GP Checkbook MSTR
        ClassifyTable(RecordDeletion, 40100, 'System', 'GPMigration', 'Document', 300); // GP Bank MSTR
        ClassifyTable(RecordDeletion, 40101, 'System', 'GPMigration', 'Document', 300); // GP Checkbook Transactions
        ClassifyTable(RecordDeletion, 40102, 'System', 'GPMigration', 'Document', 300); // GP POPPOHeader
        ClassifyTable(RecordDeletion, 40103, 'System', 'GPMigration', 'Document', 300); // GP POPPOLine
        ClassifyTable(RecordDeletion, 40105, 'System', 'GPMigration', 'Setup', 999); // GP Company Additional Settings
        ClassifyTable(RecordDeletion, 40107, 'System', 'GPMigration', 'Setup', 999); // GP SY40100
        ClassifyTable(RecordDeletion, 40108, 'System', 'GPMigration', 'Setup', 999); // GP SY40101
        ClassifyTable(RecordDeletion, 40109, 'System', 'GPMigration', 'Document', 300); // GP CM20600
        ClassifyTable(RecordDeletion, 40110, 'System', 'GPMigration', 'Setup', 999); // GP MC40200
        ClassifyTable(RecordDeletion, 40111, 'System', 'GPMigration', 'Setup', 999); // GP SY06000
        ClassifyTable(RecordDeletion, 40112, 'System', 'GPMigration', 'Document', 300); // GP PM00100
        ClassifyTable(RecordDeletion, 40113, 'System', 'GPMigration', 'Document', 300); // GP PM00200
        ClassifyTable(RecordDeletion, 40114, 'System', 'GPMigration', 'Document', 300); // GP RM00101
        ClassifyTable(RecordDeletion, 40115, 'System', 'GPMigration', 'Document', 300); // GP RM00201
        ClassifyTable(RecordDeletion, 40116, 'System', 'GPMigration', 'Document', 300); // GP IV00101
        ClassifyTable(RecordDeletion, 40117, 'System', 'GPMigration', 'Setup', 999); // GP IV40400
        ClassifyTable(RecordDeletion, 40118, 'System', 'GPMigration', 'Document', 300); // GP GL10111
        ClassifyTable(RecordDeletion, 40119, 'System', 'GPMigration', 'Document', 300); // GP GL10110
        ClassifyTable(RecordDeletion, 40120, 'System', 'GPMigration', 'Document', 300); // GP IV00102
        ClassifyTable(RecordDeletion, 40121, 'System', 'GPMigration', 'Document', 300); // GP IV00105
        ClassifyTable(RecordDeletion, 40122, 'System', 'GPMigration', 'Document', 300); // GP IV00200
        ClassifyTable(RecordDeletion, 40123, 'System', 'GPMigration', 'Document', 300); // GP IV00300
        ClassifyTable(RecordDeletion, 40124, 'System', 'GPMigration', 'Document', 300); // GP IV10200
        ClassifyTable(RecordDeletion, 40125, 'System', 'GPMigration', 'Setup', 999); // GP IV40201
        ClassifyTable(RecordDeletion, 40126, 'System', 'GPMigration', 'Setup', 999); // GP MC40000
        ClassifyTable(RecordDeletion, 40127, 'System', 'GPMigration', 'Document', 300); // GP GL00100
        ClassifyTable(RecordDeletion, 40128, 'System', 'GPMigration', 'Document', 300); // GP PM00201
        ClassifyTable(RecordDeletion, 40129, 'System', 'GPMigration', 'Document', 300); // GP PM20000
        ClassifyTable(RecordDeletion, 40130, 'System', 'GPMigration', 'Setup', 999); // GP GL40200
        ClassifyTable(RecordDeletion, 40131, 'System', 'GPMigration', 'Document', 300); // GP RM00103
        ClassifyTable(RecordDeletion, 40132, 'System', 'GPMigration', 'Document', 300); // GP RM20101
        ClassifyTable(RecordDeletion, 40133, 'System', 'GPMigration', 'Setup', 999); // GP SY00300
        ClassifyTable(RecordDeletion, 40134, 'System', 'GPMigration', 'Setup', 999); // GP SY01100
        ClassifyTable(RecordDeletion, 40135, 'System', 'GPMigration', 'Setup', 999); // GP SY01200
        ClassifyTable(RecordDeletion, 40136, 'System', 'GPMigration', 'Setup', 999); // GP SY03300
        ClassifyTable(RecordDeletion, 40137, 'System', 'GPMigration', 'Document', 300); // GP POP10100
        ClassifyTable(RecordDeletion, 40138, 'System', 'GPMigration', 'Document', 300); // GP POP10110
        ClassifyTable(RecordDeletion, 40139, 'System', 'GPMigration', 'Document', 300); // GP PM00204
        ClassifyTable(RecordDeletion, 40140, 'System', 'GPMigration', 'Setup', 999); // GP Known Countries
        ClassifyTable(RecordDeletion, 40141, 'System', 'GPMigration', 'Document', 300); //
        ClassifyTable(RecordDeletion, 40142, 'System', 'GPMigration', 'Document', 300); // GP PM10200
        ClassifyTable(RecordDeletion, 40143, 'System', 'GPMigration', 'Document', 300); // GP PM30300
        ClassifyTable(RecordDeletion, 40144, 'System', 'GPMigration', 'Document', 300); // GP RM20201
        ClassifyTable(RecordDeletion, 40145, 'System', 'GPMigration', 'Document', 300); // GP RM30201
        ClassifyTable(RecordDeletion, 40150, 'System', 'GPMigration', 'Setup', 999); // GP Upgrade Settings

        // 41xxx series
        ClassifyTable(RecordDeletion, 41000, 'System', 'GPMigration', 'Document', 300); // GP GL00105
        ClassifyTable(RecordDeletion, 41001, 'System', 'GPMigration', 'Document', 300); // GP GL20000
        ClassifyTable(RecordDeletion, 41002, 'System', 'GPMigration', 'Document', 300); // GP GL30000
        ClassifyTable(RecordDeletion, 41003, 'System', 'GPMigration', 'Document', 300); // GP BM30200
        ClassifyTable(RecordDeletion, 41004, 'System', 'GPMigration', 'Document', 300); // GP Hist. Source Progress
        ClassifyTable(RecordDeletion, 41005, 'System', 'GPMigration', 'Document', 300); // GP Hist. Source Error
        ClassifyTable(RecordDeletion, 41006, 'System', 'GPMigration', 'Document', 300); // GP Migration Warnings
        ClassifyTable(RecordDeletion, 41007, 'System', 'GPMigration', 'Document', 300); // GP IV00104
    end;

    local procedure ClassifyGPHistoricalTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 40900, 'System', 'GPHistorical', 'History', 200); // Hist. G/L Account
        ClassifyTable(RecordDeletion, 40901, 'System', 'GPHistorical', 'History', 200); // Hist. Gen. Journal Line
        ClassifyTable(RecordDeletion, 40902, 'System', 'GPHistorical', 'History', 200); // Hist. Sales Trx. Header
        ClassifyTable(RecordDeletion, 40903, 'System', 'GPHistorical', 'History', 200); // Hist. Sales Trx. Line
        ClassifyTable(RecordDeletion, 40904, 'System', 'GPHistorical', 'History', 200); // Hist. Receivables Document
        ClassifyTable(RecordDeletion, 40905, 'System', 'GPHistorical', 'History', 200); // Hist. Payables Document
        ClassifyTable(RecordDeletion, 40906, 'System', 'GPHistorical', 'History', 200); // Hist. Inventory Trx. Header
        ClassifyTable(RecordDeletion, 40907, 'System', 'GPHistorical', 'History', 200); // Hist. Inventory Trx. Line
        ClassifyTable(RecordDeletion, 40908, 'System', 'GPHistorical', 'History', 200); // Hist. Purchase Recv. Header
        ClassifyTable(RecordDeletion, 40909, 'System', 'GPHistorical', 'History', 200); // Hist. Purchase Recv. Line
        ClassifyTable(RecordDeletion, 40910, 'System', 'GPHistorical', 'Document', 300); // Hist. Migration Step Status
        ClassifyTable(RecordDeletion, 40912, 'System', 'GPHistorical', 'Document', 300); // Hist. Migration Current Status
        ClassifyTable(RecordDeletion, 40913, 'System', 'GPHistorical', 'History', 200); // Hist. Payables Apply
        ClassifyTable(RecordDeletion, 40914, 'System', 'GPHistorical', 'History', 200); // Hist. Receivables Apply
        ClassifyTable(RecordDeletion, 40915, 'System', 'GPHistorical', 'History', 200); // Hist. Invt. Trx. SerialLot
        ClassifyTable(RecordDeletion, 40916, 'System', 'GPHistorical', 'History', 200); // Hist. Recv. Trx. SerialLot
    end;

    // Add a new procedure for Search API
    local procedure ClassifySearchAPI(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 7339, 'System', 'Search', 'Document', 300); // Search API Response
    end;

    local procedure ClassifyAMCBankingTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 20100, 'System', 'AMCBanking', 'Setup', 999); // AMC Bank Banks
        ClassifyTable(RecordDeletion, 20101, 'System', 'AMCBanking', 'Setup', 999); // AMC Banking Setup
        ClassifyTable(RecordDeletion, 20102, 'System', 'AMCBanking', 'Setup', 999); // AMC Bank Pmt. Type
    end;

    local procedure ClassifyAuditFileTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 5260, 'System', 'AuditFile', 'Master', 999); // G/L Account Mapping Header
        ClassifyTable(RecordDeletion, 5261, 'System', 'AuditFile', 'Document', 300); // G/L Account Mapping Line
        ClassifyTable(RecordDeletion, 5262, 'System', 'AuditFile', 'Setup', 999); // Standard Account Category
        ClassifyTable(RecordDeletion, 5263, 'System', 'AuditFile', 'Setup', 999); // Standard Account
        ClassifyTable(RecordDeletion, 5264, 'System', 'AuditFile', 'Setup', 999); // Audit File Export Setup
        ClassifyTable(RecordDeletion, 5265, 'System', 'AuditFile', 'Document', 300); // Audit File Export Header
        ClassifyTable(RecordDeletion, 5266, 'System', 'AuditFile', 'Document', 300); // Audit File Export Line
        ClassifyTable(RecordDeletion, 5267, 'System', 'AuditFile', 'Document', 300); // Audit File
        ClassifyTable(RecordDeletion, 5268, 'System', 'AuditFile', 'Setup', 999); // Audit File Export Format Setup
        ClassifyTable(RecordDeletion, 5269, 'System', 'AuditFile', 'Setup', 999); // Audit Export Data Type Setup
    end;

    local procedure ClassifyBankRecAITables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 7250, 'System', 'BankRecAI', 'Document', 300); // Bank Acc. Rec. AI Proposal
        ClassifyTable(RecordDeletion, 7251, 'System', 'BankRecAI', 'Document', 300); // Bank Acc. Rec. AI Prop. Buf.
        ClassifyTable(RecordDeletion, 7252, 'System', 'BankRecAI', 'Document', 300); // Trans. to G/L Acc. Jnl. Batch
    end;

    local procedure ClassifyCompanyHubTables(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, 1151, 'System', 'CompanyHub', 'Document', 300); // COHUB Company KPI
        ClassifyTable(RecordDeletion, 1152, 'System', 'CompanyHub', 'Setup', 999); // COHUB Environment
        ClassifyTable(RecordDeletion, 1153, 'System', 'CompanyHub', 'Setup', 999); // COHUB Company Endpoint
        ClassifyTable(RecordDeletion, 1154, 'System', 'CompanyHub', 'Document', 300); // COHUB User Task
        ClassifyTable(RecordDeletion, 1155, 'System', 'CompanyHub', 'Setup', 999); // COHUB Group
        ClassifyTable(RecordDeletion, 1156, 'System', 'CompanyHub', 'Document', 300); // COHUB Group Company Summary
    end;

    local procedure ClassifyContosoCoffeeTables(var RecordDeletion: Record "Record Deletion")
    begin
        // Manufacturing Demo Data
        ClassifyTable(RecordDeletion, 4760, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4761, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4762, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4763, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4764, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4765, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4766, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4767, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4768, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4769, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4770, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 4771, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 5161, 'System', 'ContosoCoffee', 'Setup', 999);
        ClassifyTable(RecordDeletion, 5169, 'System', 'ContosoCoffee', 'Setup', 999);
    end;

    local procedure ClassifyActivityLog(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Activity Log", 'System', 'ActivityLog', 'History', 100);
    end;

    local procedure ClassifyAuditTrail(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Cancelled Document", 'System', 'Audit', 'History', 100);
        ClassifyTable(RecordDeletion, Database::"Change Log Entry", 'System', 'Audit', 'History', 100);
    end;

    local procedure ClassifyDocuments(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Certificate of Supply", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Document Entry", 'System', 'Document', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Standard Text", 'System', 'Document', 'Setup', 999);
    end;

    local procedure ClassifyPreferences(var RecordDeletion: Record "Record Deletion")
    begin
        ClassifyTable(RecordDeletion, Database::"Journal User Preferences", 'System', 'Preferences', 'Setup', 999);
        ClassifyTable(RecordDeletion, Database::"Line Number Buffer", 'System', 'Preferences', 'Document', 300);
        ClassifyTable(RecordDeletion, Database::"Name/Value Buffer", 'System', 'Preferences', 'Document', 300);
    end;

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