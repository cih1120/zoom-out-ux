# restaurant-noshow-already-fine — with skill, run 6

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix works. Separating the buttons, adding undo and delaying the charge all act on the mis-tap at the moment it happens. I'd tighten three things:

- **Make the hold server-side.** If the charge fires from a client timer, a tablet that sleeps, loses wifi or reloads mid-toast could either skip the fee or charge it early. The server should hold the pending fee and release it after the window.
- **Make Seat cancel a pending fee.** If a host taps No-show by mistake and then taps Seat on that row, the guest should get seated and the pending charge should be voided. Today's toast-only undo doesn't cover that, and it's the natural recovery.
- **Consider a longer hold than 8 seconds.** A busy host may not look at the toast, so a mis-tap noticed 20 seconds later still charges the guest. Better would be to charge only after a grace period, or at close of service for rows still unseated. The row would show "No-show (pending)" until then. That is a later moment for the same model, so it isn't a redesign, and it makes the toast timing much less critical.

Two smaller points:

- Keep the red No-show button visibly distant from Seat, but don't rely on distance alone.
- Check that there's a refund or void path for the rare charge that goes through anyway.
