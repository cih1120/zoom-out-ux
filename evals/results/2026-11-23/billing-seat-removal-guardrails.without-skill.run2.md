# billing-seat-removal-guardrails — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Recommendation: 24 hours, but only if "undo" means the seat was never released.**

The window length matters less than what undo does. If the seat has already dropped at the provider, undo is just a re-add, which triggers a new prorated charge. That is the thing generating the refund tickets, and a longer window doesn't fix it. Your four fixes so far all warn the admin or let them reverse the action. None of them stops the charge.

**What I'd do within your constraints**
1. **Defer the quantity reduction in your settings API.** On removal, revoke the member's access right away and mark the seat as "pending release". Call the billing team's existing sync only when the window expires, using the same call with a delayed trigger. This is a scheduled job or a check on the next sync, not a change to the sync itself.
2. **Reuse pending seats when members are added.** If someone is added while a seat is pending release, assign that seat and cancel the pending reduction. No quantity change means no charge.
3. **Add a "Replace member" action.** It handles the swap case directly, so those admins never go through remove-then-add.
4. **Show the pending state in the UI.** For example: "Seat releases on Nov 24, 3:10pm. Undo."

**Why 24 hours over 10 minutes**
- Holding an unused seat for a day costs you a day of one seat's price, which is small next to a refund and a support ticket.
- Mistakes and swaps are often noticed the next morning, not within 10 minutes.
- A short window mostly just moves the refund tickets to later.

**Risks to check**
- Confirm with the billing team that delaying our call into their sync is safe during the migration. Ask whether it is idempotent and how it treats a quantity that is higher than the active member count.
- Pending seats mean the seat count can briefly exceed active members. Check that any seat-limit enforcement counts active members, not the subscription quantity.
- If the settings API has no job runner, the fallback is to reconcile lazily on the next page load or API call. That is less precise but needs no new infrastructure.

If the deferral isn't feasible, 10 minutes with the current toast is about as good as you can get. I'd then also prioritize the Replace action, since it covers the swap tickets either way.

I haven't looked at the codebase yet. If you want, I can find the removal endpoint and the sync call site to see how hard the deferral is.
