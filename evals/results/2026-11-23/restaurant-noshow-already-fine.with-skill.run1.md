# restaurant-noshow-already-fine — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Yes, it covers the mis-tap. The fee is held until the toast ends, and that is what makes the fix work. The remaining gaps are about how it's built, not the design:

- **Hold the fee on the server.** Start the timer there, not in the tablet's toast. If the tablet sleeps, reloads, or loses wifi mid-toast, a client-side timer either never charges or charges at the wrong time.
- **Let Seat cancel a pending fee.** A host might notice the mistake after 8 seconds, or tap Seat on that same row. Seating a guest whose fee is still pending should cancel the fee, not wait for the toast.
- **Plan for a fee that has already been charged.** Someone will eventually notice after the toast is gone. Give hosts or managers a one-tap reversal and refund path so it doesn't become a support ticket.
- **Handle several no-shows in a row.** If a host marks two guests quickly, each needs its own undo, or the second toast must not hide the first.
- **Optional: make No-show unavailable until the reservation time plus a grace period.** It could still work early with an extra confirm. Most rush mis-taps happen on guests who have just arrived, so this removes many of them. The catch is that a disabled button needs a visible reason, such as "available at 7:15".

Moving the button to the far left in red is the strongest part of your fix. I'd keep both it and the undo.
