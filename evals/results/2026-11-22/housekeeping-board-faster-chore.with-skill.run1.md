# housekeeping-board-faster-chore — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Which gives the biggest win for the 7:30 board build: multi-select + floor filter + drag-and-drop, or "Copy yesterday's assignments"?
Zoomed out: Faster chore → Different question: why does she re-enter, by hand from a printout, status data that the nightly CSV already contains?

Within current constraints: Multi-select, floor filter and drag-and-drop. It speeds up the typing but she still builds the board from empty each morning. Bounded by the vendor's nightly-CSV-only export, owned by the front-desk vendor. "Copy yesterday" mostly misses, because yesterday's Checkout/Stayover/Vacant statuses are wrong today.
Reframed: The board is already built when she opens it. Rooms are pre-marked from the CSV (departing today = Checkout, in-house and staying = Stayover, else Vacant). They are pre-assigned across today's housekeepers, with Checkouts weighted heavier than Stayovers. She only fixes exceptions. Needs the CSV imported nightly, with room number, arrival and departure dates confirmed in the file (I haven't seen it), plus a shift roster. Costs an import job and some trust-building. A nightly file misses same-day changes such as late checkouts, early arrivals and walk-ins, so the board must show "as of last night's export" and be easy to correct.
Door: Build multi-select and drag-and-drop as the correction tool on the pre-filled board, not as the main flow.
Also possible: Remembering each housekeeper's usual section as the seed for auto-assignment.

Recommendation: Go with the reframe, since it removes the 40 minutes instead of shaving them. Keep multi-select and drag-and-drop for exceptions. Skip "Copy yesterday" as the main flow, because it copies the wrong half of the data.
```
