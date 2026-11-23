# restaurant-noshow-already-fine — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

Ask: Stop mis-tapped No-show from charging seated guests.
Zoomed out: Guardrail stacking → Different question: why does a tap on a crowded tablet trigger a charge at all?

Within current constraints: Your fix is sound. Moving No-show to a separate red button, adding the 8-second undo and holding the charge until the toast ends all guard the same error at the step where it's made, so they count as one fix. The constraint is inferred: the fee must be charged shortly after the tap. Payments or policy owns that constraint, and it can change.
Gaps in your version:
- The toast is the only safety net. A host who notices at second 9, or the toast being dismissed by navigation or the tablet sleeping, still ends in a charge.
- The hold must live on the server. If it lives in the toast timer, a closed app could drop it or fire it early.
- A guest marked No-show who then arrives late has no path back.

Reframed: No-show only marks the row. The fee is charged after a grace window, such as 15–30 minutes or end of service, and only if the row is still No-show. Tapping Seat on a No-show row reseats the guest and cancels the pending fee. Needs the policy owner to approve the delay and a server-side pending-fee state. Costs a later charge, and the card may fail by then. Pre-authorizing at booking would cover that.
Door: Build the hold on the server now, so lengthening it later is a config change.
Also possible: a review list of pending fees at close.

Recommendation: Ship your layout change now, since separating the buttons is cheap and useful. Make the hold server-side and longer than 8 seconds, with Seat reversing a No-show. Then the toast is optional.
