# bikeshare-dock-full-review — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

```
Ask: Review my "Dock full" screen: hold button, nearest-dock button, capacity explainer.
Zoomed out: Escape hatch, Explainer → Earlier, In place: the rider is blocked because they only learn the dock is full on arrival, so the fix belongs where they pick or approach a dock, with the answer shown beside the control.

Within current constraints: Keep (1) and (2), and make (2) a "Nearest dock with space" button that opens the map already routed to that dock, with free spaces shown on the dock itself.
Cut (3): the explainer and help link answer a question the rider doesn't have, which is where to put the bike.
Replace it with one line, "This dock is full, the nearest with space is 200 m away".
Bounded by the billing rules and the 15-minute free hold, which I'm inferring are fixed; ops owns them and the rules can change.

Reframed: Use the live capacity API before arrival, so riders rarely reach a full dock.
In the ride view, show a "Dock nearly full / full" warning when the rider nears their destination dock, with the nearest alternative.
On the map, show free spaces on every dock marker, not only after a tap.
The Dock full screen then only handles the leftover cases, and the hold can start automatically on that screen with a visible "Billing paused, 15 min free" line.
Needs the app to start the existing hold automatically, an ops trigger decision rather than a rule change, plus a capacity-aware ride view.
Costs more build work than a screen, and capacity can change between the warning and arrival.

Door: Build (2) so it takes a destination and can be reused by the ride view warning.

Recommendation: Ship the trimmed local fix now, and take the early warning to the team as the real fix for the dozen daily refunds.
```

I haven't looked at the codebase, so I haven't checked how the map or API expose capacity.
