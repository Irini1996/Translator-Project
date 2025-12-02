flowchart LR

    %% MAIN STEPS (LEFT SIDE)
    A[Receive X12 837P file] --> B
    B[Parse raw EDI text] --> C
    C[Split into segments using ~] --> D
    D[Split each segment into elements using *] --> E
    E[Identify segment types NM1 CLM SV1 DTP] --> F
    F[Map segments to structured fields] --> G
    G[Generate JSON object] --> H
    H[Send JSON to web app] --> I
    I[Render readable claim] --> J
    J[User reviews claim]

    %% EXAMPLES (RIGHT SIDE)
    Aex[Example:\nST*837*0021~]
    Bex[Example:\nRaw text loaded]
    Cex[Example:\nSegments:\nST*837*0021\nBHT*0019*00*0123...]
    Dex[Example:\nNM1 split:\nNM1 | 41 | 2 | PREMIER BILLING SERVICE | ...]
    Eex[Example:\nNM1 = name\nCLM = claim\nSV1 = service line]
    Fex[Example:\nMapped:\nNM1 submitter\nNM1 receiver\nCLM claim header]
    Gex[Example:\nJSON:\ntransaction {...}]
    Hex[Example:\nPOST /claims/parse]
    Iex[Example:\nClaim 26462967\nAmount 100\nDX 0340]
    Jex[Example:\nUser validates claim]

    %% CONNECTIONS BETWEEN STEP AND EXAMPLE
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
