# attendance-mistap-already-fine — with skill plus the Different question clause, run 4

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Zoomed out: nothing; the ask is the right question.

Your fix works on the right error at the step where it happens, and the three parts are one fix, not a stack. Add these refinements:

- **Hold the SMS longer than 5 seconds.** Teachers mark a row and move on, so they usually notice the slip a few rows later. Send when they submit the roll, or after a fixed delay of a few minutes. Make that delay server-side and cancelable, so a backgrounded or closed app can't leak the SMS.
- **Skip the per-tap toast.** Marking 30 students stacks 30 toasts, and nobody reads them on a loud bus. Make the row state the undo: tapping Late or Present on that row cancels the pending SMS. Give a pending-absent row a visible "SMS pending" tag.
- **Enlarge the targets, not only the gap.** Aim for at least 44 px, as a segmented control. If you can, don't put Late next to Absent. Order them Present / Absent / Late, or leave a larger gap before Absent.
- **Plan for the corrected-after-send case.** If an Absent mark is changed after the SMS has gone, decide what the parent gets, such as a short "correction" message. This is the one mistake your fix can't undo.

Recommendation: ship your three changes, but replace the 5-second toast with a longer hold that ends on submit, and make the row itself the undo.
