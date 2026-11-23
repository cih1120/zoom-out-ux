# attendance-mistap-already-fine — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Your three changes help, but I'd add a few things.

**What's good**
- The outlined style for Absent helps, as long as the label is also distinct (an icon or the text "Absent"). Don't rely on fill versus outline alone.
- The undo toast is the strongest of the three, because it catches the mistake after it happens.

**What I'd change or add**

1. **16 px is still tight for a hurried tap on a moving bus.** The cause is a destructive action sitting next to a common one. Spacing reduces mis-taps but doesn't remove them. Better options:
   - Make the targets at least 44–48 px and put Late and Absent at opposite ends, so Present sits between them or Absent is on the left.
   - Alternatively, use a segmented control with big targets, where Absent needs a deliberate action such as a long-press or a second tap.
2. **Run the SMS delay on the server, not in a client timer.** If the teacher locks the phone, backgrounds the app or loses signal during the 5 seconds, a client timer either never sends or sends at the wrong time. Queue a cancelable job server-side. Undo, and also switching that student to Late or Present by any route, should cancel the job.
3. **Handle rapid and repeated marks.** Teachers go down the list quickly, so you'll get stacked toasts, or a toast covering the next row's buttons. Use one toast at a time, anchored away from the tap area, or a per-row inline "Absent · Undo" state. Also handle Absent → Late → Absent flip-flops by resetting the delay each time.
4. **Consider a longer or smarter delay.** People often notice the error a few seconds after the toast is gone. Options are a 60–120 second grace period, with the toast only as the quick undo, or sending all absence SMS when the teacher submits or finishes the roll. The second option also fits how roll call works, and it may be the best fix.
5. **Plan for a mistake that gets through.** Add a "send correction" path, such as "Correction: Sam was marked late, not absent", and show teachers which parents were already notified.
6. **Measure it.** Log how often Absent is changed within N minutes. That tells you whether the fix worked and what delay is enough.

If you can only do one thing beyond your plan, do #2, since a client-side delay is the most likely to fail silently. Moving the SMS to submit time (#4) is probably the cheapest way to remove most of the problem.
