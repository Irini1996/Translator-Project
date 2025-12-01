# Translator-Project
## Elizabeth Claim Flow

```mermaid
flowchart LR
    A[Elizabeth visits doctor] --> B[Provider creates claim]
    B --> C[Claim becomes X12 837P file]
    C --> D[Provider sends X12 to clearinghouse]
    D --> E[Clearinghouse checks formatting and errors]
    E --> F[Clearinghouse forwards X12 to Medicaid payer]
    F --> G[Medicaid receives the claim]
    G --> H[Adjudication: eligibility, coverage, pricing]
    H --> I[Decision: pay, adjust, or deny]
    I --> J[835 payment sent back to provider]
    I --> K[999 or 277 status sent back to provider]

