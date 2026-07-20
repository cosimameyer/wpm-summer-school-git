# This is a test

# copying from EXAMPLE.R to exercise commits and more
clean_colnames <- function(df) {
  names(df) <- tolower(names(df))              # HEADLINE -> headline
  names(df) <- gsub(" ", "_", names(df))       # "birth year" -> "birth_year"
  df                                           # return the changed data frame
}