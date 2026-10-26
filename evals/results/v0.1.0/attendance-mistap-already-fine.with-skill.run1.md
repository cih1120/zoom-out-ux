# attendance-mistap-already-fine — with skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: fail, 5-specific: fail

---

Ask: Does widening the gap, outlining Absent and adding a 5-second undo toast cover the mis-taps, or is something missing?
Zoomed out: Guardrail stacking → Different question: why does one tap in a hurry send a message to a parent at all?

Within current constraints: Your three changes, which I'm treating as your proposal. I'm inferring the constraint: parents must hear about an absence quickly, and the SMS is sent per tap. Bounded by that notification rule, owned by product and the schools. The toast has gaps:
- A teacher marking 30 rows quickly gets stacked or overwritten toasts, and a teacher who has moved on won't see the one that matters.
- Nothing covers a mistake noticed after the toast ends.
- A mis-tap on a loud bus usually goes unnoticed in the moment.

Reframed: Tapping only records the mark. The SMS goes out when the teacher submits the roll, from a short review screen that lists the Absent students. A mis-tap becomes a harmless edit before submit, not a sent message. Needs the SMS trigger moved from the tap to the submit action, plus a short "Send to N parents" review step. Costs parents hearing a few minutes later, and a policy check with the two schools.

Door: If you ship the toast, keep the SMS behind a single "pending" state. Then the trigger can later move from "toast expired" to "roll submitted" without a rework.

Also possible: Per-school send timing, or auto-send at a set time after class starts. I'm leaving these out.

Recommendation: Do the reframe if the schools accept a slight delay. It removes the toast and most of the visual safeguards. If they don't, ship your fix with the delayed SMS, and make the undo a single persistent bar instead of a per-tap toast. Either way, the 16 px gap is cheap and worth keeping.
