# parking-max-stay-dead-end — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Which of A (find a nearby zone), B (remind me to move), or C (zone rules explainer) goes on the max-stay error screen?
Zoomed out: Escape hatch and Explainer → Earlier: the max stay is known when the driver picks a duration, so why offer "Extend" 10 minutes before expiry when it will fail?

Within current constraints: Put A and B on the error screen, and skip C. A is the primary button, "Find a nearby zone". B is a one-tap "Remind me to move" that sets a local notification a few minutes before the session ends. Bounded by the extend API returning only MAX_STAY_EXCEEDED, owned by parking ops, so don't try to parse a remaining time from it.
Reframed: In max-stay zones, the 10-minute push stops offering Extend. It says "Max stay ends at 1:40. Move your car," with a "Find a nearby zone" button, so the driver never reaches the dead end. The duration picker also shows "2h max in this zone" when they start. Needs the zone's max stay to be available to the client, either in existing zone data or in a small per-zone config. I haven't checked that, so confirm it before committing. Costs a change to the push logic, plus a case for sessions shorter than the max where extending a little might still work.
Door: Build the error-screen buttons as a small component that the push action can reuse. The reframe then reuses A and B instead of replacing them.
Also possible: Tell the driver on the error screen how long they've already parked, and prefill the map with zones that have no max stay.

Recommendation: Ship A and B on the error screen this week, since they fix the dead end and need no API change. Skip C, because a driver at lunch won't read an FAQ. Then do the earlier push and picker change next sprint, which stops most drivers from reaching the error at all.
