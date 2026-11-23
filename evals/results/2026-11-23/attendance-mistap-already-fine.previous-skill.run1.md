# attendance-mistap-already-fine — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Zoomed out: nothing; the ask is the right question.

Recommendation: your fix is sound. It puts the safeguards on the one error, at the step where it happens. I'd change three things:

- **Send the SMS later.** The toast fixes a mis-tap you notice within 5 seconds. A hurried teacher on a loud bus may not look back at the list that fast, and several taps in a row will stack or replace toasts. Hold the SMS until the teacher finishes or submits the roll, or until a longer window such as 2 minutes. Keep the row visibly marked "Absent" in the meantime, and let them change it by tapping another option. The undo toast then becomes optional.
- **Size the tap targets, not only the gap.** Aim for at least 44–48 px per target. Going from 8 px to 16 px helps, but a bigger target helps more when someone is rushing. If the layout allows, move Absent away from the right edge or put Late between Present and Absent, so a slip off the edge doesn't land on Absent.
- **Make Absent look different, but don't hide it.** The outlined style is fine. Make sure the marked state is unmistakable, for example with a color plus an icon or label, not color alone.

Test it with a teacher who is walking and tapping one-handed. That will show you quickly whether the 5-second window is long enough.
