# Compare and return how many of the values of two vectors are equal
veq <- function(v1, v2) {
  mapply(\(x, y) {x == y}, v1, v2) |> sum()
}

# Format and return a representation of a positional vector
vf <- function(v) {
  n <- names(v)
  if(length(n) == length(v)) {
    return(paste0("[", paste(n, v, collapse = ", ", sep = " = "), "]"))
  } 
  return(paste0("[", paste(v, collapse = ", "), "]"))
}

# Only compare until things are different, no need to continue checking then...
lazy_compare_hash <- function(a, b) {
  l <- min(length(a), length(b))
  for(i in l:1) {
    if(a[i] != b[i]) return(FALSE)
  }
  return(TRUE)
}

# Rotate a matrix 90 deg clockwise
rotate_cw <- function(m) { t(apply(m, 2, rev)) }

# Rotate a matrix 90 deg counter-clockwise
rotate_ccw <- function(m) { apply(m, 1, rev) }

pprint <- function(...) {
  if(exists("DEBUG")) {
    print(paste0(...))
  }
}

`%notin%` <- Negate(`%in%`)

