# billing-seat-removal-guardrails — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**My recommendation is 24 hours, but only if our settings API can hold the seat reduction until the window closes.** If it can't, the length of the undo window is a secondary question.

**Why the window length depends on timing**
- Today the quantity drops at the provider immediately. Any "undo" after that point is a new seat purchase, so it triggers a new prorated charge. That is the exact thing generating the tickets.
- An undo window only helps if the provider never sees the reduction during the window. A longer window on top of an immediate sync would still leave the charge in place.

**Proposed approach (front end and our API only)**
1. On removal, revoke access and mark the member as `pending_removal` with a `seat_release_at` timestamp in our own data. Don't call the quantity sync yet.
2. A scheduled job (ours) requests the quantity reduction when `seat_release_at` passes. Restoring the member before then cancels it. The provider never sees a change, so there's no charge.
3. If someone is added while a seat is pending release, the new member takes that seat. This fixes the swap case with no undo at all, and I think it's the bigger win. Swaps are probably most of your tickets.

**Why 24 hours rather than 10 minutes**
- Mistakes usually surface later than 10 minutes, for example when the removed person messages someone the next morning.
- The cost of waiting is up to a day of one seat's proration, which is trivial.
- A toast can't last 24 hours, so you'd need a persistent "Pending removal – Restore" row on the Members page and a Restore link in the email. That's better than a toast anyway.
- With the 10-minute window, the toast would be the only way to undo, and it would be easy to miss.

**What I'd change in your current fixes**
- Keep the confirmation modal, but reword it to say the seat is released in 24 hours and can be restored until then.
- Drop the red warning banner. A permanent warning trains people to ignore it.
- Replace the email on every seat change with one email on removal that includes the restore link.

**Things to check with the billing team**
- Does their migration derive quantity from our member count or from calls we make? If they recompute from member count, my "pending" members must still count toward it until release.
- Does the sync tolerate being called later than the removal event?

I can look through the repo at the Members & seats code and the removal endpoint to see how hard the deferral is. Want me to do that?
