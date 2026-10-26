# parking-max-stay-dead-end — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

I'd ship **B and A together, with a small slice of C as plain text**, and skip the full explainer.

**Why this combo**
- The driver is at lunch and needs to know one thing: when they have to move the car. The screen should lead with that, e.g. "2-hour max stay reached. Your car needs to move by 1:45 PM." You can compute the time client-side from the session start and the zone's max stay, so it needs no API change.
- **B (reminder)** fits the most common case, which is someone finishing lunch who will move the car. Make it a one-tap button that's on by default or pre-selected, not a buried toggle. Schedule it for about 10 minutes before the deadline. The user's own push already fires 10 minutes before session expiry, so make sure this one doesn't duplicate it.
- **A (find a nearby zone)** helps drivers who want to stay longer. It's mostly a deep link into the existing map, so it's cheap. Pass the current location and filter or sort by zones with a longer max stay if you have that data.
- **C (explainer)** has the lowest value. A full explainer plus an FAQ link sends people out of the app, and the dead end is part of why they're angry. Use one line of copy ("Downtown zones have a 2-hour limit to keep spaces available") and a small "Learn more" link at most.

**Check before shipping**
- Many cities forbid moving a few spaces and re-parking in the same area, or restrict re-parking within a radius or time window. If A nudges people toward that, you could cause tickets, which is worse than the current reviews. Ask ops or legal, and consider filtering out zones within that radius or adding a line like "Must be outside the X-block limit."
- If your push is triggered client-side, you may be able to fix the root cause without an API change. If the app knows the zone's max stay and the session start, it can drop the "Extend" button from the push when extending can't succeed, and say "Max stay reached, please move your car" instead. That would remove the dead end for most users. It only works if the max stay is available on the client.

**Order of work for this week**
1. Rewrite the error screen with the deadline time and a clear action.
2. Add the B reminder button.
3. Add the A map deep link.
4. Add the one-line C copy.

I can look at the error screen and push-notification code to scope this if you point me at the repo. The current directory looks empty of app code.
