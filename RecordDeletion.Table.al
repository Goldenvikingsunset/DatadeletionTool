table 50500 "Record Deletion"
{
    Caption = 'Record Deletion';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Module"; Enum "Record Deletion Module")
        {
            Caption = 'Module';
            DataClassification = CustomerContent;
        }
        field(3; "Table Name"; Text[250])
        {
            Caption = 'Table Name';
            FieldClass = FlowField;
            CalcFormula = lookup(AllObjWithCaption."Object Name" where("Object Type" = const(Table),
                                                                       "Object ID" = field("Table ID")));
            Editable = false;
        }
        field(4; "No. of Records"; Integer)
        {
            Caption = 'No. of Records';
            FieldClass = Normal;
            Editable = false;
        }
        field(5; "Delete Records"; Boolean)
        {
            Caption = 'Delete Records';
            DataClassification = CustomerContent;
        }
        field(6; Company; Text[30])
        {
            Caption = 'Company';
            DataClassification = CustomerContent;
        }
        field(7; "Table Type"; Enum "Record Deletion Table Type")
        {
            Caption = 'Table Type';
            DataClassification = CustomerContent;
        }
        field(8; "Deletion Priority"; Integer)
        {
            Caption = 'Deletion Priority';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 999;
        }
    }

    keys
    {
        key(Key1; "Table ID")
        {
            Clustered = true;
        }
        key(Key2; "Module", "Table Type", "Deletion Priority") { }
    }

    trigger OnInsert()
    begin
        Company := CopyStr(CompanyName, 1, MaxStrLen(Company));
    end;
}