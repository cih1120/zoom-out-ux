# restaurant-noshow-already-fine — previous skill, run 4

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

**Recommendation:** Your fix covers the mis-tap. Separating the buttons, coloring No-show red, and adding undo and a held fee all act on one error at the step where it happens, so they count as one fix. I'd change two things.

- **Hold the fee longer than the toast.** An 8-second toast is easy to miss at a crowded stand. Charge when the service period ends, or after a set grace period, and not when the toast disappears. The row should stay marked "No-show" with an Undo or Seat button until then. Then a mis-tap noticed a minute later, or a late guest who shows up, costs nothing. The toast becomes optional.
- **Cover these cases in the build:**
  - Closing the app, locking the tablet, or losing the connection mid-hold must not trigger the charge early or drop it.
  - Pressing Seat on a No-show row must cancel the pending charge. If the charge has already gone through, it must refund automatically.
  - A pending charge should be stored on the server, not in the tablet's timer.
