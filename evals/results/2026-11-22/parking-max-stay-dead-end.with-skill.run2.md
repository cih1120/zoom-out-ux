# parking-max-stay-dead-end — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Which of A (nearby zone), B (move-car reminder) or C (zone-rules explainer) goes on the "Maximum stay reached" error screen?
Zoomed out: Escape hatch, Explainer → Earlier: the problem became unavoidable when the push offered "Extend" in a zone where extending can't work, and when the duration picker let the driver plan past the max stay.

Within current constraints: Rewrite the error screen as "You've hit the 2h limit here. Move your car by [session end time]." Make A the primary button, and make B a secondary one-tap "Remind me" tied to the existing session end time. Drop C, because the screen can state the rule in one line itself. Bounded by the API returning only MAX_STAY_EXCEEDED, owned by parking ops.
Reframed: Cap the duration picker at the zone's max stay, with "Max 2h in this zone" shown there. In max-stay zones, send the 10-minute push as "Time to move your car" with a "Find parking" action instead of "Extend". The driver then never reaches the dead end. Needs the app to know each zone's max stay and the session start, from zone metadata it may already have. I haven't checked the code. Costs a change to the picker and the push logic. If max stay is counted across sessions in a zone, the client can't compute it without an API change.
Door: Keep the rewritten error screen as the fallback for anything the client can't predict, so the local fix isn't thrown away.
Also possible: Auto-suggest the nearest open zone in the push itself, and add a "Parked until" timer on the session screen.

Recommendation: Ship the rewritten error screen with A and B this week, since it needs no API change. Then do the picker cap and the push change, which should remove most of the 1-star cases. Skip C.
```

Can you confirm whether the app already has zone max-stay data on the client? That decides whether the reframe is a small change or needs ops.
