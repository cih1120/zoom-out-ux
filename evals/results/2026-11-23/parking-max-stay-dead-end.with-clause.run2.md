# parking-max-stay-dead-end — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Which of A (find a nearby zone), B (remind me to move), or C (zone-rules explainer) goes on the "Maximum stay reached" error screen?
Zoomed out: Escape hatch, Prevented not told, Explainer → Earlier: why does the driver see "Extend" on a session that can't be extended? The 2h limit is known when they pick a duration, long before the error.

Within current constraints: Put A on the error screen as the primary button, with B as a secondary toggle that reminds them before the ticketing window.
Skip C, because the error line already states the rule and an FAQ link sends a lunching driver away from the app.
Bounded by the API only returning MAX_STAY_EXCEEDED, owned by parking ops, so this screen can't offer the remaining time or a re-park option.

Reframed: Show the zone's max stay on the duration picker and cap the options there.
When a session is within 10 min of its final allowed expiry, send "Time to move your car by 1:40" with a "Find nearby zone" action in place of "Extend".
The error screen then rarely appears, and A is its fallback.
Needs the client to know each zone's max stay, such as from existing zone data or config. That is an assumption on my part, since I haven't checked the code. Without it this can't ship this week.
Costs a push-copy change and a picker change on top of the screen work.

Door: Build the error screen's "Find nearby zone" as a reusable action that takes the session's location, so the push and picker can call it later.
Also possible: Auto-start a new session in the next zone, once ops opens the API.

Recommendation: Ship A, with B as a toggle beneath it, on the error screen this week, because that needs no new data. If zone max-stay is already available client-side, also do the push and picker change, since that removes the dead end.
```

I can check the repo for where zone max-stay lives, if you'd like.
