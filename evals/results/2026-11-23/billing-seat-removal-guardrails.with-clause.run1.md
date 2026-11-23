# billing-seat-removal-guardrails — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window be 10 minutes or 24 hours?
Zoomed out: Guardrail stacking → Different question: the modal, banner, email and toast all protect an immediate seat reduction. Why does removing a person reduce billing now, when the seat is already paid for until renewal?

Within current constraints: Choose 24 hours, and make the undo real by having our settings API hold the seat reduction until the window closes. Undo then cancels the pending change, so no prorated re-add charge can happen. Drop the red banner and keep the modal, the toast and one email. Bounded by the billing team's quantity sync, which we can't touch, and by whether it tolerates a delayed call from us. The billing team owns this, and you should confirm it with them.
Reframed: Removing a member frees the seat but leaves the paid quantity alone until renewal. The page shows "1 free seat". Adding someone, including a swap, fills the free seat at no charge. Quantity drops at renewal to the seats in use. Needs: the sync to read seats-in-use at renewal, which means the billing team has to agree to it, so ask them whether it can wait until their migration is done. Costs: the admin keeps paying for the unused seat until renewal, which is what they already paid for.
Door: Store "seats in use" separately from "seats billed" in our API now, so the reframe is a small change later.

Recommendation: Ship the 24-hour held reduction now. Raise the free-seat model with billing as the target. If it lands, no undo window is needed, and the banner, toast and per-change emails can go.
