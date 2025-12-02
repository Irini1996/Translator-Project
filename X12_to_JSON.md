
```mermaid
flowchart LR

    %% LEFT SIDE MAIN FLOW
    A[Receive X12 837P file] --> B
    B[Parse raw EDI text] --> C
    C[Split into segments using ~] --> D
    D[Split each segment using *] --> E
    E[Identify segment types] --> F
    F[Map segments to fields] --> G
    G[Generate JSON object] --> H
    H[Send JSON to web app] --> I
    I[Render readable claim] --> J
    J[User reviews claim]

    %% RIGHT SIDE EXAMPLES
    Aex[Example: ST*837*0021~]
    Bex[Example: Raw text loaded]
    Cex[Example: Segments: ST*837*0021 ...]
    Dex[Example: NM1 split: NM1 | 41 | PREMIER BILLING SERVICE]
    Eex[Example: NM1 = name, CLM = claim]
    Fex[Example: Mapping NM1 submitter, CLM claim]
    Gex[Example: JSON object created]
    Hex[Example: POST /claims/parse]
    Iex[Example: Claim 26462967 Total 100 DX 0340]
    Jex[Example: User validates claim]

    %% CONNECTION ARROWS TO RIGHT BOXES
    A -.-> Aex
    B -.-> Bex
    C -.-> Cex
    D -.-> Dex
    E -.-> Eex
    F -.-> Fex
    G -.-> Gex
    H -.-> Hex
    I -.-> Iex
    J -.-> Jex
```
