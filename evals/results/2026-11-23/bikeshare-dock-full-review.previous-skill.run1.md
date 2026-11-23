# bikeshare-dock-full-review — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Ask: Review the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer with help link).
Zoomed out: Escape hatch, Explainer → Earlier: the problem becomes unavoidable when the rider rides toward a dock they can't see is full, not when they arrive at it.

Within current constraints: Ship buttons (1) and (2), and drop (3). The label "Dock full" already says it, and the help link sends people away at the moment they're stuck. Make "Nearest dock with space" open the map on that dock, with the hold already running. Bounded by the billing rules and the 15-minute free window, owned by ops. You said these are agreed, so I'm treating them as fixed. They could change, but this plan doesn't need that.
Reframed: Use the live capacity data during the ride. Full and nearly-full docks get a marker on the map without a tap. When the rider heads to a dock that is full or filling up, they get a heads-up with the nearest dock that has space. The "Dock full" screen stays as a rare fallback with the two buttons. Needs a capacity layer on the ride map and a proximity trigger, and no billing change. Costs more build than the screen, and the live data can be stale by the time the rider arrives (a dock can fill while they ride).
Door: Build the hold and nearest-dock buttons so the in-ride heads-up can reuse them.
Also possible: Ask ops whether billing should pause automatically on a failed dock attempt. That would reopen billing, so I'm leaving it out.

Recommendation: Take the trimmed local fix to the team now, since it stops the refunds soonest. Scope the in-ride capacity heads-up as the follow-up that prevents most full-dock arrivals.
