# parking-max-stay-dead-end — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

I'd ship **A + B** and drop C, or shrink it to one line of copy.

**Why this combo:** The driver is at lunch and wants to keep their car legally parked. They have two real outs: park somewhere else, or know when to come back and move. A and B cover those. C explains the rule but doesn't help them, and sending them to a city FAQ in the middle of the problem probably earns another 1-star.

**B first, because it's the cheapest.**
- It needs no API work. It's a local notification, and you already know the session's end time client-side.
- Make it default-on, or a single prominent button ("Remind me 10 min before I have to move"), not a buried toggle.
- Tell them when they have to leave. Change the error to something like "Max stay is 2h. You need to move by 2:15 PM." This costs almost nothing and removes the dead-end feeling.

**A second, with one caveat.**
- It's only useful if the map can show which zones allow a longer stay or a fresh session. If your zone data already has max-stay or rules per zone, filter or badge those zones. If it doesn't, the button just dumps people on a map and is much weaker.
- Check the rules before you suggest "start a new session." Many cities forbid re-parking in the same block or zone within some window to dodge the limit. Don't steer drivers into a ticket. Show only zones that are legitimately different, or add a short note.

**Also worth doing:** if the client has each zone's max stay (or can cache it), stop offering "Extend" in the 10-min push when the session is already at the limit. Change the push to "Time to move your car" with the same two actions. That moves the fix before the dead end, and it needs no API change. If the max stay isn't in your client data, that's the one thing to ask ops for next sprint.

**Scope for this week:**
1. New error copy with the "move by" time.
2. B, the local reminder.
3. A, if zone data supports it. Otherwise, ship 1 and 2 and add A next sprint.
4. A one-line "Zone rules" text link for C, if there's room.

I can look at the error screen and zone data model in the repo to see how much of A is feasible. The git status shows no project files at the moment, so point me to the right directory if you want that.
