# Optional, non-blocking structural HTTP check. A failure can reflect robots,
# authentication, rate limits or a temporary outage; curators decide manually.
source("R/validate_data.R", local = TRUE)
d <- validate_data()
urls <- unique(unlist(d[c("official_url", "repository_url", "publication_url")],
                      use.names = FALSE))
urls <- urls[urls != missing_value]
if (!nzchar(Sys.which("curl"))) stop("curl executable is needed for link checks")
status <- vapply(urls, function(u) {
  out <- suppressWarnings(system2("curl", c("-L", "-I", "-sS", "--max-time", "15",
                       "-o", "/dev/null", "-w", "%{http_code}", shQuote(u)),
                       stdout = TRUE, stderr = FALSE))
  if (!length(out)) return("unreachable")
  tail(out, 1L)
}, character(1))
result <- data.frame(url = urls, http_status = status)
dir.create("reports", showWarnings = FALSE)
write.csv(result, "reports/link_check.csv", row.names = FALSE, fileEncoding = "UTF-8")
cat("Wrote reports/link_check.csv; investigate non-2xx results manually.\n")
