# billing-seat-removal-guardrails — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window for removing a member be 10 minutes or 24 hours?
Zoomed out: Guardrail stacking → Different question: the modal, banner, email and toast all assume the seat must shrink the instant someone is removed. The better question is why the seat shrinks immediately, since that is what makes a mistake or a swap cost money.

Within current constraints: Pick 24 hours, because swaps and "oops, I noticed later" happen after 10 minutes. Make the undo real by having our settings API hold the seat decrease for the window and only then send it to the payment provider. Until then, undo and same-day re-adds touch nothing in billing. Bounded by the billing team's quantity sync, which is mid-migration, so we can only choose when our API calls it. Confirm that a delayed call is safe.
Reframed: Removing a member frees their seat but keeps it paid and vacant. Adding someone fills the vacant seat at no charge, and any unfilled seats drop at renewal. The undo window, banner and per-change emails are no longer needed. Needs product sign-off and the same confirmation from billing that a deferred or batched decrease is accepted. Costs: admins keep paying for an unused seat until renewal, and finance loses the immediate proration credit.
Door: Build the hold as "pending seat change" state in our API, not a timer tied to the toast. That lets the window grow to renewal later.
Also possible: a "Replace member" action that does the swap in one step.

Recommendation: Ship the 24-hour hold now, since it is the same mechanism and fixes the refund tickets. Take the vacant-seat model to the billing team once their migration lands.
