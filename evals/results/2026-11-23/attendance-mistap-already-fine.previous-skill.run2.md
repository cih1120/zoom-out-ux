# attendance-mistap-already-fine — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. All three changes sit on one error at the step where it happens, so they're one fix, not a stack.

Recommendation: ship it, with these refinements:

- **Make the SMS delay server-side.** A client-side 5-second timer breaks if the teacher locks the phone or switches apps, and then the SMS either never goes out or goes out early. Queue it with a send-after time. Cancel it if the row changes to Present or Late before then.
- **Make the delay per student, not per toast.** Teachers tap through a list quickly, so several Absent marks can be pending at once. Each needs its own timer, and a new toast shouldn't replace an earlier one. Re-tapping Late on the row should also undo, so the toast isn't the only way back.
- **Consider a longer delay than 5 seconds.** A hurried teacher on a loud bus may not see the toast, and often notices a wrong mark a few seconds later. Holding Absent SMSes until the teacher submits the roll, or for about 2 minutes, would catch more of these. It costs a slightly later SMS for real absences.
- **Prioritize target size over the gap.** Going from 8 px to 16 px helps, but a taller tap area, around 48 px or more, probably matters more for hurried one-handed taps. If the layout allows, don't put Late and Absent next to each other, for example by putting Late in the middle.
- **Keep Absent outlined, but make sure it still reads as selected.** The outline style must not look like an unselected or disabled button once it has been tapped.

Check with the two schools after release. If the mis-taps continue, the next thing to test is the delay length, not more visual changes.
