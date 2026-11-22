
# ADR 001: Lambda vs Kappa Architecture

## Status
Proposed

Date: 2026-11-21

## Context
My launch customer is Alpine Outdoor (SHP01), which transports outdoor products by ocean freight.

The platform must meet three targets:
- **Freshness:** Data updated within 15 minutes.
- **Reliability:** At least 55% on-time delivery on every lane.
- **Budget:** Maximum $20 per month.

BigQuery analysis of four shipping lanes shows:
- Asia-North Europe: 51.2% on time (FAIL).
- Transpacific: 52.8% on time (FAIL).
- Transatlantic: 58.5% on time (PASS).
- North Europe-Asia: 72.2% on time (PASS).

Two lanes miss the reliability target. The platform needs timely shipment information to help identify delivery problems.

## Options considered
1. **Lambda Architecture:** Uses separate batch and streaming pipelines. Supports historical and live analysis, but increases complexity and maintenance costs.
2. **Kappa Architecture:** Uses one streaming-first processing pipeline. Supports timely updates with less duplicated processing logic, but requires reliable event handling and replay.

## Decision
I chose **Kappa Architecture** for the proposed design because the customer requires updates within 15 minutes and has a limited $20 monthly budget.

A single event-driven processing path can support timely monitoring without maintaining separate batch and streaming pipelines.

This design aims to reduce operational complexity and help identify shipment delays on the two failing lanes.

## Consequences
- **Cost:** Target is $20/month or less. Usage-based cloud services may keep costs low, but the actual estimate must be verified using the Google Cloud pricing calculator.
- **Freshness:** Designed to provide updates within 15 minutes; this must be tested.
- **Complexity:** One main processing pipeline, but event ingestion, failures, and monitoring still need management.
- **What gets harder:** Reprocessing historical data requires retained events and replay capability. Continuous processing could also increase costs.
