# bikeshare-dock-full-review — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

The proposal mostly holds up. The hold button is the right core. I'd change the other two parts, and there are a few gaps to close before the team meeting.

## What works
- **The hold button** stops the loss, and it uses the billing rules ops already agreed, so you don't have to reopen them.
- **Keeping billing out of scope** is the right call. Everything below is UX only.

## What I'd change

1. **Replace "Nearest dock with space" with an inline list.**
   - As written, the button sends a stressed rider to a map where capacity only shows after they tap a dock. That hides the one thing they need.
   - Instead, show the 2–3 nearest docks that have at least one free space. For each, show walking time and live free spaces, for example "Elm St · 4 min walk · 3 spaces". Add a "Navigate" action on each.
   - The capacity data is already in the API, so this is mostly a UI change.
   - Keep "See on map" as a secondary link.

2. **Cut the explainer to one line.**
   - Someone standing at a full dock with the meter running won't read a capacity explainer.
   - Replace it with a status line like "This dock is full (0 of 12 spaces)", and keep the help-center link small and at the bottom.
   - The explainer would work better in onboarding or a first-time tooltip.

3. **Put the two actions in the right order.**
   - Make the hold the primary button, and show the nearby docks right under it.
   - Once the hold is active, the screen should turn into a countdown with the dock list still visible.

4. **Spell out the end of the hold.**
   - Show the remaining time and say what happens when it runs out. Billing resumes, and the rider should know that before they walk off.
   - Add a warning at about 3 minutes left.

## Questions to settle before the meeting
- **When the destination dock fills up while the rider is walking:** can they hold again, or is it once per ride? Ops owns this, so ask them. It's a clarification and doesn't reopen the rules.
- **Time spent reading the screen:** the meter runs until the rider taps the hold button. If ops would accept the hold starting at the failed dock attempt, that closes the gap. If not, keep the screen quick to read.
- **Abuse:** can "hold" be used as free parking? Ops presumably considered this when they agreed the window, but ask whether they track it.
- **Faulty docks:** does "Dock full" cover a dock that's blocked or broken but not full? Those riders need a different path, such as reporting the dock. Check the refund reasons first. Some of the dozen refunds a day may not be capacity problems at all.

## Bigger lever to raise
The best fix is to stop riders reaching full docks. Color-code the map by capacity so it's visible without a tap, and warn riders when their destination dock is nearly full. This screen is damage control, and prevention would cut the refunds at the source. It doesn't have to be in this release, but I'd mention it as a follow-up.

## How to measure it
- Refunds per day, with the current ~12 as the baseline.
- Hold tap rate on the "Dock full" screen.
- Share of holds that end in a successful dock before expiry.
- Time from "Dock full" to ride ended.

This is based only on your description. I haven't looked at the app code or the refund data. If you'd like, I can check the "Dock full" screen implementation and the capacity API for what's feasible.
