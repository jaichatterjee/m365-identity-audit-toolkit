# M365 Identity Audit Toolkit (PowerShell)

## Overview
The **M365 Identity Audit Toolkit** is a modular, menu-driven PowerShell solution designed to **audit and export identity-related data** from Microsoft 365 / Exchange Online environments.

The toolkit focuses on **operational visibility, governance, and reporting**, enabling administrators to export users, shared mailbox members, and both static and dynamic Distribution List memberships in a controlled and repeatable way.

> This project reflects **real-world administrative automation**, built with separation of concerns, centralized configuration, and logging.

---

## Key Capabilities

### 🔹 Shared Mailbox User Export
- Export members of a shared mailbox
- Timestamped CSV output
- Useful for access reviews and audits

### 🔹 Distribution List (DL) Member Export
- Export members of **static Distribution Lists**
- Outputs primary SMTP addresses
- Supports governance and membership validation

### 🔹 Dynamic Distribution List (DDL) Member Export
- Resolves **Dynamic Distribution Lists** using recipient filters
- Exports evaluated members at runtime
- Supports identity and compliance audits

### 🔹 Centralized Authentication
- Single Microsoft 365 connection handled centrally
- No credentials stored or hardcoded

### 🔹 Config & Logging
- Config-driven output and log paths
- Execution events written to log files
- Improved traceability and audit readiness

---

## Repository Structure

```text
m365-identity-audit-toolkit/
│
├── README.md
├── .gitignore
│
├── src/
│ ├── Main.ps1
│ │
│ ├── Config/
│ │ └── config.ps1
│ │
│ ├── Functions/
│ │ ├── Connect-M365.ps1
│ │ ├── Export-Users.ps1
│ │ ├── Get-SharedMailboxMembers.ps1
│ │ ├── Get-DistributionListMembers.ps1
│ │ └── Get-DynamicDLMembers.ps1
│ │
│ └── Logging/
│ └── Write-Log.ps1
│
├── examples/
│ └── sample-output.csv
│
└── docs/
└── audit-scenarios.md
```

---

## How It Works

1. Run `Main.ps1` to start the toolkit
2. Select the desired audit option from the menu:
   - Shared Mailbox Users
   - Distribution List Members
   - Dynamic Distribution List Members
3. Authenticate to Microsoft 365 (Exchange Online)
4. Exported data is written to CSV files in the configured output directory
5. Execution details are logged for traceability

---

## Menu Options

```text
1) Export shared mailbox users
2) Export distribution list members
3) Export dynamic distribution list members
0) Exit
```
---
## Output
```text
CSV files are timestamped to avoid overwrites

Output location is controlled via config.ps1

Sample (sanitized) outputs are provided under examples/
```
---
Configuration

All configurable values are centralized in:
```text
src/Config/config.ps1
```
---
## Logging
- Execution events are written to console and log files
- Logs support troubleshooting and audit evidence
- No sensitive data is logged
---
## Prerequisites
- Windows PowerShell 5.1 or PowerShell 7.x
- Exchange Online Management module
- Account with permission to:(Read mailbox permissions, Read Distribution List and Dynamic DL membership)
---
## Security & Design Notes
- No credentials or tenant identifiers are stored in the repository
- Authentication occurs interactively at runtime
- Functions return objects; exports are handled centrally
- The design prioritizes maintainability and auditability
---
> Disclaimer
This project is shared for demonstration and learning purposes only.
All sample data is sanitized. Use in production environments should follow organizational security and change-management policies.
---
> Author
PowerShell automation focused on Microsoft 365 identity governance, auditing, and operational tooling.
