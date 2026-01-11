# Identity Audit Scenarios

This document outlines common **identity and access audit scenarios** supported by the M365 Identity Audit Toolkit.

The scenarios reflect real-world operational, governance, and compliance use cases.

---

## 1. Shared Mailbox Access Review

### Scenario
Audit users who have access to shared mailboxes to ensure access is appropriate and up to date.

### Supported By
- Export shared mailbox users

### Use Cases
- Quarterly access reviews
- Offboarding validation
- Privileged access reduction

---

## 2. Distribution List Membership Validation

### Scenario
Export and review members of static Distribution Lists to verify correct membership.

### Supported By
- Export Distribution List members

### Use Cases
- Email distribution accuracy
- Role-based group validation
- Audit evidence for internal reviews

---

## 3. Dynamic Distribution List Evaluation

### Scenario
Resolve and export members of Dynamic Distribution Lists based on recipient filters.

### Supported By
- Export Dynamic Distribution List members

### Use Cases
- Validate dynamic rules
- Ensure compliance with identity policies
- Confirm expected recipients before business communications

---

## 4. Periodic Identity Reporting

### Scenario
Generate periodic CSV exports to support identity reporting and governance activities.

### Supported By
- Timestamped CSV outputs
- Centralized logging

### Use Cases
- Compliance reporting
- Management reviews
- Audit evidence preparation

---

## Notes
- All exports are generated at runtime
- Output reflects the current state of the tenant
- Sample data in this repository is sanitized

This toolkit is designed to support **visibility, auditability, and governance** in Microsoft 365 environments.
