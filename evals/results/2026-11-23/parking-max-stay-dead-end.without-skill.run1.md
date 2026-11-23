# parking-max-stay-dead-end — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

**Ship A + B, and put one line of plain-language explanation in the error copy instead of C.**

- **B (reminder) is the most valuable.** The driver's real problem is that they have to move the car before the meter expires, and they're at lunch. A reminder keeps them from getting a ticket, which is probably what turns an annoyed review into a 1-star one. It's also cheap. You already know the session's expiry time, so a local notification needs no API change. Default it to on, or make it a single tap, with a lead time of about 5 minutes. They've just received a push, so notification permission is probably already granted. Handle the case where it isn't.
- **A (nearby zone) answers "where do I go?"** It's a deep link to the map you already have. If you can, filter or sort it to zones where a new session is allowed. Many cities bar re-parking in the same zone or block right after a max stay, so the nearest zone isn't always a legal one. Check this with ops, because it affects what you can promise on the button.
- **C (FAQ link) is the weakest.** It sends a stressed driver to a city web page and doesn't help them act. Replace it with a one-line reason in the error text, for example "This zone has a 2-hour limit. You'll need to move your car." That explains the error without a separate screen. Add the FAQ as a small text link at the bottom if you want.

**Screen layout:**
1. **Headline:** "You've reached the max stay for this zone."
2. **Subtext:** the time their session ends and what to do about it.
3. **Primary button:** "Find a nearby zone."
4. **Secondary toggle:** "Remind me to move my car" (5 min before expiry).

**Smaller change to consider:** the dead end starts at the "Extend" push. If the client knows the zone's max stay, which it likely does since it handles duration picking, you can do two things without touching the API:
- Cap the duration picker at the max stay.
- Change the push action to "Find new spot" when the session is already at the limit.

Both can follow after this week's ship, but they would remove most of the failures that cause the reviews.

I haven't looked at your code. If you point me at the error screen and the notification setup, I can help build it.
