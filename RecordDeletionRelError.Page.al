page 50501 "Record Deletion Rel. Error"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Record Deletion Rel. Error";
    Caption = 'Record Deletion Relation Error';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Errors)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the table with the error';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number of the error';
                }
                field("Field No."; Rec."Field No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the field number with the error';
                }
                field("Field Name"; Rec."Field Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the field with the error';
                }
                field(Error; Rec.Error)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the error details';
                }
            }
        }
    }
}