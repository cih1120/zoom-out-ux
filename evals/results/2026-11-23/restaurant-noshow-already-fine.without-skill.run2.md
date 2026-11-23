# restaurant-noshow-already-fine — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

Yes, this covers the mis-tap. Separating the buttons and adding an undo window are the right moves. A few gaps could still cause wrong charges.

**Gaps in the current plan**

1. **The 8-second hold must run on the server.** If it's a client timer, a tablet that sleeps, loses wifi, reloads, or switches screens could either drop the charge or fire it early. Record the no-show with a "charge after" timestamp and have a backend job do the charging. The undo should cancel that pending job.
2. **Undo has to last longer than the toast.** Hosts often notice a mis-tap a minute later, or when the guest complains. After the toast is gone and the card is charged, there's no way back. Two fixes:
   - Keep an "Undo no-show" action on the row.
   - Make Seat on a no-show row cancel the pending charge or trigger an automatic void or refund.
3. **Charging seconds after the tap is still aggressive.** Even with a perfect undo, a real no-show is usually judged after a grace period, such as 15–30 minutes past the reservation time. I'd consider either of these:
   - Disable No-show until the reservation time plus the grace period.
   - Charge at end of service, or after a manager confirms.
   
   This removes most of the risk, because the Friday-rush mis-tap would almost always happen on a guest who is just arriving.
4. **Toast edge cases.** Check these:
   - Two no-shows in quick succession should not make the first toast replace the second or cancel its undo.
   - The toast shouldn't cover the Seat buttons on rows below it.
   - Navigating away shouldn't dismiss the undo.
5. **Multiple tablets and hosts.** If two devices act on the same row, the state should be consistent. A seated reservation shouldn't be chargeable, and the charge should be idempotent so a retry can't double-charge.
6. **Refund and waiver path.** Make sure a manager can waive or refund the fee. Log who marked the no-show and when, so disputes are easy to resolve.

**Smaller points**

- The red button at the far left is good. If mis-taps continue, consider a smaller size or a confirm step. The undo toast should be enough for most cases.
- Check that a reservation can't be both seated and no-showed, and that the UI reflects that after an undo.

If you only have time for two changes, make them the server-side delayed charge (#1) and the grace-period gating (#3). Those give you the most protection against charging a seated guest.
