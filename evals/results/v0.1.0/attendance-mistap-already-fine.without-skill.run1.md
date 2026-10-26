# attendance-mistap-already-fine — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

Mostly yes, but the toast and SMS delay have gaps, and the 16 px gap is the weakest part.

**Layout**
- **Target size matters more than the gap.** Mis-taps in a hurry come from small targets as much as close ones. Make each target at least 44×44 pt, and check that 16 px gap plus that size still fits on narrow phones.
- **Consider moving Absent away from Late.** For example, put it on the opposite end from Late, or give it a different shape. You may not want to break teachers' muscle memory, so test that.
- **Don't rely on outlined style alone.** Make sure the selected state of each option is also clear after tapping, with a label or icon and not just color. Teachers scanning the list should see who is marked Absent.

**Toast and SMS delay**
- **Hold the SMS on the server.** A client-side 5 s timer fails if the teacher locks the phone, switches apps, or loses signal. Depending on how you build it, the SMS either never sends or sends early. Store a `send_after` timestamp and have the server send it, and cancel it on undo or change.
- **Cancel on any change.** If the teacher taps Late or Present on that row within the window, the SMS should cancel. Don't make Undo the only way to cancel.
- **Handle rapid marking.** Teachers mark many rows quickly. Each Absent mark needs its own pending SMS and timer, so a new toast doesn't replace or cancel an earlier one. Stacked toasts can also cover the rows being tapped, so check that.
- **5 s is probably too short.** In a loud, rushed situation people often notice the mistake when they scan the list afterward. Consider holding SMSes until the teacher submits attendance, or for a few minutes, with a visible "will notify parent" state on the row.
- **Plan for mistakes after the SMS goes out.** Show a "Parent notified" state on the row. Changing it afterward should offer a one-tap correction message to the parent, such as "Marked absent by mistake; [student] is present."

**Validation**
Log how often Absent is changed within a few minutes of being set, before and after the release. That will show whether the fix worked and whether 5 s is enough.

If you only have time for two changes, make them the server-side delayed SMS with cancel-on-change and larger tap targets.
