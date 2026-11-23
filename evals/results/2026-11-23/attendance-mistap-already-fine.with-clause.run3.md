# attendance-mistap-already-fine — with skill plus the Different question clause, run 3

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Stop teachers mis-tapping Absent for Late, because an Absent tap texts a parent immediately.
Zoomed out: Guardrail stacking, then Different question. The mis-tap isn't the real problem. The real problem is that one hurried tap sends an irreversible message to a parent.

Within current constraints: Your three changes work as one fix, since all of them sit on the same error. Two details need care. First, toasts stack when a teacher marks several students in a row. Second, the SMS has to survive the app being backgrounded or closed during the 5-second delay. Also consider a gap larger than 16 px, or moving Absent away from Late, since 8 px to 16 px is still small for a thumb on a moving bus. Bounded by the "SMS on Absent" behavior, which I'm inferring is a product or school-admin rule. Owned by whoever owns notifications.
Reframed: Marking only records attendance, and SMS messages go out when the teacher submits the roll, or at a fixed cutoff such as 10 minutes after class starts. Before sending, the teacher sees the list of absent students. A wrong tap is fixed by tapping Late, which teachers already know how to do, so there's no new "undo" verb and no toast. Needs a submit step or cutoff, and agreement from the two schools. Costs a delay in parent notification, plus a possible "teacher forgot to submit" case that needs a fallback cutoff.
Also possible: Left out, but easy to add later: a "notified" badge on rows after the SMS goes out.

Recommendation: Do the reframe. It removes the toast and the delayed-send logic, and it covers every cause of a wrong mark, not only mis-taps. If the schools need immediate SMS, ship your three changes with a wider gap and make sure the delayed send survives the app closing.
