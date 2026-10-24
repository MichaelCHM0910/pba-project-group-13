# pba-project-group-13

PBA Fall 2026 Final Project - **Group 13**

## Team Members

- 張宏敏 (Team Leader, [@MichaelCHM0910](https://github.com/MichaelCHM0910))
- 陳禹之 ([@yvette50hs-gif](https://github.com/yvette50hs-gif))
- 卓妤薪 ([@minnyx05](https://github.com/minnyx05))
- 黃湘琴 ([@Chelsy114006474](https://github.com/Chelsy114006474))
- 薛函書 ([@vera0051206-ctrl](https://github.com/vera0051206-ctrl))

## Topic

**What makes a song popular?** Do a song's audio features (danceability, energy,
length, ...) predict its Spotify popularity, beyond its genre and release year?
Proposal: [`proposal/`](proposal/).

## Project Structure

```
R/01_get_data.R              download raw data -> data/spotify_clean.csv
data/codebook.md             variable table (name, meaning, unit)
data/spotify_clean.csv       cleaned data, one row per song (created by the script)
analysis/01_data_check.qmd   Milestone 2 data check: summaries, plots, baseline regression
proposal/                    Milestone 2 proposal (English + bilingual team version)
```

To reproduce: open the project in RStudio, run `R/01_get_data.R`, then render
`analysis/01_data_check.qmd`. Packages: `tidyverse`, `here`.

## How to Contribute (for team members)

1. Accept the collaborator invitation sent to your GitHub email.
2. In RStudio: **File > New Project > Version Control > Git**, paste
   `https://github.com/MichaelCHM0910/pba-project-group-13.git`,
   choose a folder that is **not** synced (e.g. `C:\projects`), and click **Create Project**.
3. Open `README.md` and add your name under **Team Members**.
4. In the **Git** tab: check `README.md` → **Commit** → message such as `Add my name to README` → **Commit**.
5. Click **Pull** (blue down arrow) first, then **Push** (green up arrow).

## Data

Large raw data files are kept out of the repository (`data/raw/` is git-ignored).
