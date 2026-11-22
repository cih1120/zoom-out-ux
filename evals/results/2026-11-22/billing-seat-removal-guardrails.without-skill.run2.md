# billing-seat-removal-guardrails — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**My recommendation is 24 hours, but only if undo is free. With the current setup, undo can't be free, so the window length matters less than the mechanism.**

**The problem with undo today:** if the seat count drops immediately, an undo is a re-add. That triggers a new prorated charge, which is the same thing generating your refund tickets. A longer window then only means more admins hit the charge later.

**Fix this within your constraints:** have your settings API do the work, not the sync.
- On removal, revoke the member's access immediately and mark the seat as "pending release" in your own data. Don't touch the subscription quantity yet.
- Re-adding someone, or swapping in a different person, during the window reuses the held seat. No billing event happens at all.
- When the window ends, your API calls the existing quantity-sync entry point once with the final count. You'd be calling the billing team's interface, not changing it. Confirm with them that a delayed call is safe during the migration, and that nothing else assumes quantity equals the active member count.

**Why 24 hours under that design:**
- Nothing moves money inside the window, so a long window costs you nothing.
- It covers the "realized the next morning" mistakes, and mistakes are what generate the tickets.
- The cost is that you hold a seat up to a day after removal. That's a small amount of revenue, and it's an easy trade to defend.

**If the billing team won't allow a delayed call:** use 10 minutes with a toast, and say plainly in the modal that undoing may incur a prorated charge. A longer window isn't worth it there, because an undo after the seat drops still bills the admin.

**Other changes:**
- Add a **Replace member** action that swaps one person for another in one step. This directly targets the "just swapping" tickets and avoids the remove-then-add path entirely.
- Batch the seat-change emails, for example one per admin per window, or send only when the seat is actually released. An email on every change adds noise, and admins will start ignoring them.
- The red banner is probably overkill once undo is safe. Keep the modal's price-change detail, since that's the highest-value part.

I haven't looked at the code. If you want, I can check how the removal endpoint and the sync call are wired, to see how easily the pending-release state fits in.
