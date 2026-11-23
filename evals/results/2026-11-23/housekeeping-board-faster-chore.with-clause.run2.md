# housekeeping-board-faster-chore — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which of multi-select/drag-and-drop or "Copy yesterday's assignments" speeds up the 7:30 board build the most?
Zoomed out: Faster chore → Different question: why does she start from an empty board and re-key Checkout/Stayover/Vacant from a printout, when the nightly CSV already holds that information?

Within current constraints: Multi-select, a floor filter and drag-and-drop onto housekeeper columns, plus "Copy yesterday's assignments" for the housekeeper-to-floor pairing. Bounded by the vendor's front-desk system (no live API this year), owned by the vendor. She still keys in every status by hand, so I'd expect maybe a 2x gain.
Reframed: Import the nightly CSV so "Today's rooms" opens with statuses already filled in. Departures become Checkout, in-house guests who aren't leaving become Stayover, and empty rooms become Vacant. Housekeepers are pre-assigned from yesterday's pairings. She then only fixes exceptions and rebalances. Needs: confirmation that the export has room number plus arrival and departure dates, and a scheduled import. Costs: the data is as of the export time, so early checkouts and walk-ins still need manual edits. Show an "as of 02:00" stamp and let her override any room.
Door: Keep multi-select for rebalancing, but don't build it as the main flow.
Also possible: Not covered here.

Recommendation: Build the CSV prefill first. The 40 minutes is mostly re-typing data you already receive, and "copy yesterday" can't supply today's statuses because they change daily. Before committing, check a sample export to see whether it has those columns.
