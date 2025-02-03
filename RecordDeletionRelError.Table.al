table 50501 "Record Deletion Rel. Error"
{
    Caption = 'Record Deletion Relation Error';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(11; "Field Name"; Text[30])
        {
            Caption = 'Field Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Field.FieldName where(TableNo = field("Table ID"),
                                                      "No." = field("Field No.")));
            Editable = false;
        }
        field(20; "Error"; Text[250])
        {
            Caption = 'Error';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Table ID", "Entry No.")
        {
            Clustered = true;
        }
    }
}