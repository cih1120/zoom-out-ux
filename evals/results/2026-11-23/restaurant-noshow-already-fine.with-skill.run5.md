# restaurant-noshow-already-fine — with skill, run 5

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix covers it. It separates the buttons, makes the mistake reversible, and delays the charge to a later step. Before you hand it off, I'd tighten four things:

- **Hold the fee longer than 8 seconds.** A host who is busy seating a party won't see the toast or tap Undo in time, and a toast is gone for good once the tablet sleeps or the app is backgrounded. Keep the toast for quick fixes. Charge only after a grace window past the reservation time, or at end of service, so a mis-tap noticed ten minutes later is still harmless.
- **Make Seat cancel a pending fee.** If a row is marked No-show and the guest then arrives, tapping Seat should void the held charge. Marked rows should stay visible and reversible until the charge runs, not drop off the list.
- **Gate No-show by time.** Before the reservation time plus a grace period, grey out No-show or put it behind a confirm, because nobody can be a no-show yet. This also removes most of the mis-taps during the early rush. If it's disabled, say why on the button, for example "Available 7:15".
- **Make the hold survive failures.** The pending fee should live on the server, not in the tablet's timer. A crash, a lost connection or a second tablet shouldn't charge early or lose the undo.
