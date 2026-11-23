# restaurant-noshow-already-fine — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix covers it. You separate the buttons and make the charge reversible, and both changes act on the mis-tap itself. I'd change three things:

- **Move the charge later than 8 seconds.** Eight seconds is short in a Friday rush. A host who taps and then turns to greet a party will miss the toast, and the card gets charged anyway. Charge at the end of service instead, or after a grace window past the reservation time. Then the undo is just tapping Seat, and the toast becomes a nice extra. If your payments or policy owner needs the fee to land sooner, keep the 8 seconds but make it longer, around 30.
- **Hold the fee on the server.** The tablet can sleep, lose Wi-Fi or restart during the countdown. If the pending charge lives only in the app, it can fire early or never fire, so store it server-side with a release time.
- **Let Seat override a no-show.** A guest marked no-show who then walks in should be seatable from that same row, and doing so should cancel the pending fee. If the row greys out after No-show, the host can't fix the mistake.

Putting No-show at the left end in red, away from Seat, is the right call.
