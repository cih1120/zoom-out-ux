# attendance-mistap-already-fine — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

Your three changes help, but I'd add a few things.

**Gaps in the plan**

1. **Delay the SMS on the server, not in a client timer.** If the teacher locks the phone, switches apps, or loses signal during the 5 seconds, a client-side timer either drops the SMS or fires it unpredictably. Have the client send the mark, and have the server schedule the SMS with a cancel window.
2. **Handle several marks in a row.** Teachers go down the list quickly. If a new toast replaces the old one, make sure the earlier pending SMS still sends and isn't silently cancelled or stuck. Each absent mark needs its own pending-send record.
3. **Make undo restore the previous state.** It should go back to whatever the row was before, not always to Present. Also cancel the pending SMS when a teacher changes Absent to Late by tapping the row again, not only through the toast.
4. **Decide what happens after the SMS has gone out.** If a teacher fixes a mistake later, you need a plan, such as a "correction" SMS or a note to the parent.

**Things I'd reconsider**

- **Size and order matter more than the gap.** An 8 px to 16 px change is small. Make each target at least 44–48 px tall and wide. Put Absent where a hurried thumb doesn't land on it, for example Absent first and Late in the middle, or Absent visually set apart. Today it sits on the right edge next to Late.
- **Five seconds is short for this setting.** A teacher in a loud, hectic bus may not look at the screen for that long. A longer hold, or holding the SMS until the teacher taps "Submit attendance", gives much more protection. Both options also remove the time pressure.
- **Add a haptic or visual confirmation on the row.** Color the row, or show a clear "Absent" label in it, so a mis-tap is obvious without reading a toast.
- **Make the outline style more than a style change.** Outlined vs. filled is fine as a differentiator, but check that it passes contrast checks in sunlight. A distinct color plus an icon also helps.

**How to know it worked:** log how often Absent is changed to Late or Present within about 30 seconds, and how often the undo toast is used. That rate should drop after the release. If it doesn't, the layout is still the problem.

If you can only do part of this now, do the server-side SMS delay and the bigger, reordered targets first.
