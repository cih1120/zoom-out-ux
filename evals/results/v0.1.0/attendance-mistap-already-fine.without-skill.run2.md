# attendance-mistap-already-fine — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: fail, 4-concise: fail, 5-specific: fail

---

Your fix covers the symptom, but a few things are worth adding.

**What's good**
- The undo toast with a delayed SMS is the most important piece. It makes the mistake recoverable, and that matters more than preventing every mis-tap.
- Outlined styling for Absent helps, mostly because the two buttons stop looking alike.

**Gaps**
1. **The gap is still small.** 16 px is better than 8, but a thumb on a moving bus is roughly 40-50 px wide. Spacing alone won't fix this. The target size matters more. Make each button at least 44×44 pt (Apple HIG) or 48 dp (Material). If a row can't fit three of those, stack the buttons or use a segmented control with a larger row height.
2. **The layout is the root cause.** Absent and Late are adjacent on the right edge, where thumbs are least accurate. Consider putting Present, Late and Absent in an order that keeps Absent away from Late. Absent could sit on the far side, or be less prominent. Absent is the rarest and highest-consequence action, so it should be the hardest one to hit.
3. **Undo has holes.**
   - *Multiple rapid marks:* If a teacher marks three students absent in 5 seconds, is there one toast or three? Each needs its own pending-SMS timer, or the toast needs to say which student it refers to. A toast that only undoes the latest one will confuse people.
   - *Changing the mark directly:* If they tap Late on the same row within 5 seconds, cancel the pending SMS. Don't rely on the toast alone.
   - *App backgrounded, phone locked or app killed:* Does the SMS still send, get dropped, or send immediately? Decide this on purpose. Ideally the pending send is stored on the server with a `send_after` timestamp, not held in a client timer. That way the SMS survives app death and a cancel is a server call.
   - *Offline:* If the undo can't reach the server, the SMS may go out anyway. Handle that.
4. **Toast visibility.** In a loud, hurried setting, a toast at the bottom may be missed or covered by the thumb. Add haptic feedback, and make the row itself show the state (for example a clear "Absent" label and color), so the mistake is visible in the list without a toast.
5. **5 seconds may be too short, and the SMS delay can be longer.** Teachers often finish the roll, then review it. Consider holding all absence SMSs until a "Submit attendance" step, or a delay of a few minutes. A parent notification doesn't need to be instant. This also removes most of the pressure behind the original problem.
6. **Consider confirm on submit.** A summary screen ("3 absent, 2 late") before sending gives one more chance to catch errors, and it costs one tap per class instead of one per student.

**Suggested priority**
1. Server-side delayed SMS, cancelled by any status change (biggest safety win).
2. Larger tap targets and Absent moved away from Late.
3. Your outlined style and the undo toast.
4. A longer send window or a submit step.

One thing to check: do you know whether the mis-taps are Late→Absent only, or also Present→Absent? If it's mostly Late, the layout change in point 2 will fix most of it.
