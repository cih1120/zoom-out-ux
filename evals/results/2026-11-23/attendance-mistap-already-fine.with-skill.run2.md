# attendance-mistap-already-fine — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. The error happens at the tap, and your three changes all act on that one error: fewer mis-taps, a visible mark, and a delayed SMS. That makes them one fix, not a stack.

Recommendation: ship it, with these refinements:

- **Hold the SMS longer than 5 seconds.** Teachers in a hurry on a loud bus won't look at a toast. Send the SMS when they submit or close the roll, or after a grace period of a few minutes, and keep the toast only as the in-the-moment undo. Changing the row to Late or Present should cancel the pending SMS.
- **Run the delay on the server.** A client-side timer loses the SMS if the app is backgrounded or the phone locks. Mark it "pending" with a send-after time.
- **Make the toast per row.** A teacher tapping through a list will mark several rows in a few seconds, so the toasts mustn't replace each other. Showing the student's name in the toast, like "Maya R. marked absent", also helps catch a tap on the wrong row.
- **Make the targets bigger as well as farther apart.** Aim for about 44 px or more, and use the spacing for the gap between Late and Absent. If the layout allows, also move Absent away from the right edge, where thumbs are least accurate.
- **Use an outline plus a label or icon for Absent.** Don't rely on the style change alone, because it can be missed in sunlight or glare.
