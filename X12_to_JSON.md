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
    Aex[Example:\nST*837*0021~]
    Bex[Example:\nRaw text loaded]
    Cex[Example:\nSegments:\nST*837*0021\nBHT*0019*00*0123...]
    Dex[Example:\nNM1 split:\nNM1 | 41 | 2 | PREMIER BILLING SERVICE]
    Eex[Example:\nNM1 = name\nCLM = claim\nSV1 = service line]
    Fex[Example:\nMapping:\nNM1 submitter, CLM claim header]
    Gex[Example:\nJSON object created]
    Hex[Example:\nPOST /claims/parse]
    Iex[Example:\nClaim 26462967\nTotal 100\nDX 0340]
    Jex[Example:\nUser validates claim]

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
