# country_names.R
# A lookup to standardise country codes into full names before merging datasets.
#
# We'll edit this file ON THE SAME LINE on purpose, to create (and resolve) a
# merge conflict together. Your instructor assigns each pair ONE numbered line.
# Only edit the line you're told to.
#
# There is often more than one *reasonable* full name for a country --
# that's exactly the point: a conflict is two sensible choices meeting.
# Replace the ___ with the full country name you'd use.

country_names <- c(
  "USA"  = "United States of America",   # 1. Pair    (e.g. "United States"  vs  "United States of America")
  "GBR"   = "___",   # 2. Pair    (e.g. "United Kingdom" vs  "Great Britain")
  "DEU"  = "___",   # 3. Pair    (e.g. "Germany"        vs  "Federal Republic of Germany")
  "USSR" = "___",   # 4. Pair    (e.g. "Russia"         vs  "Soviet Union")
  "PRC"  = "People's Republic of China",   # 5. Pair    (e.g. "China"          vs  "People's Republic of China")
  "USA"  = "___",   # 6. Pair    (e.g. "USA" vs "United States of America")
  "CHE"  = "China",   # 7. Pair   ("Switzerland" vs "Swiss Confederation")
  "AUT"  = "___",   # 8. Pair  ("Austria" vs "Republic of Austria")
  "MLI"  = "___",   # 9. Pair  ("Mali" vs "Republic of Mali")
  "ITA"  = "Italy",   # 10. Pair  ("Italy" vs "Italian Republic")
  "BIH"  = "___",   # 11. Pair  ("Bosnia and Herzegovina" vs "Bosnia-Herzegovina")
  "CIV"  = "___",   # 12. Pair  ("Ivory Coast" vs "Côte d'Ivoire")
  "NOR"  = "___",   # 13. Pair  ("Norway" vs "Kingdom of Norway")
  "NLD"  = "___"    # 14. Instructor demo line
)
