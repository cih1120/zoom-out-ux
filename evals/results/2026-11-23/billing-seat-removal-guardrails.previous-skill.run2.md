# billing-seat-removal-guardrails — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window be 10 minutes or 24 hours, on top of the modal, banner, email and toast?
Zoomed out: Guardrail stacking → Different question: removing someone isn't the same as giving up a paid seat. The seat is already paid for until renewal, so why does removing a person trigger a billing change at all?

Within current constraints: Pick 24 hours. Your tickets are same-day re-adds, and 10 minutes would miss swaps made later in the day. Hold the quantity reduction in our settings API until the window closes, and call the sync only then. Within the window, undo and swap cost nothing. Keep the modal, since it shows the price. Cut the banner and the per-change email, because the toast already covers both. Bounded by the billing team's sync, which you can only call and not change, so the delayed call has to fit their migration.
Reframed: Removing a member vacates the seat but leaves the paid quantity alone. Adding someone fills a vacant seat at no charge, so a swap costs nothing. The page shows "3 vacant seats, reduce at renewal" with one "Reduce seats" action. The quantity drops when the admin confirms or at renewal. Needs the billing team to accept a reduction at renewal, or our API to send it then. Costs: customers pay for unused seats until renewal, and finance has to accept that.
Door: Store the pending reduction in our API and not in the toast's state, so it can become the vacant-seat model later.
Also possible: a vacant-seat count on the billing overview.

Recommendation: Ship the 24-hour delayed sync now. It fixes the same-day complaints and doesn't depend on the migration. Raise vacant seats with the billing team, because they remove the cause. The banner, email and undo toast were all there to manage that charge.
