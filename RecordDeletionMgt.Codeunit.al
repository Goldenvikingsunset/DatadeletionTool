codeunit 50500 "Record Deletion Mgt."
{
    #region Permissions
    // Permissions = TableData 17 = IMD, Tabledata 376 = IMD, Tabledata 37 = IMD, Tabledata 38 = IMD, Tabledata 39 = IMD, Tabledata 81 = IMD, Tabledata 21 = IMD, Tabledata 25 = IMD, Tabledata 732 = IMD, Tabledata 110 = IMD, TableData 111 = IMD, TableData 112 = IMD, TableData 113 = IMD, TableData 114 = IMD, TableData 115 = IMD, TableData 120 = IMD, Tabledata 121 = IMD, Tabledata 122 = IMD, Tabledata 123 = IMD, Tabledata 124 = IMD, Tabledata 125 = IMD, Tabledata 169 = IMD, Tabledata 379 = IMD, Tabledata 380 = IMD, Tabledata 271 = IMD, Tabledata 5802 = IMD, tabledata 6650 = IMD, tabledata 66160 = IMD;
    Permissions =
    TableData 17 = IMD,    // G/L Entry
    TableData 32 = IMD,    // Item Entry
    TableData 45 = IMD,    // G/L Register
    TableData 46 = IMD,    // Item Register                  // Added
    TableData 86 = IMD,    // Exch. Rate Adjmt. Reg.        // Added
    TableData 87 = IMD,    // Date Compr. Register          // Added
    TableData 240 = IMD,   // Resource Register             // Added
    TableData 241 = IMD,   // Job Register                  // Added
    TableData 253 = IMD,
    TableData 254 = IMD,
    TableData 271 = IMD,   // Bank Account Ledger Entry
    TableData 339 = IMD,
    TableData 376 = IMD,
    TableData 379 = IMD,
    TableData 380 = IMD,
    TableData 405 = IMD,
    TableData 480 = IMD,
    TableData 481 = IMD,
    TableData 701 = IMD,   // Error Message Register        // Added
    TableData 1105 = IMD,  // Cost Register                 // Added
    TableData 1111 = IMD,  // Cost Budget Register          // Added
    TableData 1205 = IMD,  // Credit Transfer Register      // Added
    TableData 5617 = IMD,  // FA Register                   // Added
    TableData 5636 = IMD,  // Insurance Register           // Added
    TableData 5802 = IMD,
    TableData 5832 = IMD,
    TableData 5896 = IMD,  // Inventory Adjmt. Entry       // Added
    TableData 5934 = IMD,  // Service Register             // Added
    TableData 5936 = IMD,  // Service Document Register    // Added
    TableData 6650 = IMD,
    TableData 7312 = IMD,
    TableData 7313 = IMD,  // Warehouse Register           // Added
    TableData 10551 = IMD, // BACS Register                // Added
    Tabledata 2610 = IMD, // Feature Data Update Status
    TableData 5811 = IMD, // 
    TableData 6651 = IMD, //Return Shipment Line 
    TableData 8401 = IMD, //Record Set Tree
    // Core Transaction Tables
    TableData 21 = IMD,    // Cust. Ledger Entry
    TableData 25 = IMD,    // Vendor Ledger Entry
    TableData 37 = IMD,    // Sales Line
    TableData 38 = IMD,    // Purchase Line
    TableData 39 = IMD,    // Purch. Comment Line
    TableData 81 = IMD,    // Gen. Journal Line
    TableData 110 = IMD,   // Sales Shipment Header
    TableData 111 = IMD,   // Sales Shipment Line
    TableData 112 = IMD,   // Sales Invoice Header
    TableData 113 = IMD,   // Sales Invoice Line
    TableData 114 = IMD,   // Sales Cr.Memo Header
    TableData 115 = IMD,   // Sales Cr.Memo Line
    TableData 120 = IMD,   // Purch. Rcpt. Header
    TableData 121 = IMD,   // Purch. Rcpt. Line
    TableData 122 = IMD,   // Purch. Inv. Header
    TableData 123 = IMD,   // Purch. Inv. Line
    TableData 124 = IMD,   // Purch. Cr. Memo Hdr.
    TableData 125 = IMD,   // Purch. Cr. Memo Line
    TableData 169 = IMD;   // Job Ledger Entry

    #endregion

    #region Variables
    var
        UpdateDialogMsg: Label 'Processing Table #1###############';
        DeletingRecordsTxt: Label 'Deleting Records!\Table: #1#######', Comment = '%1 = Table ID';
        CheckRelationsQst: Label 'Check Table Relations?';
        DeleteRecordsQst: Label 'Delete Records with RunTrigger = false?';
        DeleteRecordsWithTriggerQst: Label 'Delete Records with RunTrigger = true?';
        NotExistsTxt: Label '%1 => %2 = ''%3'' does not exist in the ''%4'' table', Comment = '%1 = RecRef Position, %2 = FieldRef Name, %3 = FieldRef Value, %4 = Record Ref Name';
    #endregion

    #region Public Interface
    procedure InsertUpdateTables()
    var
        RecordDeletion: Record "Record Deletion";
        AllObjWithCaption: Record AllObjWithCaption;
        RecRef: RecordRef;
        TableMetadata: Record "Table Metadata";
        Window: Dialog;
        TableCount: Integer;
        CurrentTable: Integer;
    begin
        Window.Open('Processing Tables\Table: #1### of #2###\Current: @3@@@@@@@@@@@@@@');

        // Get total count for progress dialog
        AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Table);
        AllObjWithCaption.SetFilter("Object ID", '< %1', 2000000001); // Filter out system tables
        TableCount := AllObjWithCaption.Count;
        CurrentTable := 0;

        if AllObjWithCaption.FindSet() then
            repeat
                CurrentTable += 1;
                Window.Update(1, CurrentTable);
                Window.Update(2, TableCount);
                Window.Update(3, AllObjWithCaption."Object Name");

                // Check if table is accessible
                TableMetadata.Reset();
                TableMetadata.SetRange(ID, AllObjWithCaption."Object ID");
                if not TableMetadata.FindFirst() or
                   (TableMetadata.TableType in [TableMetadata.TableType::Normal,
                                              TableMetadata.TableType::Temporary]) then begin
                    // Only insert if we can access the table
                    if CanAccessTable(AllObjWithCaption."Object ID") then begin
                        Clear(RecordDeletion);
                        if not RecordDeletion.Get(AllObjWithCaption."Object ID") then begin
                            RecordDeletion.Init();
                            RecordDeletion."Table ID" := AllObjWithCaption."Object ID";
                            RecordDeletion.Company := CopyStr(CompanyName, 1, MaxStrLen(RecordDeletion.Company));
                            RecordDeletion.Insert(true);
                        end;

                        // Update record count
                        UpdateRecordCount(RecordDeletion, AllObjWithCaption, RecRef);
                    end;

                    Commit();  // Commit after each table to prevent transaction timeout
                end;
            until AllObjWithCaption.Next() = 0;

        Window.Close();

        // Now run the classification as a separate operation
        ClassifyTablesWithProgress();
    end;

    procedure DeleteRecords(RunTrigger: Boolean)
    var
        RecordDeletion: Record "Record Deletion";
        RecordDeletionRelError: Record "Record Deletion Rel. Error";
        RecordRef: RecordRef;
        UpdateDialog: Dialog;
    begin
        if RunTrigger then begin
            if not Confirm(DeleteRecordsWithTriggerQst) then
                exit;
        end else begin
            if not Confirm(DeleteRecordsQst) then
                exit;
        end;

        UpdateDialog.Open(DeletingRecordsTxt);

        // First delete by priority
        RecordDeletion.SetRange("Delete Records", true);
        RecordDeletion.SetCurrentKey("Deletion Priority");
        if RecordDeletion.FindSet() then
            repeat
                UpdateDialog.Update(1, Format(RecordDeletion."Table ID"));
                RecordRef.Open(RecordDeletion."Table ID");
                RecordRef.DeleteAll(RunTrigger);

                // Update record count immediately after deletion
                RecordDeletion."No. of Records" := RecordRef.Count;
                RecordDeletion.Modify();

                RecordRef.Close();

                RecordDeletionRelError.SetRange("Table ID", RecordDeletion."Table ID");
                RecordDeletionRelError.DeleteAll();
            until RecordDeletion.Next() = 0;

        UpdateDialog.Close();
    end;

    procedure CheckTableRelations()
    var
        Field: Record Field;
        Field2: Record Field;
        KeyRec: Record "Key";
        RecordDeletion: Record "Record Deletion";
        RecordDeletionRelError: Record "Record Deletion Rel. Error";
        TableMetadata: Record "Table Metadata";
        RecordRef: RecordRef;
        RecordRef2: RecordRef;
        FieldRef: FieldRef;
        FieldRef2: FieldRef;
        SkipCheck: Boolean;
        UpdateDialog: Dialog;
        EntryNo: Integer;
    begin
        if not Confirm(CheckRelationsQst) then
            exit;

        UpdateDialog.Open(UpdateDialogMsg);
        RecordDeletionRelError.DeleteAll();

        if RecordDeletion.FindSet() then
            repeat
                UpdateDialog.Update(1, Format(RecordDeletion."Table ID"));

                // Only check normal tables
                TableMetadata.SetRange(ID, RecordDeletion."Table ID");
                TableMetadata.SetRange(TableType, TableMetadata.TableType::Normal);
                if not TableMetadata.IsEmpty then begin
                    RecordRef.Open(RecordDeletion."Table ID");
                    if RecordRef.FindSet() then
                        repeat
                            CheckTableRelationsForRecord(RecordRef, Field, Field2, KeyRec, RecordDeletionRelError, EntryNo);
                        until RecordRef.Next() = 0;
                    RecordRef.Close();
                end;
            until RecordDeletion.Next() = 0;

        UpdateDialog.Close();
    end;

    procedure ViewRecords(RecordDeletion: Record "Record Deletion")
    begin
        Hyperlink(GetUrl(ClientType::Current, CompanyName, ObjectType::Table, RecordDeletion."Table ID"));
    end;

    procedure ClearRecordsToDelete()
    var
        RecordDeletion: Record "Record Deletion";
    begin
        RecordDeletion.ModifyAll("Delete Records", false);
    end;
    #endregion

    #region Core Functions
    local procedure UpdateRecordCount(var RecordDeletion: Record "Record Deletion"; AllObjWithCaption: Record AllObjWithCaption; var RecRef: RecordRef)
    begin
        if CanAccessTable(AllObjWithCaption."Object ID") then begin
            RecRef.Open(AllObjWithCaption."Object ID");
            RecordDeletion."No. of Records" := RecRef.Count;
            RecRef.Close();
        end else
            RecordDeletion."No. of Records" := 0;

        RecordDeletion.Modify(true);
    end;

    local procedure ClassifyTablesWithProgress()
    var
        RecordDeletion: Record "Record Deletion";
        Window: Dialog;
        TableClassificationMgt: Codeunit "Table Classification Core Mgt.";
    begin
        Window.Open('Classifying Tables by Module...\#1##########################');

        // Clear any existing classifications first
        Window.Update(1, 'Preparing tables...');
        RecordDeletion.Reset();
        RecordDeletion.ModifyAll(Module, RecordDeletion.Module::" ");
        RecordDeletion.ModifyAll("Table Type", RecordDeletion."Table Type"::" ");
        RecordDeletion.ModifyAll("Deletion Priority", 0);
        Commit();

        // Now classify all tables at once
        Window.Update(1, 'Classifying tables...');
        TableClassificationMgt.ClassifyTables(RecordDeletion);

        Window.Close();
    end;

    local procedure CanAccessTable(TableId: Integer): Boolean
    var
        RecRef: RecordRef;
    begin
        if TableId in [
            // Known protected tables from original list
            0, 1432, 1997, 1998, 3712, 3903, 3905, 5490, 7775,
            8700, 8701, 8703, 9004, 9005, 9008, 9011, 9017, 9019,
            9022, 9222, 9999,

            // Newly identified protected tables
            1433,    // Net Promoter Score
            1990 .. 1996,  // Guided Experience/Checklist Items
            2004, 2010,  // Azure AI Usage, OpenAI Settings
            3963 .. 3966,  // Regex and Matching tables
            4150, 4151,  // Blob tables
            5101, 5102,  // Contact Value, RM Matrix
            5320 .. 5392,  // Exchange and CRM Integration tables
            5433,        // Tenant Config Package
            5555, 5557,  // Permission Conflicts
            6060,        // Hybrid Deployment
            6315,        // Power BI Filter
            6700,        // Exchange Sync
            6710, 6712,  // Web Service
            7201 .. 7205,  // CDS/CRM tables
            7230 .. 7234,  // Master Data Management
            8887 .. 8930,  // Email tables
            9010,        // Azure AD User Update
            9018, 9020,  // Permission Set tables
            9861, 9862, 9865, // Permission Buffer tables
            9981 .. 9991,  // Word Template tables
            9996,        // Upgrade Tag
            130450 .. 130472    // Test tables
            ] then
            exit(false);

        // Attempt to open the table
        RecRef.OPEN(TableId);
        RecRef.CLOSE;
        exit(true);
    end;

    local procedure CheckTableRelationsForRecord(var RecordRef: RecordRef; var Field: Record Field; var Field2: Record Field; var KeyRec: Record "Key"; var RecordDeletionRelError: Record "Record Deletion Rel. Error"; var EntryNo: Integer)
    var
        RecordRef2: RecordRef;
        FieldRef: FieldRef;
        FieldRef2: FieldRef;
        SkipCheck: Boolean;
    begin
        Field.SetRange(TableNo, RecordRef.Number);
        Field.SetRange(Class, Field.Class::Normal);
        Field.SetFilter(RelationTableNo, '<>0');
        if Field.FindSet() then
            repeat
                FieldRef := RecordRef.Field(Field."No.");
                if (Format(FieldRef.Value) <> '') and (Format(FieldRef.Value) <> '0') then begin
                    RecordRef2.Open(Field.RelationTableNo);
                    SkipCheck := false;

                    if Field.RelationFieldNo <> 0 then
                        FieldRef2 := RecordRef2.Field(Field.RelationFieldNo)
                    else begin
                        KeyRec.Get(Field.RelationTableNo, 1);  // PK
                        Field2.SetRange(TableNo, Field.RelationTableNo);
                        Field2.SetFilter(FieldName, CopyStr(KeyRec.Key, 1, 30));
                        if Field2.FindFirst() then
                            FieldRef2 := RecordRef2.Field(Field2."No.")
                        else
                            SkipCheck := true;
                    end;

                    if (FieldRef.Type = FieldRef2.Type) and (FieldRef.Length = FieldRef2.Length) and (not SkipCheck) then begin
                        FieldRef2.SetRange(FieldRef.Value);
                        if not RecordRef2.FindFirst() then begin
                            RecordDeletionRelError.SetRange("Table ID", RecordRef.Number);
                            if RecordDeletionRelError.FindLast() then
                                EntryNo := RecordDeletionRelError."Entry No." + 1
                            else
                                EntryNo := 1;

                            RecordDeletionRelError.Init();
                            RecordDeletionRelError."Table ID" := RecordRef.Number;
                            RecordDeletionRelError."Entry No." := EntryNo;
                            RecordDeletionRelError."Field No." := FieldRef.Number;
                            RecordDeletionRelError.Error := CopyStr(StrSubstNo(NotExistsTxt,
                                Format(RecordRef.GetPosition()),
                                Format(FieldRef2.Name),
                                Format(FieldRef.Value),
                                Format(RecordRef2.Name)), 1, 250);
                            RecordDeletionRelError.Insert();
                        end;
                    end;
                    RecordRef2.Close();
                end;
            until Field.Next() = 0;
    end;
    #endregion

    #region Classification
    local procedure ClassifyTables(var RecordDeletion: Record "Record Deletion")
    var
        TableClassificationMgt: Codeunit "Table Classification Core Mgt.";
    begin
        TableClassificationMgt.ClassifyTables(RecordDeletion);
    end;
    #endregion

    #region Events
    [IntegrationEvent(false, false)]
    local procedure OnBeforeDeleteRecords(var RecordDeletion: Record "Record Deletion")
    begin
    end;
    #endregion
}