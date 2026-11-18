# gold-trend

Daily report: is gold **above or below its trend** over 1 month, 3 months, 6 months, 1 year, 5, 10 and 20 years,
and what price the **next trading day** would need to be exactly on each trend.

- Data: Yahoo Finance COMEX gold futures `GC=F`, daily closes since 2000 (Stooq, LBMA and FRED block scripts or no
  longer publish gold). Today's bar is ignored until 17:00 New York time (session not finished).
- Trend: least-squares line through the **log** of the closes in each window (= exponential trend), extended to the
  next trading day. R² shows how well prices followed the line - near 0 means that window has no real trend.
- Output: `~/Gold-Reports/<last close date>.html` + `.md`, `latest.html`, `data/gold-daily.csv`; desktop pop-up with
  "Open report". Takes ~1 s; no AI model involved (numbers are computed, never written by a model).

| Command / icon | What it does |
|---|---|
| `gold-run-now` / **Gold Report - Run Now** | make the report now |
| `gold-mode nightly` / **Gold Report - Nightly Auto** | run automatically Mon-Fri 06:30 (a missed run is made at next boot) |
| `gold-mode manual` / **Gold Report - Manual Mode** | no automatic runs (the default after install) |
| `gold-mode status` | mode, next run, last run, newest report |
| `gold-trend --json FILE --now 2026-11-18T10:00 --out DIR` | offline test run |

Install: `./install.sh`. Trend lines are fitted to past prices; they are not a forecast and not financial advice.
Drafted by a local Gemma E2B, fixed and finished by Claude.
