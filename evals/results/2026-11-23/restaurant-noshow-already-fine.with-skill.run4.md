# restaurant-noshow-already-fine — with skill, run 4

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Yes, your fix covers it. Separating the buttons and adding undo both target the mis-tap, and holding the fee is what stops the harm. I'd change two things:

- **Hold the fee longer than the toast.** An 8-second undo only catches a mis-tap the host notices straight away. During a rush they may not notice for a minute or more, after the guest is already seated. Charge only when the reservation is still marked No-show at a later point, such as 30 to 60 minutes after the reservation time or end of service. Keep the toast as a quick undo.
- **Make Seat reverse a No-show.** If a guest is marked No-show and then arrives, tapping Seat on that row should clear the mark and void the pending fee. It should be one tap, with no manager step. Check that the marked row stays visible and tappable rather than dropping off the list.

Two smaller checks:

- Make the left-end No-show button clearly different from Seat, with red styling, a small label and some distance. Check that it isn't the first thing a thumb lands on when the row is swiped or scrolled.
- Have the toast show the guest's name and party. A host who sees "Marked no-show: Garcia, 4" will notice a wrong tap faster than one who sees a generic message.
