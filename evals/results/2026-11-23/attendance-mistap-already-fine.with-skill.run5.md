# attendance-mistap-already-fine — with skill, run 5

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. The error is a mis-tap, so the fix belongs at the tap, and delaying the SMS holds the consequence until the teacher can still catch it.

Recommendation: Your three changes cover it. I'd tighten these things:

- **Make the targets bigger, not just further apart.** A 16 px gap helps, but touch targets of about 44–48 px matter more for hurried thumbs. Also keep Late between Present and Absent, so Absent isn't the next button over from Late.
- **Don't use a toast for the undo.** A teacher tapping down 30 rows will stack or replace toasts, and an undo that disappears when the next one appears is unreliable. Put the undo in the row itself, for example "Absent · Undo", with a visible countdown or a "sending in 5s" state. Each row then has its own timer, and the SMS only goes out for rows that are still Absent when it runs out.
- **Consider holding the SMS until the teacher submits the roll,** or until a short window after their last change. A fixed 5 seconds is tight in a loud, chaotic setting. Sending at submit is the more forgiving version of the same fix, and your delay already moves in that direction.
- **Decide what happens after the SMS goes out.** Changing Absent to Late later should probably let the teacher send a short correction to the parent, or at least warn them that the SMS already went. This is the case your fix doesn't cover.
- **Don't rely on the outlined style alone.** Check that its contrast works in sunlight, and that it doesn't read as "disabled".
