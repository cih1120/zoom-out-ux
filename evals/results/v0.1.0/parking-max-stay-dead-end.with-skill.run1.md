# parking-max-stay-dead-end — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which of A (find nearby zone), B (remind me to move), C (rules explainer), or a combo, for the "Maximum stay reached" error screen?
Zoomed out: Escape hatch and Explainer → Earlier: the max stay is known when the driver picks a duration, so why wait until the push to say it?

Within current constraints: Ship A as the primary button, with B as a secondary toggle that defaults to a reminder at expiry. Skip C. Bounded by the extend API returning only MAX_STAY_EXCEEDED, owned by parking ops. The app doesn't need the API changed for this. It can hold the zone's max stay locally, or learn it from the failed call.
Reframed: Show the limit where the driver chooses the duration ("Max 2h in this zone"), and cap the picker at it. Reword the push too: "Expires in 10 min. Max stay reached, move your car by 2:40," with a "Find nearby zone" action. The error screen then rarely appears, and a driver who reaches it already knows why. Needs the per-zone max stay in the app's zone data (config or a client-side table, not an API change) and a copy change to the push. Costs a bit more than a week if zone data isn't already on the client.
Door: build A and B so they work from the push and the session screen, not only the error screen. Then the reframe reuses them.
Also possible: auto-start a new session in the neighboring zone, and a "rules" link on the zone card. I'm leaving both out.

Recommendation: Ship A plus B on the error screen this week, and drop C (a rules explainer doesn't help someone standing at lunch). Put the max stay on the duration picker and the push next, since that stops most of the dead ends before they happen.
