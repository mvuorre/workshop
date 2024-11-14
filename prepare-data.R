library(tidyverse)

# Ensure directories exist
dir.create("data", FALSE)
dir.create("models", FALSE)

# Download from OSF and save to data/
path <- "data/movie-data.rds"
if (!file.exists(path)) {
  out <- read_csv("https://osf.io/zftb3/download")
  out <- out |>
    mutate(
      movie = factor(ID),
      title = factor(Descrip),
      .before = 1,
      .keep = "unused"
    )
  write_rds(out, path)
}

path <- "data/forstmann.rds"
if (!file.exists(path)) {
  out <- read_csv("https://osf.io/h8j9f/download")
  
  out <- out |>
    janitor::clean_names() |>
    select(mood, te, gender, age, survey, h24 = hallucinogens_24) |>
    # Fix non-integer responses (?)
    mutate(mood = floor(mood), te = floor(te)) |>
    drop_na() |>
    mutate(across(c(gender, survey, h24), factor))
  
  write_rds(out, path)
}

path <- "data/metcalfe.rds"
if (!file.exists(path)) {
  tmp_path <- tempfile()
  download.file("https://osf.io/pfaeq/download", tmp_path)
  out <- readxl::read_excel(tmp_path, sheet = "Exp1") |> 
    janitor::clean_names() %>% 
    transmute(
      subject = factor(subject_number),
      item = factor(item_number),
      confidence = as.numeric(confidence),
      curiosity = as.numeric(curiosity),
      accuracy = factor(accuracy_lenient, levels = 0:1, labels = c("Error", "Correct"))
    )
  write_rds(out, path)
}
