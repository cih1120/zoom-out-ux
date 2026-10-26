# housekeeping-board-faster-chore — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which gets the supervisor's 40-minute board build down furthest, multi-select, floor filter and drag-and-drop, or "Copy yesterday's assignments"?
Zoomed out: Faster chore → Different question: why does she re-type each room's status from a printout when that status already comes from the front-desk system's nightly CSV?

Within current constraints: Multi-select, floor filter and drag-and-drop. This is your proposal, so I'm inferring its constraint: the board starts empty and she has to enter it by hand. It speeds up entering, not the entering itself. No hard constraint, owned by your team.
Reframed: The board opens already built. The nightly CSV sets Checkout (departing today), Stayover (in-house, not departing) and Vacant (everything else). Assignments are pre-proposed from each housekeeper's usual floor or section. She confirms who's on shift, fixes exceptions and hits go. Needs a nightly CSV import, a room-to-status mapping, and a per-housekeeper default section. Costs: the export is up to a day stale, so late checkouts, extensions and walk-ins still need manual edits. The export must also carry room numbers, which I haven't verified.
Door: Keep manual status edits to one tap per room, so fixing exceptions stays cheap.
Also possible: Flag rooms whose status changed since the export. I'm leaving this out.

Recommendation: Build the CSV pre-fill with default sections. It removes most of the work, where drag-and-drop only speeds it up, and the no-live-API constraint doesn't block it. "Copy yesterday" is the weaker option because the checkout/stayover mix and the staff roster change daily. Add multi-select only if exception edits turn out to be slow.

Check one thing before building: open a real export and confirm it has room numbers and departure dates.
