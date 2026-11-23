# bikeshare-dock-full-review — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Ask: Review the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer).
Zoomed out: Escape hatch and Explainer → Earlier: the problem becomes unavoidable when the rider picks a dock or heads for one without seeing that it's nearly full, so the fix belongs there.

Within current constraints: Your proposal is the local fix, and I'm inferring its constraint from what you said.
Merge buttons 1 and 2 into one tap: start the free hold and open the map with the nearest dock that has space.
Make that button show the dock name, the walking distance and the number of free spaces.
Drop the explainer. The screen can just say "This dock is full," and the dock list answers the rest.
This is bounded by the billing rules and the 15-minute window, which the ops team owns. I haven't changed either.

Reframed: Show free spaces on every dock marker on the map, and during the ride warn when the rider's destination dock is nearly full.
Riders then rarely reach a full dock, and the "Dock full" screen shrinks to the merged button.
Needs the live capacity API on map markers, which should be a small change. If you want the hold to start automatically on arrival at a full dock, ops would have to confirm that.
Costs a map and ride-screen change, plus a decision on how stale a capacity reading can be before you stop trusting it.

Also possible: reserving a space at the destination dock. I'm leaving it out.

Recommendation: Ship the merged screen now, since it needs no ops change.
Add capacity on the map markers right after. That should cut the refunds the most, because riders stop arriving at full docks in the first place.
