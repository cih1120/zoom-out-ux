# attendance-mistap-already-fine — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

Your plan covers the main failure, but a few gaps are worth closing.

**What's good**
- The undo toast with a delayed SMS is the most important piece. It makes the mistake recoverable, which matters more than preventing every mis-tap.
- The outlined style for Absent helps the teacher see what they just chose.

**What I'd change or add**

1. **16 px isn't the real fix.** Mis-taps in a hurry on a moving bus come from small targets, not just small gaps. Check that each button is at least 44×44 pt (iOS) or 48×48 dp (Android). If the buttons are narrower than that, a wider gap will shrink them further or push the row off-screen.
2. **Move Absent away from Late.** Both sit on the right edge. Put them at opposite ends, for example Absent / Present / Late. Alternatively, make Absent a separate, visually distinct control. Distance matters more than a few extra pixels.
3. **Toast details.**
   - If the teacher marks several students absent quickly, stack the toasts or batch them. Otherwise a new toast replaces the old one and the earlier undo disappears.
   - The SMS delay should be tied to each student's own state, not to the toast's display. Keep a per-student pending timer. Cancel it on any change back to Present or Late.
   - Send the SMS from the server, with a delay, instead of using a client-side timer. If the teacher locks the phone, closes the app, or loses signal on the bus within those 5 seconds, a client-only timer could drop the SMS or fire it late.
   - Make the toast persist if the teacher scrolls or switches screens.
4. **Consider a longer or smarter delay.** Five seconds covers an immediate mis-tap. It doesn't cover a teacher who notices the error a minute later. Options:
   - Hold SMS sends until the teacher taps "Submit attendance," or for a few minutes after the last change.
   - Let teachers correct a mark afterward, and suppress the SMS if it hasn't been sent yet.
5. **Handle the after-send case.** If a wrong SMS does go out, give the teacher a one-tap "send correction" message to the parent, so the mistake doesn't stay embarrassing.
6. **Don't rely on color or outline alone.** Add a label or icon to Absent so it's distinguishable for color-blind users and in bright sunlight.
7. **Verify with the schools.** After shipping, track how often Absent is changed within 1 minute, since that signals mis-taps. Compare it against the current rate to confirm the fix worked.

**Priority order:** (1) the server-side delayed SMS with cancel, (2) target size and separating Absent from Late, (3) the outlined style and the wider gap. The first change removes the embarrassing consequence. The other two reduce how often the mistake happens.
