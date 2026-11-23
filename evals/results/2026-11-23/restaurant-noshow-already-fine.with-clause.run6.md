# restaurant-noshow-already-fine — with skill plus the Different question clause, run 6

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

Ask: Does moving No-show, adding an 8-second undo toast and holding the fee cover the Friday-rush mis-tap?
Zoomed out: Guardrail stacking → Different question: why does one tap on a busy tablet cause an irreversible charge at all?

Within current constraints: Your fix is sound. Separating the buttons, the toast and the held fee all sit on the one mis-tap, so they work as one fix. Make the hold server-side so a sleeping or closed tablet doesn't lose it or charge early. Also let Seat work on a No-show row, so a guest who turns up late can still be seated. I'm inferring the constraint: the fee must be charged within seconds or minutes of the mark. If that's right, it's probably owned by whoever sets the cancellation terms, such as ops or finance.
Reframed: Tapping No-show only marks the row. The fee is charged later, either after a grace window (say 30 minutes past the reservation time) or at end-of-service close-out. Until then, Seat on that row clears the mark and no fee is charged. Needs the cancellation terms to allow delayed charging, and a pending-fees list for the manager to approve at close. Costs a little delay in collecting fees and some risk that the card fails later. Keep the red button at the left, but you can drop the toast, because the mark stays reversible for hours.
Also possible: a "who marked it" log for fee disputes.

Recommendation: Ship your fix if the terms require a prompt charge. If they don't, the delayed charge is simpler and safer, because a mis-tap noticed 20 seconds later is still fixable. Check the terms with whoever owns them first.
