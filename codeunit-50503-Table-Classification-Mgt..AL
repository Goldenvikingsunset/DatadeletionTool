codeunit 50503 "Table Classification Core Mgt."
{
    procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    var
        FoundationClassMgt: Codeunit "Foundation Classification Mgt.";
        SystemClassMgt: Codeunit "System Classification Mgt.";
        UtilityClassMgt: Codeunit "Utility Classification Mgt.";
        IntegrationClassMgt: Codeunit "Integration Class Mgt.";
        FinanceClassMgt: Codeunit "Finance Classification Mgt.";
        BankClassMgt: Codeunit "Bank Classification Mgt.";
        CashFlowClassMgt: Codeunit "CashFlow Classification Mgt.";
        CostAccClassMgt: Codeunit "Cost Accounting Class. Mgt.";
        FixedAssetsClassMgt: Codeunit "Fixed Assets Class. Mgt.";
        SalesClassMgt: Codeunit "Sales Classification Mgt.";
        PurchaseClassMgt: Codeunit "Purchase Classification Mgt.";
        CRMClassMgt: Codeunit "CRM Classification Mgt.";
        eServicesClassMgt: Codeunit "eServices Classification Mgt.";
        InventoryClassMgt: Codeunit "Inventory Classification Mgt.";
        ManufacturingClassMgt: Codeunit "Manufacturing Class. Mgt.";
        WarehouseClassMgt: Codeunit "Warehouse Classification Mgt.";
        AssemblyClassMgt: Codeunit "Assembly Classification Mgt.";
        ServiceClassMgt: Codeunit "Service Classification Mgt.";
        ProjectsClassMgt: Codeunit "Projects Classification Mgt.";
        HRClassMgt: Codeunit "HR Classification Mgt.";
        VATClassMgt: Codeunit "VAT Classification Mgt.";
        ICClassMgt: Codeunit "IC Classification Mgt.";
        PricingClassMgt: Codeunit "Pricing Classification Mgt.";
    begin
        // Core Modules
        FoundationClassMgt.ClassifyTables(RecordDeletion);
        SystemClassMgt.ClassifyTables(RecordDeletion);
        UtilityClassMgt.ClassifyTables(RecordDeletion);
        IntegrationClassMgt.ClassifyTables(RecordDeletion);

        // Finance Modules
        FinanceClassMgt.ClassifyTables(RecordDeletion);
        BankClassMgt.ClassifyTables(RecordDeletion);
        CashFlowClassMgt.ClassifyTables(RecordDeletion);
        CostAccClassMgt.ClassifyTables(RecordDeletion);
        FixedAssetsClassMgt.ClassifyTables(RecordDeletion);

        // Sales & Marketing
        SalesClassMgt.ClassifyTables(RecordDeletion);
        PurchaseClassMgt.ClassifyTables(RecordDeletion);
        CRMClassMgt.ClassifyTables(RecordDeletion);
        eServicesClassMgt.ClassifyTables(RecordDeletion);

        // Operations
        InventoryClassMgt.ClassifyTables(RecordDeletion);
        ManufacturingClassMgt.ClassifyTables(RecordDeletion);
        WarehouseClassMgt.ClassifyTables(RecordDeletion);
        AssemblyClassMgt.ClassifyTables(RecordDeletion);
        ServiceClassMgt.ClassifyTables(RecordDeletion);
        ProjectsClassMgt.ClassifyTables(RecordDeletion);

        HRClassMgt.ClassifyTables(RecordDeletion);
        VATClassMgt.ClassifyTables(RecordDeletion);
        ICClassMgt.ClassifyTables(RecordDeletion);
        PricingClassMgt.ClassifyTables(RecordDeletion);
    end;

    procedure SuggestRecordsToDelete()
    var
        RecordDeletion: Record "Record Deletion";
        Window: Dialog;
    begin
        Window.Open('Making Deletion Suggestions...\Module: #1########################');

        // First clear any existing suggestions
        Window.Update(1, 'Clearing existing suggestions...');
        RecordDeletion.Reset();
        RecordDeletion.ModifyAll("Delete Records", false);
        Commit();

        // Now suggest by module
        SuggestByModule('Foundation Module', Enum::"Record Deletion Module"::Foundation, Window);
        SuggestByModule('System Module', Enum::"Record Deletion Module"::System, Window);
        SuggestByModule('Finance Module', Enum::"Record Deletion Module"::Finance, Window);
        SuggestByModule('Sales Module', Enum::"Record Deletion Module"::Sales, Window);
        SuggestByModule('Purchase Module', Enum::"Record Deletion Module"::Purchase, Window);
        SuggestByModule('Inventory Module', Enum::"Record Deletion Module"::Inventory, Window);
        SuggestByModule('Manufacturing Module', Enum::"Record Deletion Module"::Manufacturing, Window);
        SuggestByModule('Human Resources Module', Enum::"Record Deletion Module"::HumanResource, Window);
        SuggestByModule('Service Module', Enum::"Record Deletion Module"::Service, Window);
        SuggestByModule('Assembly Module', Enum::"Record Deletion Module"::Assembly, Window);
        SuggestByModule('Project Module', Enum::"Record Deletion Module"::Project, Window);
        SuggestByModule('Warehouse Module', Enum::"Record Deletion Module"::Warehouse, Window);
        SuggestByModule('Bank Module', Enum::"Record Deletion Module"::Bank, Window);
        SuggestByModule('Cashflow Module', Enum::"Record Deletion Module"::CashFlow, Window);
        SuggestByModule('Pricing Module', Enum::"Record Deletion Module"::Pricing, Window);
        SuggestByModule('VAT Module', Enum::"Record Deletion Module"::VAT, Window);
        SuggestByModule('Intercompany Module', Enum::"Record Deletion Module"::Intercompany, Window);

        Window.Close();
    end;

    local procedure SuggestByModule(ModuleCaption: Text; ModuleEnum: Enum "Record Deletion Module"; var Window: Dialog)
    var
        RecordDeletion: Record "Record Deletion";
        TablesToDelete: List of [Integer];
    begin
        Window.Update(1, ModuleCaption);

        // Get list of tables to suggest for deletion based on type
        RecordDeletion.Reset();
        RecordDeletion.SetRange(Module, ModuleEnum);
        RecordDeletion.SetFilter("Table Type", '%1|%2|%3|%4',
            RecordDeletion."Table Type"::Document,
            RecordDeletion."Table Type"::History,
            RecordDeletion."Table Type"::Archive,
            RecordDeletion."Table Type"::Ledger);

        if RecordDeletion.FindSet() then
            repeat
                TablesToDelete.Add(RecordDeletion."Table ID");
            until RecordDeletion.Next() = 0;

        // Mark tables for deletion in bulk
        if TablesToDelete.Count > 0 then begin
            RecordDeletion.Reset();
            RecordDeletion.SetRange(Module, ModuleEnum);
            RecordDeletion.SetFilter("Table ID", GetTableFilter(TablesToDelete));
            if RecordDeletion.FindSet(true) then
                RecordDeletion.ModifyAll("Delete Records", true);
        end;

        Commit();
    end;

    local procedure GetTableFilter(var TableIds: List of [Integer]): Text
    var
        FilterText: Text;
        TableId: Integer;
    begin
        foreach TableId in TableIds do begin
            if FilterText <> '' then
                FilterText += '|';
            FilterText += Format(TableId);
        end;
        exit(FilterText);
    end;
}