if (!"renv" %in% rownames(installed.packages())) {
  install.packages("renv")
}

# restore specific R package versions
renv::restore()

# install cmdstan
cmdstanr::install_cmdstan(version = "2.28.0", overwrite = FALSE)

# check if pandoc is available
if (!rmarkdown::pandoc_available()) {
  print("Please install a recent pandoc version")
}

# knit the Rmarkdown file containing the supplementary material
# this will take a while the first time (< 1 hour)
# model objects are saved as rds files and the report will be rendered to html
# these will be saved in a folder ./output
if (!dir.exists(here::here("output"))) {
  dir.create(here::here("output"))
}

rmarkdown::render(
  input = here::here("src", "bryophytes_changes_flanders.Rmd"),
  output_dir = here::here("output")
  )
