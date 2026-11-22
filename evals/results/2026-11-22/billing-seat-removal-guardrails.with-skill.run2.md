# billing-seat-removal-guardrails — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Should the undo window for removing a member be 10 minutes or 24 hours?
Zoomed out: Guardrail stacking → Different question: the modal, banner, email and undo toast all guard one model (removing a member cuts paid seats immediately). Why does a removal change billing at that moment, rather than at renewal?

Within current constraints: Keep the model and make Undo real by having our settings API hold the removal as "pending" for the window and only then call the billing sync. Pick 24 hours, since your refunds come from same-day re-adds. Bounded by the billing sync, owned by the billing team. This only works if our API controls when that call fires. If the call fires on removal, Undo triggers a new prorated charge and the refund tickets continue.
Reframed: Removing a member frees the seat but doesn't change the paid quantity. The freed seat shows as "Open seat" and can be reassigned at no charge, which covers swaps and mistakes. The quantity drops at renewal, and the page says "1 open seat until Dec 3". Needs the billing team to support period-end quantity changes, or our API to defer the call until then. Costs you the immediate reduction, so the customer pays for unused seats until renewal. Finance has to accept that.
Door: Build the pending-removal state in our API so it can later become "reduce at renewal" by changing the commit time.
Also possible: Offer "Reduce now" for admins who want the proration credit immediately.

Recommendation: Ship the 24-hour deferred commit now, if our API owns the call. Raise the reframe with billing, because once seats are reusable, the banner, the per-change emails and most of the modal can go.
```
