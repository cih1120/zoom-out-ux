# attendance-mistap-already-fine — with skill, run 6

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

**Recommendation:** Your fix is sound, and the delayed SMS is the part that matters most. I'd refine it in four ways:

- **Send the SMS when the teacher submits or finalizes the roll, not 5 seconds after each tap.** On a loud bus, teachers tap through many rows quickly, so per-row toasts will stack and vanish unread. Submit is also where they naturally review the list. Show a short "3 absent" summary there, and keep an editable grace window of a few minutes after submit if you want one.
- **Make the tap targets bigger.** Aim for at least 44–48 px tall and wide, and treat that as more important than the 16 px gap. A mis-tap is mostly a target-size problem, and the right edge is the hardest place to hit on a phone.
- **Keep the outlined Absent style, and also give the selected state a clear color and icon.** Then a glance at the row shows what was actually recorded.
- **Keep a lightweight per-row undo.** Changing a mark should be one tap, with no confirmation dialog.

If you'd rather ship exactly what you described, do that. The SMS delay already stops the damage, and moving it to submit is a small follow-up.
