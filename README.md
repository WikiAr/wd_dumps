# WikiData Dumps Processing Scripts

This repository contains scripts used for processing WikiData dumps.

---

## ⚙️ Architecture Components

### 🟩 Data Source
- **WikiData JSON Dump**
  - Input format: large JSON file(s) from [WikiData Dumps](https://dumps.wikimedia.org/wikidatawiki/entities/)
  - Provides structured entity data including labels, claims, and sitelinks.

---

### 🟦 Processing Modules

Each module performs a specific analysis task:

| Module / Script       | Purpose                             | Output Type |
|-----------------------|-------------------------------------|-------------|
| `r_28.py`             | Example custom report               | TSV/CSV     |
| `most_props.py`       | Tracks most frequently used props   | TSV/CSV     |
| `sitelinks.py`        | Analyzes interwiki sitelinks        | TSV/CSV     |
| `claims_max/bot.py`   | Finds items with max number of claims | TSV/CSV     |
| `labels/text.py`      | Aggregates label usage stats        | TSV/CSV     |

> Each subpackage uses a separation of logic (`bot.py`) and formatting (`text.py`, `tab_fixed.py`).

---

### 🟪 External Services

- **WikiData API**
  - Optional integration via `bot.py` modules.
  - Used to upload generated reports as wiki pages or fetch auxiliary metadata.

---

### 🟧 Outputs

- **Local Files**
  - Tabular outputs in TSV or CSV formats.
- **Wiki Pages**
  - Optionally uploaded using MediaWiki API (via `requests` or `mwclient`).

---

### 🟨 Orchestrator

- **`start.sh`**
  - Bash script that runs the pipeline.
  - Invokes `dir_handler.py` and individual analysis modules sequentially or in parallel.

- **`dir_handler.py`**
  - Abstraction layer for reading and iterating through JSON dump files.
  - Shared utility used by all processing modules.

---

## 🔄 Data Flow

1. **Input**:
   - JSON dump → read by `dir_handler.py`.

2. **Processing**:
   - `dir_handler.py` feeds data to each analysis module.
   - Each module processes the input and generates intermediate results.

3. **Output**:
   - Formatted output written to local disk (TSV/CSV).
   - Optional upload via Wiki API to a MediaWiki instance.

4. **Control Flow**:
   - Orchestrated by `start.sh`.
   - Can run modules synchronously or in parallel depending on configuration.

---

## 🏗️ Design Principles

- **Modular ETL Pipeline**
  - Extraction: handled by `dir_handler.py`.
  - Transformation: done in each module’s `bot.py`.
  - Loading: output formatting in `text.py` or `tab_fixed.py`.

- **Separation of Concerns**
  - Clear distinction between data iteration, logic, and formatting.

- **Batch Processing**
  - Designed for offline processing of large static datasets.

---

## 🛠️ Technologies Used

- **Python 3.x**
  - Standard libraries (json, os, etc.)
- **Optional Libraries**
  - `requests` or `mwclient` – for Wiki API interaction
- **Bash Shell Scripting**
  - For orchestration via `start.sh`

---

## ✅ Summary

This project provides a clean, modular, and extensible way to process WikiData JSON dumps and produce actionable insights. Its structure allows for easy addition of new analysis modules while maintaining clear separation of responsibilities across components.

# Reports links
* https://www.wikidata.org/wiki/User:Mr._Ibrahem/Language_statistics_for_items
* https://www.wikidata.org/wiki/Template:Tr_langcodes_counts
* https://www.wikidata.org/wiki/User:Mr._Ibrahem/sitelinks
* https://www.wikidata.org/wiki/User:Mr._Ibrahem/claims
* https://www.wikidata.org/wiki/User:Mr._Ibrahem/p31
