# billing-seat-removal-guardrails — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Recommendation: 24 hours, but only if the seat reduction is deferred.** If the sync has already fired, undo is only a re-add, which is the same prorated charge that's causing the tickets.

**Why 24 hours rather than 10 minutes**
- The mistakes in your tickets (wrong person removed, swapping people) are often noticed later, not within minutes. A 10-minute toast is gone once the admin navigates away.
- A longer window only costs you something if the seat is released from billing immediately. If it isn't, the window is free.

**How to do it within your constraint**
1. On removal, revoke the member's access right away. Don't call the existing quantity sync yet. Record a "pending seat release" in your own settings API, with a timestamp.
2. Show the seat as "held until [time]" on the page.
3. Undo just cancels the pending release, so there's no billing change and no charge.
4. When the window expires, a scheduled job in your API calls the billing team's existing sync once. You don't change their code or contract.
5. Adding someone while a release is pending reuses the held seat. This covers the swap case, and the net count never changes.

**Things to check first**
- Ask the billing team whether a delayed or batched call to the sync is safe during the migration. Also check that the seat count in your API can be briefly higher than the provider's, or rather the reverse, without anything reconciling it wrongly.
- If you can't defer the call at all, a time-limited undo can't prevent the charge. In that case, fix it by making the confirmation modal state that re-adding is billed.

**Changes to your current fixes**
- Replace the email on every change with one email on removal that has an Undo link. A toast can't last 24 hours.
- Keep the confirmation modal, but change its text from "price will drop" to "seat is held for 24h, then released."
- The red banner is probably unnecessary once undo works. Use a neutral "pending release" indicator instead.

I can look at the settings API and the Members page to see where the deferral would go, if you'd like.
