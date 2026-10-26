# bikeshare-dock-full-review — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Ask: Review the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer) for the full-dock refund problem.
Zoomed out: Escape hatch → Earlier: the problem became unavoidable when the rider chose a destination dock without seeing it was full, so the question is how to stop riders arriving at full docks.
Zoomed out: Explainer → In place: a capacity explainer with a help link answers a question the rider doesn't have, since they need the next dock and not the theory.

Within current constraints: Your proposal, minus the explainer, with "Nearest dock with space" starting directions straight away instead of opening the map. I inferred the constraint: the 15-minute hold and billing are owned by ops and already agreed. The hold button only uses that rule, so it holds up.
Reframed: Show live dock fullness on the map without needing a tap, and warn on the ride screen when the dock they're heading to is full or nearly full, with an alternative offered then. Keep "Dock full" as the fallback, with hold and nearest-space as its only two actions and the reason in one line of text. Needs live capacity polled during the ride (the API already has it) and a map marker state. Costs ride-screen and map work, and docks can still fill while the rider is en route, so the fallback stays.
Also possible: Reserving a dock slot, or starting the hold automatically on a failed dock attempt. The second would touch the ops-owned rule, so I've left it out.

Recommendation: Ship your fix now with the explainer cut and directions started directly, since it's cheap and stays inside the ops rules. Then build the earlier warning, which is what should reduce the dozen daily refunds.
