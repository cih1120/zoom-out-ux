# housekeeping-board-faster-chore — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which gives the biggest win: multi-select with floor filter and drag-and-drop, or "Copy yesterday's assignments"?
Zoomed out: Faster chore → Different question: why does the supervisor key in Checkout, Stayover or Vacant by hand when the nightly reservations CSV already says which rooms have a departure today, which are in-house, and which are empty?

Within current constraints: Multi-select and a floor filter, with drag-and-drop as the last piece. Copy-yesterday only seeds housekeeper assignments, because yesterday's statuses are wrong for today. Bounded by the CSV-only, no-live-API rule, owned by the front-desk vendor, which won't change this year. It still leaves her marking every room by hand.
Reframed: "Today's rooms" opens already filled in from the latest CSV: departures today are Checkout, other occupied rooms are Stayover, and the rest are Vacant. It suggests assignments by floor or section, seeded from yesterday's housekeeper-to-section pairing and weighted so Checkouts count more than Stayovers. She then corrects exceptions with multi-select, such as late checkouts, early departures and walk-ins after the export ran. Needs a nightly CSV import that lands before 7:30, a room-number mapping, and a visible "data as of" stamp. Costs the import pipeline, a dependence on the vendor's export format, and stale data for same-day changes, which she has to fix by hand.
Door: Build multi-select and the floor filter as the correction tool, so they stay useful on a prefilled board.
Also possible: Flagging rooms where today's data looks doubtful, such as a stayover with no booking.

Recommendation: Do the reframe. It removes the 40-minute manual marking step, and multi-select plus the floor filter handle the exceptions. Ship Copy-yesterday as the assignment seed, and do drag-and-drop last.

Before you commit, check the CSV's arrival time and whether it includes room numbers and departure dates.
