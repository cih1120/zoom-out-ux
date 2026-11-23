# restaurant-noshow-already-fine — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question.

Recommendation: Your fix covers it. Separating the buttons, the undo toast and holding the fee are all safeguards on one error at the step where it happens, so they count as one fix. I'd change two things:

- **Don't tie the charge to the toast.** Eight seconds is short during a rush, and a host who looks away misses it. Charge the fee at the end of service, or after a grace period such as 30 to 60 minutes past the reservation time. This also covers a guest who arrives late after being marked no-show.
- **Keep the undo on the row.** A no-show row should show a "No-show, Seat anyway" action until the charge runs. The toast then becomes a courtesy and not the only way back.

Make sure Seat on a no-show row also cancels the pending charge. Also make sure a charge that has already gone through can be refunded from the same screen.
