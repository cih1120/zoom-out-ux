# restaurant-noshow-already-fine — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: your fix works at the step where the error happens, so keep the separate red button and the held fee. I'd change three things.

- **Hold the fee longer than 8 seconds.** In a Friday rush the host who mis-tapped is probably walking guests to a table and won't see the toast. Keep the row in a visible "No-show, undo" state, and charge only after a longer window. That could be end of service or a manager's review, whichever your policy allows. The toast becomes a courtesy and the row state is the real safeguard.
- **Make the hold server-side.** If the charge fires when the toast disappears, a tablet that sleeps, loses wifi, restarts or navigates away could skip the undo window or fire the charge early. The server should schedule the charge, and the tablet should only be able to cancel it.
- **Let Seat cancel a pending fee.** If a row marked no-show is later seated, by the host or by anyone else, the pending charge should drop automatically. That covers the mis-tap nobody notices, which is the case that actually hurts guests.

I inferred that a tap-triggered charge was a deliberate choice, and I haven't checked your payment code. If the billing owner needs the fee to be immediate, the first two points get harder.
