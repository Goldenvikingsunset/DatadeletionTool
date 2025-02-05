# Business Central Data Deletion Tool

A comprehensive data management and retention tool for Microsoft Dynamics 365 Business Central that helps organizations maintain data hygiene while ensuring compliance with data retention requirements.

## Architecture Overview

```mermaid
graph TD
    subgraph Frontend
        A[Record Deletion Page] --> B[Record Deletion Card]
        B --> C[Classification Manager]
    end
    
    subgraph Module Classification
        C --> D[System]
        C --> E[Finance]
        C --> F[Sales]
        C --> G[Purchase]
        C --> H[Inventory]
        C --> I[Manufacturing]
        C --> J[CRM]
        C --> K[Service]
        C --> L[Project]
        C --> M[Warehouse]
        C --> N[Cost Accounting]
        C --> O[Integration]
        C --> P[Utility]
        C --> Q[Foundation]
    end
```

## Data Classification Flow

```mermaid
flowchart LR
    A[Start] --> B[Load Tables]
    B --> C[Classify by Module]
    C --> D[Set Table Type]
    D --> E[Assign Priority]
    E --> F[Set Retention Period]
    F --> G[Review]
    G -->|Approve| H[Execute]
    G -->|Reject| C
    H --> I[Log Results]
```

## Classification Hierarchy

```mermaid
graph TD
    A[Table Classification] --> B[Module Assignment]
    A --> C[Table Type]
    A --> D[Priority Level]
    
    B --> BA[System]
    B --> BB[Finance]
    B --> BC[Sales]
    B --> BD[Other Modules...]
    
    C --> CA[Master]
    C --> CB[Setup]
    C --> CC[Document]
    C --> CD[Ledger]
    C --> CE[Register]
    C --> CF[History]
    C --> CG[Archive]
    
    D --> DA[999: Master/Setup]
    D --> DB[300: Documents]
    D --> DC[200: History]
    D --> DD[150: Register]
    D --> DE[100: Ledger]
```

## Implementation Process

```mermaid
sequenceDiagram
    participant U as User
    participant C as Classification Manager
    participant V as Validation
    participant D as Deletion Engine
    participant L as Logging
    
    U->>C: Initialize Classification
    C->>C: Load Table Metadata
    C->>V: Validate Classifications
    V->>U: Request Confirmation
    U->>D: Approve Deletion
    D->>L: Log Operation
    L->>U: Report Results
```

## Features

### Classification System

| Priority | Type | Description | Retention |
|----------|------|-------------|-----------|
| 999 | Master/Setup | Critical system configuration | Permanent |
| 300 | Document | Transactional data | Configurable |
| 200 | History | Historical records | Limited |
| 150 | Register | Register entries | Limited |
| 100 | Ledger | Ledger entries | Required |

### Module Coverage

- System Tables
- Financial Management
- Sales & Receivables
- Purchase & Payables
- Inventory
- Manufacturing
- CRM
- Service Management
- Project Management
- Warehouse Management
- Integration Tables
- Utility Functions

## Error Handling

```mermaid
flowchart TD
    A[Error Detected] --> B{Error Type}
    B -- Validation --> C[Show Validation Error]
    B -- Dependency --> D[Display Dependencies]
    B -- System --> E[Log Error]
    
    C --> F[User Action Required]
    D --> F
    E --> G[Admin Review Required]
    
    F --> H{Resolved?}
    H -- Yes --> I[Continue]
    H -- No --> J[Cancel Operation]
```

## Installation

1. Import the AL files into your Business Central development environment
2. Compile and publish the extension
3. Configure retention policies
4. Set up user permissions

## Configuration Steps

```mermaid
graph LR
    A[Install Extension] --> B[Configure Modules]
    B --> C[Set Retention Periods]
    C --> D[Define User Access]
    D --> E[Review Classifications]
    E --> F[Enable Logging]
    F --> G[Test Configuration]
```

## Best Practices

1. Always review classifications before deletion
2. Set appropriate retention periods
3. Maintain data deletion logs
4. Regular review of retention policies
5. Test on non-production data first
6. Document company-specific policies

## Safety Features

- Pre-deletion validation
- Dependency checking
- Critical table protection
- Multi-level approval workflow
- Operation logging
- Rollback capabilities

## Support

For technical support or custom implementations, please contact the system administrator or refer to the documentation.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
