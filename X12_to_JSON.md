## X12 to JSON Conversion and Viewer Flow

```mermaid


flowchart TB

    A[Receive X12 837P file] --> B
    B[Parse raw EDI text] --> C
    C[Split text into segments using "~"] --> D
    D[Split each segment into elements using "*"] --> E
    E[Identify segment types: NM1, CLM, SV1, DTP] --> F
    F[Map segments to structured data fields] --> G
    G[Generate JSON object representing the claim] --> H
    H[Send JSON to web application] --> I
    I[Render claim in human-readable format] --> J
    J[User reviews claim information]


    %% ----- RIGHT SIDE EXAMPLES -----

    A --> Aex{{"Example:\nRaw ANSI X12 file:\nST*837*0021~..."}}
    B --> Bex{{"Example:\nFull raw content loaded\nas a text string"}}
    C --> Cex{{"Example:\nSegments:\n['ST*837*0021', 'BHT*0019*00*0123*19981015*1023*RP',\n 'NM1*41*2*PREMIER BILLING SERVICE...', ...]"}}
    D --> Dex{{"Example:\nNM1 split into elements:\n['NM1','41','2','PREMIER BILLING SERVICE','','','','46','TGJ23']"}}
    E --> Eex{{"Example:\nNM1 = Name\nCLM = Claim Info\nSV1 = Service Line\nDTP = Date"}}
    F --> Fex{{"Example:\nNM1(41)=Submitter\nNM1(40)=Receiver\nCLM=Claim header\nHI=Diagnosis codes\nSV1=Service line"}}
    G --> Gex{{"Example JSON:\n{\n  'transaction': {...},\n  'submitter': {...},\n  'claim': {...}\n}"}}
    H --> Hex{{"Example:\nJSON sent to frontend:\nvia API /claims/parse"}}
    I --> Iex{{"Example:\nHTML interface:\nClaim #: 26462967\nTotal: $100\nPrimary Dx: 0340"}}
    J --> Jex{{"Example:\nUser sees readable claim page\nand verifies all data"}}

    %% Positioning
    Aex ---|example| A
    Bex --- B
    Cex --- C
    Dex --- D
    Eex --- E
    Fex --- F
    Gex --- G
    Hex --- H
    Iex --- I
    Jex --- J
