# bikeshare-dock-full-review — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

**Short answer:** the core of it holds up. The hold button is the right fix, and it works within the billing rules ops already agreed. I'd change the ordering, cut the explainer, and add something upstream.

**What works**
- The hold stops the meter running, which is the thing that generates the refunds. Nothing in it reopens billing.
- "Nearest dock with space" uses data you already have.

**What I'd change**

1. **Merge the two buttons into one primary action.** As two buttons, a rider can tap the map first and browse while the meter runs, and then ask for a refund anyway. Make the primary button "Hold bike and find the nearest open dock". It starts the hold and opens the map already routed to a dock with space. Keep a small "just hold" option if you want it.

2. **Rank docks by walking time, not straight-line distance.** Show the walking time next to the time left on the hold. A dock that is 12 minutes away on a 15-minute hold is a trap. Also show a countdown on the screen after the hold starts.

3. **Handle the race on arrival.** Live capacity can be stale by the time they get there, and a second full dock is the most likely way this flow fails. Prefer docks with 2 or more free spaces, and say what happens if the next dock is full too. Ask ops whether a second hold is allowed. You don't need to change the rule, but the screen has to match whatever it is.

4. **Cut the capacity explainer.** Someone standing at a full dock with a running meter won't read it, and it doesn't help them act. Replace it with one line like "This dock is full" and a small "Why does this happen?" help-center link.

5. **Say plainly what happens when the hold ends.** For example: "Billing resumes at 14:32." This is existing policy, so you're only making it visible. It should cut down on "you charged me anyway" contacts.

6. **Prevent the problem upstream.** This screen treats the symptom. Since capacity is live in the API, show it during the ride. Examples are a warning when the rider approaches a dock that is full or nearly full, and a map overlay for free spaces. This probably removes more refunds than the screen does. It's worth raising with the team as phase 2, even if you don't build it now.

**Questions to settle before the meeting**
- Is the hold one per ride? What does the rider see if they've already used it?
- What does the screen do if the capacity API fails or location permission is off? It should fall back to hold only.
- Should the hold start automatically when a full dock is detected? That would be the biggest win, but it may be a policy question for ops. Raise it as a question, not a requirement.

**How to measure it**
Use the roughly 12 refunds a day as the baseline. Track hold usage, how often holds expire before the rider docks, rides that end at a different dock, and support contacts that mention full docks. If holds frequently expire, the problem is walking distance or stale capacity, not the screen.

I'm going from your description only. I haven't looked at the app's code or the map implementation.
