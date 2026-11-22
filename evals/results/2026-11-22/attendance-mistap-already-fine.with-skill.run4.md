# attendance-mistap-already-fine — with skill, run 4 (extra run, this scenario alone)

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. The error is a mis-tap, and your fix works at the step where it happens. The toast also delays the SMS, which is the consequence.

Recommendation: ship it, with these refinements.

- **Make the delay longer than 5 s and move it to the row.** A hurried teacher moving down the list often won't notice a mistake within 5 s, and stacked toasts get lost. Keep the SMS pending until the teacher submits the roll, or for about 2 minutes. Mark the row as "Absent, SMS pending" so the mistake stays visible.
- **Tapping Late or Present on that row must also cancel the pending SMS.** Don't make Undo the only way to cancel, because the natural correction is to tap the right button.
- **Hold the pending SMS server-side.** Otherwise closing or backgrounding the app inside the window either loses the SMS or sends it early.
- **Give Absent more separation than 16 px.** Use a larger target, or put Absent apart from Late, such as a left-aligned outlined button. The gap is the weakest part of the fix, since a thumb on a moving bus covers more than 16 px.
