# parking-max-stay-dead-end — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Recommendation: A as the primary action, plus B as a secondary toggle. Skip C as a standalone feature, and fold a one-line version of it into the error copy.**

**Why A**
The driver's actual problem is "I'm still at lunch and can't stay here." Finding a legal place to park is the most direct fix. It's also all client-side: you already have the zone, the location, and the map. You don't need new API support. Pre-filter or sort the map by zones where a new session can start, since a max-stay reset usually means moving to a different zone.

**Why B**
It covers the case where they don't want to move now. A reminder keeps them from getting a ticket, which is the outcome that really drives the 1-star reviews. It's also local: schedule a local notification for a few minutes before the current session expires. It doesn't need backend support. Two caveats:
- Default it to on, or at least pre-selected, so people don't have to find it while frustrated.
- Check that notification permission is granted. If it isn't, ask for it right there.

**Why not C as a feature**
A FAQ link sends them out of the app, to a page that explains the rule instead of solving their problem. It adds little beyond the error message. Change the error copy to something like: *"You've reached the 2-hour limit for this zone. You'll need to move your car to keep parking."* Add a "Learn more" text link at the bottom if you want one. That's about 10 minutes of work.

**Suggested layout**
1. Headline and copy: say what happened and what it means (the 2h limit, when the session ends).
2. Primary button: **Find a nearby zone**.
3. Secondary: **Remind me before my session ends** (toggle).
4. Tertiary: small "Zone rules" link.

**Scoping for the week**
- Day 1–2: new copy, layout, and map deep link.
- Day 3: the local notification and permission flow.
- Day 4: QA and analytics events, including taps on A and B, so you can see which one drivers use.

**Bigger fix to flag**
The best fix is to avoid the dead end. Since the extend call only returns MAX_STAY_EXCEEDED after the fact, the "Extend" button on the push is promising something you can't deliver. If the app knows the zone's max stay (even from a local config, or inferred from past errors), you could change the 10-minute push to say "Move your car" instead of "Extend" when the session is at its limit. That likely needs ops data, so put it on the backlog for after the sprint.

If you'd like, I can look at the codebase and sketch where the error screen, map deep link, and notification scheduling would hook in.
