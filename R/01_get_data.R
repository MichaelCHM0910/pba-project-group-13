# 01_get_data.R
# Download the raw Spotify songs data and save a cleaned, one-row-per-song file.
# Run from the project root (open pba-project-group-13.Rproj first).
#
# Source: TidyTuesday 2020-01-21 "Spotify Songs", collected from the Spotify Web API
# with the spotifyr package by Kaylin Pavlik (Jan 2020).
# Codebook: data/codebook.md

library(tidyverse)

raw_url  <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2020/2020-01-21/spotify_songs.csv"
raw_path <- "data/raw/spotify_songs.csv"

# 1. Download the raw file once (data/raw/ is git-ignored) -------------------
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
if (!file.exists(raw_path)) {
  download.file(raw_url, raw_path, mode = "wb")
}

spotify_raw <- read_csv(raw_path, show_col_types = FALSE)
nrow(spotify_raw)   # 32,833 rows: one row per song x playlist

# 2. Clean ---------------------------------------------------------------------
# The same song can appear in several playlists, so keep its first appearance.
# Release dates come in three formats ("2019-06-14", "2019-06", "2019");
# we only need the year.
spotify <- spotify_raw |>
  distinct(track_id, .keep_all = TRUE) |>
  mutate(
    release_year = as.integer(str_sub(track_album_release_date, 1, 4)),
    duration_min = duration_ms / 60000,
    mode         = factor(mode, levels = c(0, 1), labels = c("minor", "major")),
    genre        = factor(playlist_genre),
    zero_pop     = track_popularity == 0   # many are duplicate re-releases; check before dropping
  ) |>
  select(track_id, track_name, track_artist, track_popularity, zero_pop,
         genre, subgenre = playlist_subgenre, release_year,
         danceability, energy, loudness, speechiness, acousticness,
         instrumentalness, liveness, valence, tempo, duration_min, mode, key)

nrow(spotify)       # 28,356 unique songs

# 3. Save the cleaned file (small enough for GitHub) ---------------------------
write_csv(spotify, "data/spotify_clean.csv")
