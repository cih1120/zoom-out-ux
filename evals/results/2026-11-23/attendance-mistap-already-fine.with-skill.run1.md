# attendance-mistap-already-fine — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Zoomed out: nothing. The ask is the right question, because every safeguard sits on the one error (a mis-tap on Absent) at the step where it happens.

Your three changes are sound. I'd refine the plan like this:

- **Hold the SMS until the teacher finishes the roll, not for 5 seconds.** Mark Absent immediately, but send the SMS when the teacher taps "Submit attendance" or leaves the list. A hurried teacher on a loud bus often won't look at a toast within 5 seconds. A submit step also gives them one pass over the row to fix mistakes. If you want a time-based fallback, auto-send after a few minutes of inactivity.
- **Keep the undo, but make it a plain state change.** Tapping Present or Late on an Absent row should cancel the pending SMS. Then the toast is only a hint and you don't need a separate undo path.
- **Make the targets bigger as well as farther apart.** 16 px helps, but a taller Absent target and a larger gap matter more than spacing alone. Consider moving Absent away from Late, for example to the far left, or put Present, Late and Absent in a different order so the two confusable buttons aren't neighbors.
- **Hold the SMS on the server.** If the app is backgrounded, the phone locks or the connection drops during the delay, a client-side timer can lose the cancel. A scheduled send the server can cancel avoids that.
- **Decide what happens when Absent is corrected after the SMS has gone out.** Either send a short "marked in error" follow-up or tell the teacher the parent was already notified. Right now that case is silent.
- **Handle rapid taps.** If a teacher marks several students in a row, toasts shouldn't stack or restart each other's timers. Per-row pending state, like a small "Absent, sending after submit" label on the row, handles this better than toasts.

**Recommendation:** Ship your three changes, but replace the 5-second SMS delay with "send on submit". It removes the time pressure that caused the mis-taps in the first place.
