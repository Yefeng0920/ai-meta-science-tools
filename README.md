# AI Meta-Science Tools and Resources

A curated directory of tools, systems, infrastructures and benchmarks for evaluating and improving science. Companion resource to a Perspective on agentic AI meta-scientists; it does not claim that a complete autonomous meta-scientist exists.

**Version:** 0.1.0 candidate release · **Verified:** 2026-10-27 · **Entries:** 14

## Build locally

Install R, then `install.packages(c("rmarkdown", "DT", "htmltools"))`. From the repository root run `Rscript R/render_site.R`. The script validates `data/tools.csv` and writes the site to `docs/`. Open `docs/index.html` locally. GitHub Actions runs the same script and publishes `docs/` through Pages when configured.

Edit `data/tools.csv` to add an entry, and include a primary source, a precise limitation and a verification date. See [CODEBOOK.md](CODEBOOK.md), [METHODS.md](METHODS.md), and [CONTRIBUTING.md](CONTRIBUTING.md). Report suspected errors through an issue.

Inclusion is not endorsement. Flags do not establish misconduct. No automated tool should make a consequential determination without human review.

Software source: MIT License. Curated metadata and documentation: CC BY 4.0; attribution requested to the repository contributors. Third-party descriptions and tools retain their own licenses.
