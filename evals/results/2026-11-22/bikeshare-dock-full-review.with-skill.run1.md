# bikeshare-dock-full-review — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Ask: Review the "Dock full" screen proposal (hold button, nearest-dock button, capacity explainer) for riders stuck at a full dock.
Zoomed out: Escape hatch and Explainer → Earlier: the rider is stuck because they learn the dock is full only after arriving, yet live capacity is already in the API, so why not show it before they commit to a dock?

Within current constraints: Your proposal works with one cut. Drop the explainer and its help-center link, because the two button labels already say what to do. I'm inferring the constraint: ops owns the billing rules and the 15-minute free hold, and the hold button only uses that rule. Keep both buttons, and consider having "Nearest dock with space" start the hold automatically. Ops should confirm that, since it is a new trigger for their rule.
Reframed: Show fullness on the map's dock markers during a ride, so it doesn't take a tap. When the rider nears a dock that is full or nearly full, prompt them with "This dock is full. Dock X, 2 min away, has space." Needs: marker states built from the existing capacity API, and a proximity trigger. Costs: some map and in-ride work, plus staleness, because a dock can fill while the rider is on the way.

Door: Keep the "Dock full" screen as the fallback for docks that fill in transit, so the local fix isn't wasted.
Also possible: Reserve a dock slot, or notify the rider when a dock frees up. Both would reopen ops rules, so I'm leaving them out.

Recommendation: Ship the trimmed local fix now, since it stops the refunds. Then build the earlier prompt so riders rarely reach the screen. Track how often the screen appears to see whether it worked.
