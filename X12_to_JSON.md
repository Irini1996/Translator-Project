```mermaid
flowchart TB

A[Receive X12 837P file
----
Example:
ST*837*0021~] --> B

B[Parse raw EDI text
----
Example:
Raw file loaded] --> C

C[Split into segments using ~
----
Example:
ST*837*0021
BHT*0019*00*0123
NM1*41*2*PREMIER BILLING SERVICE...] --> D

D[Split each segment using *
----
Example:
NM1 split:
NM1, 41, 2, PREMIER BILLING SERVICE, ..., 46, TGJ23] --> E

E[Identify segment types
----
Example:
NM1 = Name
CLM = Claim
SV1 = Service Line
DTP = Date] --> F

F[Map segments to structured fields
----
Example:
Submitter = NM1(41)
Receiver = NM1(40)
Claim header = CLM
Diagnosis = HI
Service line = SV1] --> G

G[Generate JSON object
----
Example:
transaction {...}
submitter {...}
claim {...}] --> H

H[Send JSON to web app
----
Example:
POST /claims/parse] --> I

I[Render readable claim
----
Example:
Claim 26462967
Total 100
DX 0340] --> J

J[User reviews claim
----
Example:
User validates final output]
```
