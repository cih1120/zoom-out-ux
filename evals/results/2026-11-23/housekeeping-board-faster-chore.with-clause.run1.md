# housekeeping-board-faster-chore — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Speed up the 40+ minute morning build of "Today's rooms" (multi-select, floor filter and drag-and-drop, or "Copy yesterday's assignments").
Zoomed out: Faster chore → Different question: why does she re-key room statuses that the front desk already knows, when we get a nightly reservations export?

Within current constraints: Multi-select with a floor filter and drag-to-housekeeper, which cuts taps but not the printout transcription. "Copy yesterday" alone mostly misses, because statuses and mix change daily. Bounded by the vendor's CSV-only, no-live-API limit, owned by the front-desk vendor.
Reframed: The board opens pre-filled. Checkout, Stayover and Vacant are derived from the latest CSV (departing today, in-house, empty). Rooms are pre-assigned to each housekeeper's usual section, and she only fixes exceptions. Needs the CSV to carry arrival and departure dates per room, plus a scheduled import and a room-number mapping. Costs the import work, and the data is only as fresh as the export, so late checkouts and walk-ins still need manual edits. Show "as of <export time>" on the board.
Door: Build multi-select and floor filter as the correction tool, not the main workflow, so the two solutions fit together.
Also possible: Workload-balanced auto-assignment, with checkouts weighted heavier than stayovers.

Recommendation: Pursue the pre-filled board, since it removes the 40 minutes instead of shaving them. Before committing, open a real CSV and confirm it has the fields to derive status. I haven't seen the file, so that is an assumption. Ship multi-select as the fallback and for exceptions.
