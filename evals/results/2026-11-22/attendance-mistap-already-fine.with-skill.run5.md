# attendance-mistap-already-fine — with skill, run 5 (extra run, this scenario alone)

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: yes, it covers it, with three changes.

- **Replace the toast with a pending state on the row.**
  - A 5-second toast on a loud bus with a hurried teacher will often be missed.
  - If they mark several students in a row, the toasts replace each other, so the earlier marks lose their undo.
  - Instead, show "Absent, SMS pending" on the row itself and let tapping Late or Present correct it. The SMS goes out when the teacher submits the roll, or after a fixed grace window such as 2 to 5 minutes. That is the same delay as your toast, held until it can't be missed.
- **Fix the target size as well as the gap.** Go from 8 px to 16 px as you planned, but also make each target at least 44 px tall and wide. Two buttons close together are only part of the cause. Small targets cause mis-taps too.
- **Keep the outlined Absent style.** A different look helps teachers notice when they've picked the wrong one. It doesn't stop the tap itself.

Check one thing: the SMS delay may be a rule that the schools or your product owner set. If parents need an immediate message, a short grace window is the compromise.
