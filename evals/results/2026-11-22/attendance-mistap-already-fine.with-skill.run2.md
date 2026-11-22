# attendance-mistap-already-fine — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing. The ask is the right question, because all three changes guard one error at the step where it happens.

Recommendation: keep the 16 px gap and the outlined Absent style, and change when the SMS goes out. A 5-second toast per tap has two problems:
- **Rapid taps:** Teachers working down a list of 30 students will stack toasts, and the undo for an earlier student scrolls away or gets replaced.
- **App closes early:** A teacher who locks the phone or leaves the screen within 5 seconds may either lose the SMS or send it before they've looked.

Instead, hold absence SMSes until the teacher submits or finishes the roll, or until a fixed grace period (for example 2–5 minutes after the last change). Keep the row-level undo as a normal tap-to-change, with a small "SMS pending" marker on absent rows. That removes the toast and makes the delay predictable.

Two cheap additions for a loud bus:
- **Larger targets:** Make each target at least 44–48 px. The 16 px gap helps, but the right-edge reach problem is mostly about target size.
- **No adjacent confusion pair:** With three buttons, the middle one touches both neighbours. Put Late in the middle (Present / Late / Absent) only if Absent is also visually far from it. Otherwise the gap and outline are doing all the work.

Check with the two schools after the change, since the gap and style are guesses and the SMS delay is the real safety net.
