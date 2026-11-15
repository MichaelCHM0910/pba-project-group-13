# Codebook: `data/spotify_tracks_clean.csv`

**Source.** "Spotify Tracks Dataset" by Maharshi Pandya
([Kaggle](https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset),
[Hugging Face](https://huggingface.co/datasets/maharshipandya/spotify-tracks-dataset)).
Collected from the Spotify Web API: 1,000 tracks for each of 114 Spotify genres,
with each track's popularity and Spotify's audio features.

**Unit of observation.** One song (same `track_name` and `artists`). The raw file
has 114,000 rows, cleaned in two steps by `R/01_get_data.R`:

1. A track can be listed under several genres: keep each `track_id` once, under the
   first genre it appears with (89,741 tracks).
2. The same song often appears again on compilation albums under a different
   `track_id`, usually with popularity 0. Keep one row per song (same title and
   artists), the version with the highest popularity (**81,344 songs**).

**Period.** Popularity is one snapshot taken when the data were collected
(published around 2022; the exact date is not documented).

| Variable | Meaning | Unit / values |
|---|---|---|
| `popularity` | Spotify popularity, based mostly on how many plays a track has had recently | 0–100 (higher = more popular) |
| `danceability` | How suitable a track is for dancing (tempo, rhythm stability, beat strength) | 0–1 |
| `track_genre` | Spotify genre the track was collected under | 113 genres after removing duplicates |
| `energy` | Perceived intensity and activity | 0–1 |
| `loudness` | Average loudness of the track | decibels (dB), about −60 to 0 |
| `valence` | Musical positiveness (happy vs. sad) | 0–1 |
| `tempo` | Estimated tempo | beats per minute (BPM) |
| `duration_min` | Track length | minutes |
| `explicit` | Track has explicit lyrics | TRUE / FALSE |
| `track_id`, `track_name`, `artists`, `album_name` | Identifiers (the kept version) | text |
