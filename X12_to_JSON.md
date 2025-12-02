flowchart TB

    %% MAIN STEPS
    A[Receive X12 837P file] --> B
    B[Parse raw EDI text] --> C
    C[Split text into segments using ~] --> D
    D[Split each segment into elements using *] --> E
    E[Identify segment types NM1 CLM SV1 DTP] --> F
    F[Map segments to structured data fields] --> G
    G[Generate JSON claim object] --> H
    H[Send JSON to web application] --> I
    I[Render claim in readable format] --> J
    J[User reviews claim information]

    %% EXAMPLES
    Aex[Example: Raw X12 file\nST*837*0021~ ...]
    Bex[Example: Full text loaded\nas one raw string]
    Cex[Example: Segments list\nST*837*0021\nBHT*0019*00*0123*19981015*1023*RP\nNM1*41*2*PREMIER BILLING SERVICE ...]
    Dex[Example: NM1 split\nNM1 | 41 | 2 | PREMIER BILLING SERVICE | ... | 46 | TGJ23]
    Eex[Example: Segment types\nNM1 = Name\nCLM = Claim\nSV1 = Service line\nDTP = Date]
    Fex[Example: Mapping\nNM1 41 = Submitter\nNM1 40 = Receiver\nCLM = Claim header]
    Gex[Example JSON:\ntransaction {...}\nsubmitter {...}\nclaim {...}]
    Hex[Example: Sending JSON\nto /claims/parse]
    Iex[Example: Rendered claim\nClaim #26462967\nTotal $100\nDiagnosis 0340]
    Jex[Example: User verifies\nall claim info]

    %% RIGHT-SIDE CONNECTIONS
    A --> Aex
    B --> Bex
    C --> Cex
    D --> Dex
    E --> Eex
    F --> Fex
    G --> Gex
    H --> Hex
    I --> Iex
    J --> Jex
