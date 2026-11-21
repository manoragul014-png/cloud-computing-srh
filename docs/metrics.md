
# Shipment Delay and Reliability Analysis

## 1. Launch Customer

- Customer Name: Alpine Outdoor
- Shipper ID: SHP01
- Transportation Mode: OCEAN
- Business Focus: Cost efficiency
- Freshness Target: 15 minutes
- Reliability Target: 55% on-time delivery on every lane
- Cloud Budget: $20 per month

## 2. Objective

The objective is to analyze shipment delays and
delivery reliability for Alpine Outdoor.

The analysis uses Google BigQuery to join the
bookings and schedules tables using schedule_id.

A shipment is considered on time if it arrives
no more than 24 hours after its scheduled arrival.

## 3. Delay per Lane Results

| Trade Lane | Origin | Destination | Shipments | Avg Delay (Hours) | On-Time Rate |
|---|---|---|---:|---:|---:|
| Asia-North Europe | CNNGB | DEHAM | 43 | 42.7 | 51.2% |
| Transpacific | KRPUS | USLGB | 36 | 38.3 | 52.8% |
| Transatlantic | NLRTM | USHOU | 41 | 50.0 | 58.5% |
| North Europe-Asia | GBFXT | CNSHA | 36 | 47.7 | 72.2% |

All shipments use OCEAN transportation.

## 4. Reliability Target Comparison

Customer Reliability Target: 55%

| Trade Lane | On-Time Rate | Target | Status |
|---|---:|---:|---|
| Asia-North Europe | 51.2% | 55% | FAIL |
| Transpacific | 52.8% | 55% | FAIL |
| Transatlantic | 58.5% | 55% | PASS |
| North Europe-Asia | 72.2% | 55% | PASS |

### Summary

- Total lanes analyzed: 4
- Lanes meeting target: 2
- Lanes missing target: 2

## 5. Key Findings

### Lanes Missing the Reliability Target

1. Asia-North Europe:
   - On-time delivery: 51.2%
   - Average delay: 42.7 hours
   - Below target by 3.8 percentage points
   - Status: FAIL

2. Transpacific:
   - On-time delivery: 52.8%
   - Average delay: 38.3 hours
   - Below target by 2.2 percentage points
   - Status: FAIL

### Lanes Meeting the Reliability Target

3. Transatlantic:
   - On-time delivery: 58.5%
   - Average delay: 50.0 hours
   - Above target by 3.5 percentage points
   - Status: PASS

4. North Europe-Asia:
   - On-time delivery: 72.2%
   - Average delay: 47.7 hours
   - Above target by 17.2 percentage points
   - Status: PASS

## 6. Carrier Analysis

The carriers serving the two failing lanes
must be identified from the shipment data.

Lanes requiring carrier investigation:
- Asia-North Europe
- Transpacific

Carrier names: Pending further query analysis.

## 7. Conclusion

The BigQuery analysis shows that Alpine Outdoor
meets its reliability target on only 2 of 4 lanes.

Asia-North Europe and Transpacific fail to
meet the required 55% on-time delivery rate.

North Europe-Asia shows the best reliability,
with 72.2% on-time delivery.

The platform must support a 15-minute data
freshness target while staying within a
monthly cloud budget of $20.

These findings will support the architecture
design and the Lambda versus Kappa decision
in ADR 001.
