# bikeshare-dock-full-review — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

**Short version:** the core is sound. The hold button is what fixes the problem, and it fits inside the ops rules. I'd change the order, cut the explainer, and make the second button do more than open the map.

**What holds up**
- **The hold button targets the real harm.** The refunds come from a running meter, not from the dock being full. Using the existing free-hold window means you don't have to reopen billing.
- **Your constraint is respected.** Nothing here changes billing rules.

**What I'd change**

1. **Merge the two buttons into one primary action.**
   - As proposed, a rider can tap "Nearest dock" and walk off without tapping "Hold". They get billed, then ask for a refund, so you'd only partly fix the problem.
   - Make the main button "Hold bike & find a dock". It starts the hold and opens navigation in one tap.
   - Keep a small secondary link for holding without navigating.
   - Confirm with ops that one tap starting the hold is acceptable. It's the same hold, but they should know.

2. **Make "Nearest dock with space" do real work.**
   - Capacity is live in the API, so don't drop the rider on a map where they have to tap docks to check.
   - Show the 2–3 nearest docks that have space, each with walking time and free spaces. Pre-select the best one and route to it.
   - Compare walking time with the time left on the hold. If the nearest dock is a 20-minute walk, say so, because billing resumes before they arrive.
   - Re-check capacity while they walk. A dock that had two spaces can be full by the time they get there. Alert them and reroute.

3. **Replace the explainer with status.**
   - A stressed rider standing at a full dock doesn't want to read about how capacity works.
   - Use one line instead: "This station is full (0 of 12 spaces)". Put the help-center link in the footer.
   - Spend the space on a visible hold countdown and a plain statement of what happens at expiry.

**Gaps to answer before the team meeting**
- **Hold expiry:** What does the rider see at minute 15? Add a countdown, a push notification at about 3 minutes left, and a clear "billing resumes" state. This is the likely source of the next wave of refund requests.
- **Second hold:** Can a rider hold again if the second dock is also full? Ops owns the answer, but the screen needs a defined state for it. A dead end here recreates today's problem.
- **Hold state persistence:** The hold has to survive the app being closed or backgrounded, and be visible on the active-ride screen.
- **Full vs. faulty:** If a dock is broken, does the rider see the same "Dock full" screen? They need different copy and probably a different path.
- **Bike security during a hold:** Does the bike stay unlocked while the rider walks? Say so on the screen.
- **No dock nearby:** What shows when no dock with space is within a reasonable walk? Decide this now.

**Worth proposing as a follow-up**
- **Prevention:** Show destination-dock fullness during the ride and warn the rider before they arrive. That removes the problem at the source, and the live API already supports it.
- **Metrics:** Track refunds per day, hold usage rate, and how many holds expire before the bike is docked. If holds expire often, the walking-time logic in point 2 needs work, not the copy.
