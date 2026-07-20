# If you want to play around, here are a few functions from this morning.

# Copy me!  ->  functions/<your-name>.R   (use hyphens, no spaces)
# Then personalise the comment and, if you like, tweak the function.


# --- Version 1: the minimal first bloom 🌸 ----------------------------------
# name <- function(arguments) { body }
colnames_clean <- function(df) {
  names(df) <- tolower(names(df))              # HEADLINE -> headline
  names(df) <- gsub(" ", "_", names(df))       # "birth year" -> "birth_year"
  df # return the changed data frame
  # anna adding a comment here
}

# --- Version 2: defensive (added petal by petal) ----------------------------
# Same idea, but it now refuses bad input loudly and handles a couple of the
# messy-real-world cases (trailing spaces, repeated spaces, punctuation).
clean_colnames_HANNAH2 <- function(df) {
  stopifnot("`df` must be a data frame" = is.data.frame(df))

  new <- names(df)
  new <- tolower(new)                # lower case
  new <- trimws(new)                 # drop leading/trailing spaces
  new <- gsub("[^a-z0-9]+", "_", new)  # any run of non-alphanumerics -> one _
  new <- gsub("^_|_$", "", new)      # no leading/trailing underscore

  if (anyDuplicated(new)) {
    warning("Some cleaned names are duplicated: ", paste(unique(new[duplicated(new)]), collapse = ", "))
  }

  names(df) <- new
  df
}

# --- Bonus: the cells are messy too 🧹 --------------------------------------
# clean_colnames_HANNAH() only ever touches the HEADERS. The values in a real survey
# are messy in their own way — "1) Yes" is a label glued to its code. That's a
# different job, so it's a different function (one function = one job).
clean_values <- function(x) {
  stopifnot("`x` must be a character vector" = is.character(x))
  trimws(gsub("^[0-9]+[)]", "", x))   # drop a leading "1)", "2)", ...
}

# clean_values(c("1) Yes", "2) No", "1) Yes"))   # -> "Yes" "No" "Yes"
#
# Note [)] is a character class holding a single ")" — it saves you escaping it
# as "\\)", which is the kind of thing that trips people up live.

# --- The messy survey, and both functions together --------------------------
survey <- data.frame(
  check.names = FALSE,
  stringsAsFactors = FALSE,
  "Respondent ID" = 1:3,
  "Birth Year"    = c(1990, 1985, 2001),
  "Q1 Response"   = c("1) Yes", "2) No", "1) Yes")
)

clean_survey <- clean_colnames_HANNAH(survey)
clean_survey$q1_response <- clean_values(clean_survey$q1_response)

stopifnot(
  identical(names(clean_survey), c("respondent_id", "birth_year", "q1_response")),
  identical(clean_survey$q1_response, c("Yes", "No", "Yes"))
)
