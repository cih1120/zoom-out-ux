# attendance-mistap-already-fine — with skill, run 3

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. Your three changes all sit on one error, the mis-tap on Absent, at the step where it happens, so they count as one fix.

Recommendation: ship it, with these refinements:

- **Cancel the SMS on any change.** Tapping Late or Present on that row within the window should cancel the pending SMS, not only the toast's Undo button. A teacher who notices the mistake late will fix it by tapping the right button.
- **Make the hold longer than 5 seconds.** On a loud bus, a teacher may not look at the toast in time. Keep the 5-second toast for undo, but send the SMS after a longer hold, such as 2 minutes or when they submit the roll. Changing a row inside that hold cancels the SMS silently.
- **Hold the SMS on the server.** If it only lives in a client timer, closing the app or losing signal could drop it or send it twice.
- **Enlarge the tap targets as well as the gap.** Aim for at least 44–48 px tall, and make the three buttons wide enough that a thumb on the right edge doesn't land between Late and Absent.
- **Handle quick successive taps.** Marking five students in a row should give each row its own undo, or a single toast that says "2 marked absent, undo". Otherwise a new toast could replace the previous one and drop its undo.
