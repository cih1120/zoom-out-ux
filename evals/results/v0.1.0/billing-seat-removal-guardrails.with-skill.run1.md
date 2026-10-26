# billing-seat-removal-guardrails — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Stop refund tickets when admins remove a member by mistake or to swap someone, and decide whether undo lasts 10 minutes or 24 hours.
Zoomed out: Guardrail stacking → Different question: the modal, banner, email and toast all protect an immediate seat cut, so why does removal cut the seat immediately?
Swap is also a missing verb → Familiar: admins want to hand a seat to someone else, and "Replace" does that without touching the count.

Within current constraints: Keep the safeguards, but have our settings API hold the removal as pending for the undo window and only then call the billing sync, so an undo never reaches the provider. Bounded by the billing team's in-migration sync, which we can only call, not change. Pick 10 minutes. It's enough for a slip, and 24 hours leaves a day of pending state that disagrees with the provider.
Reframed: A removed member's seat stays paid and reusable until the period renews, and the count drops at renewal. Re-adding or replacing during that time is free and needs no undo. Needs the billing team to confirm we can schedule a quantity change at the renewal date, plus a "Replace" action on the member row. Costs a little revenue from seats kept until renewal and a "seat frees on <date>" line on the row.
Door: Put the pending-change state in our API now, so the hold period can later stretch to the renewal date.
Also possible: Drop the per-change email and the red banner once nothing is charged immediately.

Recommendation: Ship the 10-minute hold now, since it needs no billing changes. Ask billing about renewal-date scheduling, because that makes the window question and most of the safeguards unnecessary.
```
