#### UTILS ###

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

drop_nulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}