# bikeshare-dock-full-review — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

The proposal mostly holds up. The hold button and the nearest-dock button solve the problem. I'd change the third element, the order of the first two, and one question about the hold that could undercut the whole thing.

**What works**
- The hold button deals with the harm itself, which is the rider paying while stuck. It also fits the constraint: you're using the agreed 15-minute window as is.
- Using the live capacity API fits the problem, since stale data is what makes this screen frustrating.

**What I'd change**

1. **Drop the explainer.** A rider standing at a full dock with the meter running doesn't want to learn how capacity works. It adds reading to a stressed moment and pushes the buttons down. Replace it with one line, such as "This dock is full. Your ride is paused for 15 min while you find another." Keep the help-center link as small secondary text.

2. **Make "Nearest dock with space" do the work, and make it the primary action.** If it only opens the map and the rider has to tap docks to check capacity, they're doing today's workaround with an extra step. Use the API to show the closest few docks that have space, with walking distance and free-space count, and a one-tap route. Be careful with docks showing one free space. That space can be gone by the time the rider walks there. Rank docks with 2 or more spaces higher, or flag the 1-space ones.

3. **Check whether the hold starts by itself or only on a button press.** If a rider has to notice and tap it, some won't, and support will keep refunding those rides. The better design is that the screen appearing starts the hold, and the rider can cancel it. This changes when the hold triggers, not its window or billing rules, so I'd frame it to ops that way. It may still need their sign-off.

4. **Spell out the edge cases of the hold, even without changing the rules.** These are questions for ops, not changes to their rules:
   - What does the rider see as the 15 minutes run down? I'd suggest a countdown and a warning around the 10-minute mark.
   - What happens if the next dock is also full? Can they hold again, or does billing resume?
   - What happens at expiry if they're a minute away from a dock?
   - Is the bike locked while held, and does that matter for theft risk?

5. **Tell "full" apart from "faulty".** A dock that's broken or won't register the bike looks the same to the rider. If you can tell them apart, a faulty dock should offer a different path (report it, and the hold still applies). Otherwise you'll get support tickets from riders who were told the dock was full.

**Worth raising with the team, though not in this scope**
The cheaper fix may be upstream. If the in-ride map warns riders when their destination dock is nearly full, many of them never reach this screen. Even a simple "this dock has 2 spaces left" label would help.

**How I'd measure it**
- Refunds per day for full-dock rides. This is the main number, currently about 12.
- The share of full-dock events where a hold was active.
- The share of holds that end in a successful dock return, compared with holds that expire.

The second and third will tell you whether the hold is working or just delaying the refund.

If you'd like, I can turn this into a one-page summary for the team or sketch the screen copy.
