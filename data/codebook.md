# Codebook: `data/spotify_clean.csv`

**Source.** TidyTuesday, 21 January 2020, "Spotify Songs"
(<https://github.com/rfordatascience/tidytuesday/tree/main/data/2020/2020-01-21>).
Kaylin Pavlik collected the data in January 2020 from the Spotify Web API with the
`spotifyr` R package, by pulling songs from Spotify playlists in six genres
(EDM, Latin, pop, R&B, rap, rock). Audio features are computed by Spotify.

**Unit of observation.** One song (`track_id`). The raw file has 32,833 rows
(song x playlist); after removing duplicate songs there are 28,356.

**Period.** Popularity is a snapshot taken in January 2020. Release years run
from 1957 to 2020 (median 2016; 72% released in 2010 or later).

| Variable | Meaning | Unit / values |
|---|---|---|
| `track_popularity` | Spotify popularity score, based mostly on how many plays a song has had recently | 0–100 (higher = more popular) |
| `zero_pop` | Popularity is exactly 0 (9% of songs; often duplicate re-releases) | TRUE / FALSE |
| `genre` | Genre of the playlist the song was drawn from | edm, latin, pop, r&b, rap, rock |
| `subgenre` | Playlist subgenre | 24 categories |
| `release_year` | Year the album was released | year |
| `danceability` | How suitable the song is for dancing (tempo, rhythm stability, beat strength) | 0–1 |
| `energy` | Perceived intensity and activity | 0–1 |
| `loudness` | Average loudness of the track | decibels (dB), about −60 to 0 |
| `speechiness` | Presence of spoken words | 0–1 |
| `acousticness` | Confidence that the track is acoustic | 0–1 |
| `instrumentalness` | Likelihood that the track has no vocals | 0–1 |
| `liveness` | Likelihood that the track was recorded live | 0–1 |
| `valence` | Musical positiveness (happy vs. sad) | 0–1 |
| `tempo` | Estimated tempo | beats per minute (BPM) |
| `duration_min` | Song length | minutes |
| `mode` | Major or minor key | major / minor |
| `key` | Estimated key (0 = C, 1 = C#/Db, ...) | 0–11 |
| `track_name`, `track_artist`, `track_id` | Identifiers | text |
