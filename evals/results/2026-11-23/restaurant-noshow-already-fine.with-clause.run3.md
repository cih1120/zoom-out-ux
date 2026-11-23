# restaurant-noshow-already-fine — with skill plus the Different question clause, run 3

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix is sound. Moving a red No-show away from Seat, adding an undo, and delaying the charge are all aimed at one error, the mis-tap. Two gaps remain:

- **8 seconds is too short for a Friday rush.** The host probably won't look at the toast. They'll more likely find out when the guest says "why was I charged?"
  - Hold the fee until a point the host can't miss, like the end of service or the reservation time plus a grace window.
  - Keep the toast for the quick undo.
  - Tapping Seat on a row marked No-show should clear the mark and cancel the pending fee. Mis-taps are then fixable at any point before the charge posts, not just for 8 seconds.
- **What happens if the card is already charged?** Give a refund or void path for fees that post anyway, and make sure staff know where it is.

Smaller points:
- Make No-show visibly different from Seat: red, at the far end, and probably a smaller tap target than Seat.
- Show a "No-show, fee pending" state on the row, so a marked guest isn't invisible.
