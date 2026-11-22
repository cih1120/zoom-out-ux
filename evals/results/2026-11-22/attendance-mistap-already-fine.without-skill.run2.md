# attendance-mistap-already-fine — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Your three changes help, but I think two gaps remain. One is the tap geometry, and the other is the SMS timing.

**Tap geometry**
- 16 px is still tight for a thumb on a moving bus. The error comes from adjacency and target size, so the gap alone won't fix it. Make each target at least 44-48 px and spread the three across the row.
- Don't put Late next to Absent. Order them Absent / Present / Late, or Present / Late / Absent with Absent separated and set apart visually. Then the common confusion has to cross the default option.
- Add haptic feedback on selection, since they can't hear or see well in a rush.
- Outlining Absent is good, but make the selected state obvious too. A filled red chip with an "Absent" label works, and the label means color isn't the only signal.

**SMS delay**
- 5 seconds only catches a mistake the teacher notices immediately. In a hurry they'll often move on and see the error later. Consider holding Absent SMSes until the teacher submits the roll, or for a few minutes, with a "pending" badge on the row.
- Any status change must cancel the pending SMS, not just the Undo button. After a mis-tap the teacher will usually tap Late, not Undo.
- Make the delay server-side, or at least durable. If the app is backgrounded, the phone locks, or the connection drops during the window, the SMS should be sent or cancelled deterministically, not lost or sent twice.
- If the SMS has already gone out, give them a correction path, such as a one-tap "marked in error" follow-up to the parent.

**Toast**
- Don't let it cover the next rows' buttons. Anchor it somewhere that doesn't block tap targets.
- Several quick Absent taps will stack toasts or reset the timer. Define that behavior, ideally one timer per student.

**Validation**
- Log Absent→Late and Absent→Present changes with time deltas. If most corrections happen within a few seconds, the toast is enough. If many come later, the longer delay matters more. Compare before and after at the two affected schools.

If you only do one more thing, I'd make the SMS hold longer than the toast and have any status change cancel it. That removes the embarrassing outcome even when the mis-tap still happens.
