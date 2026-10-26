# bikeshare-dock-full-review — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Does the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer) hold up, and what would you change?
Zoomed out: Escape hatch and Explainer → Earlier: the problem becomes unavoidable when the rider picks a destination dock without seeing that it's full, so the question is how they could have known before they arrived.

Within current constraints: Your proposal, minus the explainer, with "Nearest dock with space" opening the map already centered and filtered to docks that have room.
Bounded by the ops-owned billing rules and the 15-minute hold (inferred from what you said), owned by the ops team.
Reframed: Show live capacity on the ride map itself, with full docks marked and nearby docks ranked by free spaces, and warn the rider on approach if their dock is full.
The "Dock full" screen then shrinks to the hold button, the nearest-dock button and one line of text beside them, such as "Full right now. Your 15 free minutes start when you tap hold."
Needs the capacity API field on the ride map pins and a polling interval for it.
Costs a map change that takes longer to build than a new screen, and the warning needs a decision about how close counts as "approaching".
Also possible: Starting the hold automatically when a full dock is detected, which I'm leaving out because it changes a billing rule that ops owns.

Recommendation: Build your two buttons now and replace the explainer with the one in-place line. Then add capacity to the ride map, because that is what actually reduces the dozen daily refunds.
