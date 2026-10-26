# attendance-mistap-already-fine — with skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

Ask: Stop mis-taps on Absent from firing an SMS to parents.
Zoomed out: Guardrail stacking → Different question: why does one tap in a rushed moment send the SMS at all?

Within current constraints: Your fix, which I'm treating as assuming parents must be texted within seconds of the tap (inferred, not stated).
It is sound, but I'd change three things.
- Check the target size as well as the gap. 16 px of gap with small buttons still invites mis-taps, so aim for about 44 px targets.
- A 5-second toast is easy to miss when the teacher has already moved to the next row, so make sure re-tapping Late or Present in that row cancels the pending SMS.
- Decide what happens when several toasts overlap.

Bounded by an inferred rule that parents hear promptly, owned by the school or product owner.

Reframed: Taps only change the roll, and the SMS goes out when the teacher submits attendance.
A short review line ("2 absent: Ana, Ben") appears at submit.
The gap, outline and toast aren't needed, because a mis-tap costs nothing until submit.
Needs a submit step, or a fixed hold such as 10 minutes after the period starts, and agreement from the two schools on SMS timing.
Costs a delay for parents, and teachers who forget to submit.

Also possible: auto-submit at the end of the period as a backstop.

Recommendation: Ask the two schools whether notification at submit is acceptable. If it is, take the reframe and drop the toast and delay. If it isn't, ship your fix with the three changes above.
