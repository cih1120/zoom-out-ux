# attendance-mistap-already-fine — with skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

Ask: Will a wider gap, an outlined Absent button, and an undo toast that delays the SMS stop Late/Absent mis-taps?
Zoomed out: Guardrail stacking → Different question: why does a single tap in a hurry send a parent an SMS at all?

Within current constraints: Your three changes are one fix on one error, so they work together. Make these tweaks:
- Make the tap targets bigger, not only the gap. Right-edge thumb reach is part of the problem.
- Give the toast a visible countdown and keep it up until it expires. If the teacher taps the next row, it must not cut the timer short and send the SMS early.
- Allow only one pending SMS per student, so re-marking a row cancels the earlier send.

This is bounded by "SMS fires automatically on Absent", which I'm inferring and which your product team probably owns.

Reframed: Tapping only records the mark. The SMS goes out when the teacher submits the roll, or at a set cutoff such as 10 minutes after class starts. Until then, any mark can be changed freely, with no toast or timer. This needs a submit step or cutoff and a "not yet sent" state on rows. It costs parents a slightly later notice, and schools may expect immediate messages.

Also possible: A "will notify N parents" summary on the submit screen.

Recommendation: Ship your fix now, with the tweaks above. It's cheap and it stops the embarrassing SMS in the common case. Ask the two schools whether a delay until submit is acceptable. If it is, that replaces the toast entirely. It also covers the case where a mistake is noticed 30 seconds later, after your 5-second toast has expired and the SMS has gone.
