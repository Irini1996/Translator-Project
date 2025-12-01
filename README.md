# Translator-Project
## Elizabeth Claim Flow

```mermaid
flowchart TB
    A[Elizabeth visits doctor]
    B[Provider creates claim]
    C[Claim becomes X12 837P file]
    D[Provider sends X12 to clearinghouse]
    E[Clearinghouse checks formatting and errors]
    F[Clearinghouse forwards X12 to Medicaid payer]
    G[Medicaid receives the claim]
    H[Adjudication: eligibility, coverage, pricing]
    I[Decision: pay, adjust, or deny]
    J[835 payment sent back to provider]
    K[999 or 277 status sent back to provider]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    H --> I
    I --> J
    I --> K

