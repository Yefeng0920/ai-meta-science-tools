# Data dictionary

One row per independently identified resource. `Not publicly documented` is the missing-value marker for unknown URLs and code status, never a fabricated link. Semicolon-separated lists are used for multiple users and tasks. Dates use ISO 8601.

| Field | Definition / allowed values |
|---|---|
| id | Unique stable lowercase slug; never reuse |
| name | Official displayed name |
| category | One of six categories in METHODS.md |
| resource_type | Software, commercial software, agentic system, research software, initiative, benchmark, metadata infrastructure, screening infrastructure or research initiative |
| description | Demonstrated function in one sentence |
| main_tasks | Semicolon-separated tasks |
| target_users | Semicolon-separated user groups |
| inputs | Semicolon-separated input types |
| research_domain | Semicolon-separated domains |
| agentic_level | Non-agentic, AI-assisted, Agentic, or Unclear; a benchmark is Non-agentic even if it tests agents |
| availability | Public, Commercial, Restricted, Research prototype, or Not established |
| source_code_status | Open, Closed, Partially available, or Not publicly documented |
| official_url; repository_url; publication_url | Absolute HTTPS URL or Not publicly documented |
| validation_evidence | Specific evidence and its scope; never inferred from marketing |
| evidence_class | Peer-reviewed, Preprint or technical report, Project documentation, or Developer documentation |
| limitations | Documented or reasoned boundary of use |
| last_verified | YYYY-MM-DD date of curation review |
| curator_notes | Context, including infrastructure exceptions |

Primary category reflects the main documented use; it does not imply exclusivity. Availability indicates existence of an access route, not free unrestricted use. 'Open' source code is recorded only where an official repository is identified. Each row's URL fields support rechecking; see METHODS.md for verification limits.
