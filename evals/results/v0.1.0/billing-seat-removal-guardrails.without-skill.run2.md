# billing-seat-removal-guardrails — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Pick 24 hours, but only if "undo" means "don't reduce the seat yet". If undo just re-adds the member after the seat has already dropped, neither window fixes the refunds.**

Today, undoing after the decrement still triggers a new prorated charge. The toast, modal, banner and emails only reduce mistakes. They don't remove the cause. Your swap case is also a deliberate action, so warnings won't stop it.

**Why 24 hours**
- Your complaint is about same-day re-adds, and 10 minutes misses most of those. A swap often happens after an offboarding conversation or an invite that hasn't been accepted yet.
- A longer window costs little if the member's access is revoked immediately and only the billing decrement is deferred. The customer has already paid for that seat, and a day of delay barely changes the proration credit.

**What to build within your constraint**
1. On removal, revoke access right away and record a pending seat decrement in your own settings API. Don't call the quantity sync yet.
2. If the admin re-adds someone before the window closes, the pending decrement cancels against the new seat. The net change is zero, so no sync call happens and no charge is made. This covers swaps and mistakes with no special undo logic.
3. When the window expires, a job sends one sync call with the final net quantity. Several removals and adds collapse into a single call. That also helps the billing team, because they see fewer writes during their migration.
4. In the UI, show "Seat will be released on [time]" with the Undo option. Drop the red banner and the per-change emails, since a pending state replaces both. Send at most one email when the decrement is finalized.

**Check with the billing team first**
- Can your API control when the quantity sync is called, or does something else trigger it, such as a webhook or their migration's event listener? If it fires automatically on member changes, deferral has to happen on their side, and you'll need to ask them.
- If the sync will be reworked, a net-quantity call at window end is probably the simplest interface to keep stable. Confirm that with them.

I can look through the Members & seats code and the settings API to see where the sync is triggered and sketch the pending-decrement change. Want me to do that?
