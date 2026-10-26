# parking-max-stay-dead-end — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which of A (find a nearby zone), B (move-your-car reminder) or C (zone-rules explainer) goes on the max-stay error screen?
Zoomed out: Escape hatch → Earlier: the driver only learns about the limit when they tap Extend, after they've already planned lunch around the session.
Zoomed out: Explainer → In place: C is a help page for a rule that should be stated next to the duration picker.

Within current constraints: Retitle the error "2h limit reached here". Add A as the primary button and B as a one-tap "Remind me to move" that schedules a local notification for the session end. Drop C. Bounded by the API returning only MAX_STAY_EXCEEDED. Parking ops owns that, but the constraint doesn't block this fix because it's all client-side.
Reframed: Show the limit where the driver picks a duration: "Max stay 2h, you'll need to move by 2:15pm". Cap the picker at the limit. For sessions that can't be extended, make the 10-minute push read "Time's up at 2:15, move your car" with a "Find parking nearby" action in place of "Extend". The error screen then rarely appears. Needs the zone's max stay available on the client, either already in the zone data or shipped as a small client-side config for downtown. Costs a little more than the error-screen change, plus one more thing to keep in sync with ops.
Door: Build A and B as reusable actions rather than error-screen-only code, so the push can launch them later.
Also possible: Cache the max stay the first time the error comes back for a zone.

Recommendation: Ship A+B on the error screen this week. Skip C. Add the limit to the duration picker and the push next, since that's what removes the dead end. I haven't looked at the code, so the first thing to check is whether zone max stay is already on the client.
