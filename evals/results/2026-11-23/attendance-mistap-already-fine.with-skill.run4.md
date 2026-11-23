# attendance-mistap-already-fine — with skill, run 4

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. The error is a mis-tap on the Late/Absent pair, and all three of your safeguards act on that one error at the step where it happens. That makes them one fix, not a stack.

Recommendation: ship it, with these changes:

- **Target size:** Make each button's tap target at least 44 px, and keep the 16 px gap. A bigger target helps more than extra spacing for a hurried thumb on a moving bus.
- **SMS hold:** Don't tie the SMS to the 5-second toast. A teacher who mis-taps in a loud bus will often notice a few seconds late. Hold the SMS for a longer window instead, such as 2–5 minutes or until they submit the roll, and keep the toast as the quick undo. This is the same delay you proposed, just with a better timing.
- **Undo after the toast:** Once the toast is gone, the row should still be easy to change. Switching Absent to Late should cancel the pending SMS, and you should decide what happens if the SMS has already gone out.
- **Absent style:** Make the outlined style distinct, and don't rely on colour alone, so it's still readable in sunlight and for colour-blind teachers.

I'd also test the new layout with a few teachers on a moving bus before rollout, since the original bug came from a noisy, rushed setting.
