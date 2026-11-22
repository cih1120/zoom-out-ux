# parking-max-stay-dead-end — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Recommendation: A as the primary action, plus a light version of B. Skip C as a standalone feature.**

**Why A first:** The driver's actual problem is "I'm at lunch and my car is about to be ticketed." A nearby-zone button solves it directly: they move the car and start a fresh session. It also needs no API changes, since you already know the current zone and the user's location.

**Why B second:** Some drivers will see the error and decide to finish lunch and walk back. A "Remind me to move my car" toggle, set for 5 to 10 minutes before the hard expiry, catches them. It's a local notification, so it needs no backend work either. Make it default-on or a single tap, or people will skip it and get ticketed anyway.

**Why not C:** A FAQ link explains the rule but doesn't help them. That's the experience that's currently generating the 1-star reviews. Instead, fix the copy. Replace "Maximum stay reached for this zone" with something like "This zone has a 2-hour limit. You'll need to move your car to keep parking." One sentence of explanation covers most of what C would have delivered.

**Suggested screen layout:**
1. Plain-language explanation, including the time the session ends
2. Primary button: **Find a nearby zone**
3. Secondary: **Remind me to move my car** (toggle or button)
4. Small text link to the FAQ, if you want it

**Things to check before building:**
- **Same-zone restarts.** Some cities forbid re-parking in the same zone or block within a set distance. The map should exclude or flag the current zone, or drivers will start a new session there and get ticketed. Confirm with ops what the rule is, even if they're not touching the API.
- **Which zones to show.** Ideally, filter to zones that allow a fresh stay and are within a short walk. If you don't have that data, show all nearby zones sorted by distance and mark the current one as unavailable.
- **Notification permissions.** If the user has push enabled (they got the 10-minute push), local notifications should work. Handle the denied case gracefully.
- **Earlier warning.** Longer term, the better fix is sending the "10 min before expiry" push with different content in max-stay zones, such as "Your max stay ends soon. Move your car or you'll be ticketed." That gets ahead of the dead end. It needs only the zone's max-stay value, which you likely already have for the session.

If you want, I can look at the codebase and sketch the implementation for the error screen, starting with where the `MAX_STAY_EXCEEDED` handling lives.
