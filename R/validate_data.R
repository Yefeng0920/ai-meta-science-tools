required <- c('id','name','category','resource_type','description','main_tasks','target_users','inputs','research_domain','agentic_level','availability','source_code_status','official_url','repository_url','publication_url','validation_evidence','evidence_class','limitations','last_verified','curator_notes')
categories <- c('Statistical and methodological checking','Research integrity and publication screening','Agentic meta-research','Scientific claim and manuscript verification','Computational reproducibility and executable research','Evaluation benchmarks')
validate_data <- function(path='data/tools.csv') {
  x <- read.csv(path, fileEncoding='UTF-8', stringsAsFactors=FALSE, check.names=FALSE, na.strings=character())
  stopifnot(all(required %in% names(x)), !anyDuplicated(x$id), nrow(x)>0)
  mandatory <- setdiff(required,c('curator_notes','repository_url','publication_url'))
  for (field in mandatory) if (any(!nzchar(trimws(x[[field]])))) stop('Missing: ',field)
  if (any(!x$category %in% categories)) stop('Invalid category')
  if (any(!x$agentic_level %in% c('Non-agentic','AI-assisted','Agentic','Unclear'))) stop('Invalid agentic_level')
  if (any(is.na(as.Date(x$last_verified, format='%Y-%m-%d')))) stop('Invalid last_verified')
  for (field in c('official_url','repository_url','publication_url')) {
    bad <- nzchar(x[[field]]) & x[[field]]!='Not publicly documented' & !grepl('^https://[^[:space:]]+$',x[[field]])
    if (any(bad)) stop('Malformed URL in ',field, ': ', paste(x$id[bad], collapse=', '))
  }
  x
}
if (sys.nframe()==0) { x <- validate_data(); cat('Validated',nrow(x),'entries\n') }
