# parking-max-stay-dead-end — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: What should go on the "Maximum stay reached" error screen: find a nearby zone, a move-car reminder, or a rules explainer?
Zoomed out: Escape hatch and Explainer → Earlier: the problem became unavoidable when the driver picked a duration, or at the latest when the push offered an "Extend" button that can't work.

Within current constraints: Ship A and B on the error screen, with a one-line reason ("2h max in this zone") instead of C. Make the title say what happened and what to do next. Bounded by the API returning only MAX_STAY_EXCEEDED, owned by parking ops, so the screen can't show when the stay ends or any rule detail. This fix still has the driver tap Extend, hit an error, and then act.
Reframed: Show the max stay when the driver picks a duration, for example "Max 2h here, move by 2:40". In max-stay zones, change the 10-minute push. It stops offering "Extend" and says "Max stay ends at 2:40" with "Find nearby zone" and "Remind me" buttons. The error screen stays as a fallback. Needs the zone's max stay in the client's zone data, which the duration picker may already have. If it doesn't, that needs ops to expose it read-only. Costs a push-template variant and picker copy, and the "move your car" buttons have to be built either way.
Also possible: Let the driver start a new session in the same zone when the rules allow it.

Recommendation: Ship the within-constraints fix (A+B, with a one-line reason) this week as the safety net. Check whether the client already has the zone's max stay. If it does, do the push and picker change in the same sprint, because it removes the dead end before the driver reaches it.
