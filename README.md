# Business Central Data Deletion Tool

A systematic data deletion and retention management tool for Microsoft Dynamics 365 Business Central.

## Architecture Overview

```mermaid
graph TB
    A[Record Deletion Entry Points] --> B[Classification Management]
    B --> C[Module Classification]
    C --> D[Table Type Classification]
    D --> E[Retention Priority]
    
    subgraph "Module Classification"
        M1[System]
        M2[Finance]
        M3[Sales]
        M4[Purchase]
        M5[Inventory]
        M6[Warehouse]
        M7[Manufacturing]
        M8[Projects]
        M9[CRM]
        M10[Service]
    end

    subgraph "Table Types"
        T1[Master]
        T2[Setup]
        T3[Document]
        T4[Ledger]
        T5[History]
        T6[Register]
        T7[Archive]
    end
```

## Data Flow Process

```mermaid
sequenceDiagram
    participant User
    participant Classification
    participant Selection
    participant Validation
    participant Execution
    participant Logging

    User->>Classification: Initialize Deletion Process
    Classification->>Selection: Classify Tables
    Selection->>Selection: Set Retention Priorities
    Selection->>Validation: Validate Dependencies
    Validation->>User: Request Confirmation
    User->>Execution: Confirm Deletion
    Execution->>Logging: Record Results
    Logging->>User: Display Summary
```

## Retention Priority Structure

```mermaid
graph TD
    A[Retention Priority] --> B[999: Master/Setup]
    A --> C[300: Documents]
    A --> D[200: History]
    A --> E[150: Register]
    A --> F[100: Ledger]
```

## Module Classification Structure

```mermaid
classDiagram
    class RecordDeletion {
        +TableID: Integer
        +Module: Enum
        +TableType: Enum
        +DeletionPriority: Integer
        +DeleteRecords: Boolean
        +Classify()
        +Validate()
        +Execute()
    }
    
    class ClassificationMgt {
        +ClassifyTables()
        -ClassifyByModule()
        -SetPriority()
        -ValidateDependencies()
    }
    
    RecordDeletion --> ClassificationMgt
```

## Table Type Matrix

| Type | Priority | Description | Example |
|------|----------|-------------|---------|
| Master | 999 | Main data records | Customer, Item |
| Setup | 999 | Configuration data | Posting Setup |
| Document | 300 | Transaction data | Sales Order |
| History | 200 | Historical records | Posted Documents |
| Register | 150 | Register entries | G/L Register |
| Ledger | 100 | Ledger entries | G/L Entry |

## Usage Guide

### 1. Initial Setup

```mermaid
graph LR
    A[Install Tool] --> B[Configure Modules]
    B --> C[Set Priorities]
    C --> D[Define Rules]
```

### 2. Classification Process

```mermaid
graph TB
    A[Select Tables] --> B{Classify}
    B --> C[By Module]
    B --> D[By Type]
    B --> E[By Priority]
    C --> F[Validate]
    D --> F
    E --> F
```

### 3. Execution Flow

```mermaid
graph TB
    A[Select Records] --> B{Validate}
    B -- Pass --> C[Execute]
    B -- Fail --> D[Review]
    C --> E[Log]
    D --> A
```

## Features

1. **Modular Classification**
   - System-specific classifications
   - Business module classifications
   - Integration classifications

2. **Priority-based Retention**
   - Configurable retention periods
   - Priority-based deletion rules
   - Dependency management

3. **Safety Measures**
   - Dependency checking
   - Validation rules
   - Rollback capability
   - Logging and auditing

4. **Integration Support**
   - Standard BC integration
   - Extension handling
   - Cross-module dependencies

## Implementation Guidelines

### Setup Process

```mermaid
graph TB
    A[Install Extension] --> B[Configure Modules]
    B --> C[Set Priorities]
    C --> D[Test Configuration]
    D --> E[Production Deployment]
```

### Execution Process

```mermaid
graph TB
    A[Select Data] --> B[Validate Rules]
    B --> C[Review Impact]
    C --> D[Execute Deletion]
    D --> E[Verify Results]
```

## Best Practices

1. Always review classifications before deletion
2. Maintain backup before major deletions
3. Test on non-production first
4. Document deletion policies
5. Regular review of deletion logs

## Error Handling

```mermaid
flowchart TB
    A[Error Detected] --> B{Type?}
    B -- Validation --> C[Show Validation Error]
    B -- Dependency --> D[Show Dependencies]
    B -- System --> E[Log Error]
    C --> F[User Action Required]
    D --> F
    E --> G[Admin Review Required]
```

## Support & Maintenance

- Regular updates for new BC versions
- Classification updates for new tables
- Performance optimization
- Bug fixes and improvements

## License

This project is licensed under the MIT License.
