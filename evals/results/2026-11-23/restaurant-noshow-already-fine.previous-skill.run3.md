# restaurant-noshow-already-fine — previous skill, run 3

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix works. The error is a mis-tap, and you're handling it where it happens: separating the buttons, coloring No-show red, adding undo, and delaying the charge. Those are one fix, not a stack of safeguards. I'd tighten these gaps before you hand it off:

- **8 seconds is the weakest part.** In a Friday crowd a host can tap, turn to greet someone, and miss the toast. Keep the 8-second toast, but also leave the row in a visible "No-show, Undo" state and hold the charge longer. A grace window of a few minutes, or the end of service, would do. Tapping Seat on a no-show row should then cancel the pending fee. That way a mistake noticed after the toast is still free to fix.
- **Hold the charge on the server.** If the tablet sleeps, loses wifi, restarts, or the host switches screens, a client-side timer might never fire, or might fire twice. Store a pending fee with a charge-after time, and have a backend job charge it. Undo or Seat cancels it.
- **Make the charge idempotent.** One reservation should never be charged twice, for example when two tablets mark the same guest.
- **Cover the already-charged case.** If a guest is charged and then shows up, the host needs a clear way to seat them and refund the fee. This is the case a mis-tap most likely ends in, so decide it now.
- **Check the layout.** Put No-show far enough from Seat, at the left end as you planned, that a thumb can't hit it by accident. Consider also disabling No-show until the reservation time has passed, so it can't be tapped for guests who aren't late yet. If you do that, show the reason in the button's label so the host knows why it's off.
