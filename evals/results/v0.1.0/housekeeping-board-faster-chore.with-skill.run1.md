# housekeeping-board-faster-chore — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which of multi-select + floor filter + drag-and-drop, or "Copy yesterday's assignments", speeds up building the morning board?
Zoomed out: Faster chore → Different question: why does the supervisor rebuild the board by hand each day, when the nightly CSV already says which rooms depart, stay over or are empty?

Within current constraints: Build multi-select, the floor filter and drag-and-drop, and skip copy-yesterday for statuses because they differ every day.
Bounded by no hard constraint, owned by your team.
Reframed: Open "Today's rooms" already filled from the nightly CSV, with departures as Checkout, in-house guests not leaving as Stayover, and everything else as Vacant.
Assignments start from yesterday's room-to-housekeeper pattern (or each housekeeper's usual section), shown as a suggestion.
The supervisor then only fixes exceptions and moves a few rooms, instead of marking about 100 rooms by hand.
Needs the export to contain room number, arrival date and departure date, and to land before 7:30.
Costs a CSV import and a status rule, and the data is a night old, so early checkouts, walk-ins and extensions still need manual edits.
Door: Keep a manual status change per room (long-press or multi-select) so exceptions stay quick.
Also possible: Highlight rooms that changed since the export, if the vendor ever offers a second daily file.

Recommendation: Do the reframe first, because it removes the 40-minute marking step instead of speeding it up. Then add multi-select and the floor filter, which now serve the exceptions and reassignment, and drop drag-and-drop until the pre-filled board proves it's still needed. First, check one real CSV against the front-desk printout to confirm it carries what you need.
