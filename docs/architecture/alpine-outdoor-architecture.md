# Alpine Outdoor (SHP01) Architecture Diagram

## Architecture Decision
Kappa Architecture (streaming-first)

## Customer Targets
- Freshness: 15 minutes
- Reliability: 55% on-time delivery on every lane
- Budget: $20/month
- Business focus: Cost efficiency

```mermaid
flowchart LR

%% -------------------------
%% Kappa / Streaming-first architecture
%% -------------------------

subgraph L0["Launch Customer: Alpine Outdoor (SHP01)"]
    T1["Freshness target: 15 minutes"]
    T2["Reliability target: 55% on every lane"]
    T3["Budget: $20 / month"]
    T4["Focus: Cost efficiency"]
end

subgraph L1["LIVE Layer - Streaming-first (Kappa)"]
    A["Shipment events / bookings / schedule updates"]
    B["Cloud Pub/Sub"]
    C["Dataflow streaming job"]
    D["BigQuery live metrics"]
    E["Ops dashboard / Looker Studio"]
end

subgraph L2["Optional storage / replay"]
    F["Cloud Storage raw events"]
end

subgraph L3["Users / Consumers"]
    G["Operations team"]
    H["Supply chain / carrier monitoring"]
end

A --> B
B --> C
C --> D
D --> E
C --> F
D --> G
D --> H

subgraph L4["Reliability monitoring output"]
    R1["Asia-North Europe: 51.2% - FAIL"]
    R2["Transpacific: 52.8% - FAIL"]
    R3["Transatlantic: 58.5% - PASS"]
    R4["North Europe-Asia: 72.2% - PASS"]
end

D --> R1
D --> R2
D --> R3
D --> R4
