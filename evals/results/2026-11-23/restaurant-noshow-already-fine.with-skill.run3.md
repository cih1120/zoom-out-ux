# restaurant-noshow-already-fine — with skill, run 3

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing. The ask is the right question. The error happens at the tap, and your three changes (separation, undo, delayed charge) are one fix on that error, not a stack of safeguards.

**Recommendation:** Ship it, with these gaps closed:

1. **Make the hold server-side.** If the 8 seconds run on a client timer, a tablet that sleeps, loses wifi, or closes the app mid-toast could charge early or never. Have the server schedule the charge and treat Undo as a cancel.
2. **Don't rely on the toast alone.** In a Friday rush, a host may look away within 8 seconds. After the toast goes, keep the row visibly "No-show, fee pending" with an Undo for a longer window, such as 10 to 15 minutes. Only then charge. This is the same hold, just a longer one. Also, a guest who's marked no-show by mistake will often show up at the stand right then.
3. **Cover the case where the charge has already happened.** Decide what happens if a guest is seated after being charged. Seating a no-show row should refund or void the fee automatically, not leave that to a manager.
4. **Check the row's state.** Seat should stay available on a no-show row (a late arrival). Once the fee is pending or charged, the row should show that, so it's not mistaken for an ordinary row.
5. **Pick the position by testing.** The far left is a good distance from Seat. Check that it doesn't land where a thumb rests when hosts scroll the list.
