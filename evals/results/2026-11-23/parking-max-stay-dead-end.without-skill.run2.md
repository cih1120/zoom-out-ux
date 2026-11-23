# parking-max-stay-dead-end — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

I'd ship A as the main action, with B as a secondary toggle. C should be one line of text, not a screen.

**A: "Find a nearby zone" (primary).** The driver's real question is what to do now, and the answer is to move the car. A map that opens already centered on them with nearby zones shows them how. Two cautions:
- Many cities don't reset the max stay if you re-park in the same zone or on the same block. If the map shows the current zone or its neighbors as options, you may just move the dead end to the next screen. Exclude the current zone, or label it "Same zone, may not reset the limit." If you don't have zone-group data, the safest filter is to show only zones a few blocks away.
- Pass the context along. Show "Your session ends at 2:14 PM" on the error screen, since you already have that locally, and carry it into the map so the CTA reads "Start a new session in another zone."

**B: "Remind me to move my car" (secondary, cheap).** This is a local notification scheduled at expiry minus about 5 minutes, so it needs no API change. Don't make it the only option, though. The driver already got a push 10 minutes before expiry, so a reminder alone is a second nag with no way to act on it. If you ship it, put the action in the notification too: tapping it opens the map from A.

**C: explainer plus FAQ link (minimal).** A full explainer on an error screen reads as the app explaining why it can't help, and that's what produces the 1-star reviews. Use one line of copy, like "Downtown zones have a 2-hour limit," with a small text link to the FAQ underneath.

**Suggested layout**
1. Headline: "You've reached the 2-hour limit here."
2. Subtext: "Your session ends at 2:14 PM."
3. Primary button: **Find a nearby zone**
4. Toggle: **Remind me to move my car** (default on, since opt-out gets better follow-through)
5. Small link: "About zone limits"

**Longer term:** the error shouldn't be a surprise. The client knows the session start time and, presumably, the zone's max stay. You can change the 10-minute push for max-stay zones from "Extend" to "Time's almost up. Find a new spot" without touching the parking ops API. That would remove most of the dead-end taps in the first place. If the zone's max stay isn't available on the client, that's the one piece of data worth asking parking ops for, since it's a read-only field and not an API behavior change.

I haven't looked at your codebase. If you want, I can look at how the error screen and notifications are wired up and sketch the implementation.
