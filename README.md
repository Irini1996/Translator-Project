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


## X12 to JSON Conversion and Viewer Flow

flowchart TB
    A[Receive X12 837P file]
    B[Parse raw EDI text]
    C[Split text into segments using ~]
    D[Split each segment into elements using *]
    E[Identify segment types NM1, CLM, SV1, DTP, HI, etc.]
    F[Map segments to structured data fields]
    G[Generate JSON object representing the claim]
    H[Send JSON data to web application]
    I[Render claim in human-readable format]
    J[User reviews claim information]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    H --> I
    I --> J
