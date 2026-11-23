# bikeshare-dock-full-review — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Review the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer) before it goes to the team.
Zoomed out: Escape hatch → Earlier: the rider is stuck at the dock, but the live capacity data could have reached them while they were still riding.
Explainer → In place: the capacity explainer and help link sit beside a problem that a distance and a "Dock full" label would already answer.

Within current constraints: Keep your two buttons and cut the explainer.
The hold button is correct, because it uses the agreed 15-minute window.
Make "Nearest dock with space" the primary button, with distance and free-slot count on it, and open the map already routed there.
Replace the explainer with one line, "Dock full, 3 free at Main St, 250 m". This is my inference, but I expect nobody opens a help center link mid-ride with the meter running.
Bounded by ops' billing rules and the hold window, which ops owns and which stay untouched.
Reframed: Show fullness on the map pins during the ride, without a tap.
Warn when the rider heads toward a dock that is full or nearly full, and suggest the next one before they arrive.
The "Dock full" screen then becomes a rare fallback, and the refund count should fall.
Needs: the live capacity API on the in-ride map, plus a proximity trigger for the warning.
Costs: more in-ride map work than a screen change, and a nearly-full dock can fill before the rider arrives.

Also possible: the hold could start automatically on a full dock. That changes how the ops-owned hold rule works, so ops would need to agree to it.

Recommendation: Ship the trimmed local fix now, since it's cheap and stops the refunds you can see.
Take the in-ride fullness display to the team as the real fix, and track refunds per day to see whether it works.
```
