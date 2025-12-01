# Translator-Project
## Elizabeth Claim Flow (Provider → Clearinghouse → Medicaid → Back)

```mermaid
flowchart LR
    A[Elizabeth visits Doctor] --> B[Provider creates Claim]
    B --> C[Claim becomes X12 837P file]
    C --> D[Provider sends X12 to Clearinghouse]
    D --> E[Clearinghouse checks formatting • fixes errors]
    E --> F[Clearinghouse forwards X12 to Medicaid (Payer)]
    F --> G[Medicaid receives the claim]
    G --> H[Adjudication: Eligibility • Coverage • Pricing]
    H --> I[Decision: Pay • Adjust • Deny]
    I --> J[835 Payment/ERA sent back to Provider]
    I --> K[999/277 Status files sent back to Provider]
