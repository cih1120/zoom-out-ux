# attendance-mistap-already-fine — with skill plus the Different question clause, run 5

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Zoomed out: nothing. The ask is the right question, because the mistake happens at the tap, and your fix holds the SMS back at that same step.

Recommendation: your three changes are sound. I'd refine two things.

- **Hold the SMS until the teacher finishes, not for 5 seconds.** A hurried teacher on a loud bus will miss a 5-second toast. In a 30-row list, toasts will also stack and overlap. Send the SMS when the teacher submits the roll, or after a short quiet window of about 2 minutes. Any change to a student's mark before then cancels the pending SMS. The undo toast then becomes optional. A quiet "3 absent" summary on the submit screen is enough to catch a mis-tap.
- **Make the targets bigger, not only farther apart.** 16 px of gap is still tight for a thumb on a moving bus. Aim for tap targets of at least 44–48 px. If the layout allows, move Absent off the screen edge.

Two checks before you ship:
- Some schools may expect the parent SMS immediately. If so, a 2-minute window is probably the longest delay they'd accept. Confirm that with the schools.
- Test what happens when a teacher changes a mark after the SMS has gone out. That case can't be undone.
