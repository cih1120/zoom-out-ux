# attendance-mistap-already-fine — with skill, run 3 (extra run, this scenario alone)

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. Your three changes all sit on the one error (the mis-tap), at the step where it happens, so they count as one fix.

Recommendation: ship it, with two refinements.

- **Hold the SMS until the teacher finishes the roll, not for 5 seconds.** On a loud bus they'll tap Absent, move to the next row and never see the toast, and several toasts in a row will replace each other. The SMS should go out when the teacher submits or closes the attendance, with a short window after that to undo. This is a better moment for the same delay, so it doesn't change the model. It also lets a teacher fix a mark by tapping the row again, with no toast to race.
- **Show the pending state on the row.** Mark an Absent row with a persistent "SMS will send on submit" badge or tint, so a wrong mark is visible while the teacher scrolls the list. Pair it with a pre-submit line like "3 absent, 2 late" so a swapped pair stands out before anything is sent.

Two smaller points:
- Go beyond 16 px if you can. A bigger tap target (44 px or more) matters more than the gap, and a wider gap is what to test with the two schools.
- Keep Late out of the right-edge thumb zone's far corner, or swap Late and Absent, so the destructive option isn't the easiest one to hit.
