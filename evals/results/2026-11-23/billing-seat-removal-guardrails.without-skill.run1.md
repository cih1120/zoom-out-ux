# billing-seat-removal-guardrails — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**I'd go with 24 hours. But the window length matters less than whether the seat reduction is applied immediately.**

**Why 24 hours**
- The two causes of refund tickets are different. An accidental removal gets noticed within minutes. A swap, like removing Alice and then adding Bob after a meeting or the next morning, takes hours. A 10-minute window fixes the first and misses most of the second.
- A toast can't last 24 hours. You'd need a persistent "Pending removal" state on the Members page, with a Restore button and the time remaining. The toast can stay as a shortcut for the first few seconds.

**The mechanism**
- If the seat count has already dropped, every undo means buying a seat back at a new prorated charge. That is the exact complaint, so a longer window doesn't help.
- The fix is a soft removal. Access is revoked immediately, which is the security-relevant part. The seat release is held in our settings API until the window expires. Restoring or re-adding someone during the window then changes nothing on the subscription.
- This stays within your constraint. You'd change when our API calls the existing quantity sync, and you wouldn't change the sync itself. You still need to confirm two things with billing:
  1. The sync is safe to call later, for example from a scheduled job. It also has to read the current member count at that point and not use a stale value from removal time.
  2. Their migration won't change how that trigger works.
- The cost to the customer is at most one extra day of a seat they were going to drop, which is small next to a refund ticket.

**Other changes**
- Add a "Replace member" action that swaps the seat in one step. It handles the swap case directly and doesn't depend on any window.
- If you do the deferral, the per-change email and red banner become less necessary. Consider one email on removal ("seat will be released on X, click to restore") in place of one per change.
- If billing says deferral isn't possible right now, use the 10-minute toast as a stopgap. Tell admins in the modal that re-adding after removal is charged as a new seat.

I can look at the Members & seats page and the settings API to see where the sync gets triggered and how big the soft-removal change would be.
