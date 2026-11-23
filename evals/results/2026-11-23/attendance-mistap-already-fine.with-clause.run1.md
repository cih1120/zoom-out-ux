# attendance-mistap-already-fine — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix is sound. The mistake happens at the tap, and spacing, style and a delayed SMS all act on that one error, so they count as one fix. I'd change three things:

- **Hold the SMS until the teacher finishes the roll, not for 5 seconds.** In a loud bus the teacher may look away or get interrupted, and the toast is gone. Send the SMS when they tap "Done" or after a few minutes of inactivity. A row marked Absent then stays editable until that point, so changing Absent to Late is just another tap. Show a small "SMS pending" note on the row. Check with the two schools that a later SMS is acceptable, since parents currently get it immediately.
- **Drop the per-row toast.** With several absences, the toasts stack and the teacher learns to ignore them. Marking the row itself (outlined style plus the pending note) tells them what happened without interrupting.
- **Enlarge the tap targets, not just the gap.** Aim for at least 44 px per button. With 16 px between them, a mis-tap still happens if the buttons are small. If the row is too narrow, put Late and Absent on opposite sides of Present, so the two never touch.

If you keep the 5-second toast, make the undo tap target large and let the SMS wait until the toast is gone, as you planned.
