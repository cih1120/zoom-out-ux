# restaurant-noshow-already-fine — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix works. It sits on the mis-tap itself, and the three parts (separation, undo, held fee) are one safeguard, not a stack. Before you hand it off, tighten these points:

- **Hold the fee on the server.** Don't tie the charge to the toast timer on the tablet. If the tablet sleeps, the app is backgrounded or the host navigates away, a client-side timer may never fire, or may fire early. Schedule the charge server-side and let Undo cancel it.
- **Make 8 seconds the feedback window, not the only chance.** In a Friday rush, a host may not notice the toast before it disappears. Let the row stay in a "No-show, charge pending" state with an Undo, and charge later, for example 15–30 minutes after the reservation time or at end of service. Nobody needs the $25 within seconds, and this catches mis-taps that nobody noticed.
- **Make Seat cancel the pending charge.** If a host taps Seat on a row that's marked No-show, the guest has arrived. That tap should cancel the hold and seat them, with no extra step.
- **Keep a refund path.** After the charge goes through, a host or manager should be able to reverse it from the same row. Some mis-taps will still get through.
- **Keep the red No-show button off the Seat side.** Left end is fine. Make the button's tap target big enough that it doesn't invite its own mis-taps.
