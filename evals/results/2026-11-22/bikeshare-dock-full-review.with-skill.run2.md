# bikeshare-dock-full-review — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Does the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer) hold up?
Zoomed out: Escape hatch → Earlier: riders learn the dock is full only after they arrive, even though live capacity is in the API.
Zoomed out: Explainer → In place: the screen can show the fact itself, so an explainer and help link shouldn't be needed.

Within current constraints: Your proposal, with two edits. Keep the hold and nearest-dock buttons. Replace the explainer with one line of live data, such as "Dock full. 3 docks with space within 400 m".
Bounded by the billing rules and the 15-minute free hold, which I'm inferring are fixed. Owned by the ops team.
Reframed: Show dock fullness before arrival, so the full-dock screen rarely appears. On the map, color docks by free spaces without needing a tap. During the ride, when the rider heads toward a dock that is full or nearly full, show a nudge with the nearest dock that has space. The "Dock full" screen stays as a fallback for the race case, where the dock fills while the rider is on the way.
Needs: capacity polling or a push during rides, and a map change. The API already has the data. No billing change.
Costs: more front-end work than the screen alone, and some risk of stale data near full docks.
Door: build the fallback screen's nearest-dock list and map link as reusable pieces, so the in-ride nudge can use them.
Also possible: trigger the free hold automatically on a failed dock-in, which would need ops to agree on a new trigger.

Recommendation: Ship the amended screen now, since it fixes the refund problem and stays inside ops' rules. Take the in-ride warning and the map coloring to the team as the real fix, because most of the dozen daily refunds start with the rider not knowing the dock was full.
```
