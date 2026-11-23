# housekeeping-board-faster-chore — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Which speeds up the morning board most: multi-select, floor filter and drag-and-drop, or "Copy yesterday's assignments"?
Zoomed out: Faster chore → Different question: the board starts empty and is rebuilt by hand every day from a printout of data we already receive each night. Why is she entering it at all?

Within current constraints: Build multi-select, the floor filter and drag-and-drop. Copy yesterday is a weaker add-on because yesterday's Checkout/Stayover mix and staffing rarely match today's. Bounded by the nightly-CSV-only rule, owned by the front-desk vendor, which won't change this year. Nothing in this option conflicts with that rule.
Reframed: Import the nightly CSV so "Today's rooms" opens pre-filled. Departures today become Checkout, continuing stays become Stayover, and everything else becomes Vacant. She then fixes exceptions instead of entering every room. Needs the export to carry room numbers, departure dates and a delivery time before 7:30. Costs an import job and a "draft from last night's export" label, because early checkouts, late departures and walk-ins won't be in it.
Door: Build multi-select as the correction tool, so exceptions are quick to fix.
Also possible: Suggest assignments by floor and workload once statuses are pre-filled.

Recommendation: Pre-fill from the CSV first, since it removes the room-by-room status entry that is probably most of the 40 minutes. I haven't measured that, so time her once. Check that the export has assigned room numbers, because some systems only assign them at check-in. If it doesn't, fall back to the local fix and add "Copy yesterday" later as a starting point for assignments.
