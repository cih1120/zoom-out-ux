# billing-seat-removal-guardrails — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window be 10 minutes or 24 hours?

Zoomed out: Guardrail stacking → Different question: the modal, banner, email and toast all protect against removal being charged the moment it happens. The question becomes "why does removing a member cut paid seats immediately?" The window length then stops mattering.

Within current constraints: Choose 24 hours, and make undo free. Our settings API holds the seat decrease for the window and sends the provider only the net change, so a swap or an undo never reaches billing. Without that hold, undo just buys a new prorated seat and the refund tickets continue. This is bounded by the billing team's quantity sync, which is mid-migration. It only works if our API can control when it calls the sync. Keep the modal, drop the banner, and send one email rather than one per change.

Reframed: A removed member leaves an unused seat that stays paid until the period ends. Adding someone fills that seat at no charge, and the quantity drops at renewal. A "Replace member" action covers swaps. The page shows "1 open seat until Dec 14", and that line replaces the banner and the undo toast. This needs the billing team to confirm that deferred decreases at renewal are supported, so it's likely to wait until their migration lands. It costs you up to one period of revenue on seats that were really removed.

Door: Build the hold in the settings API as "pending seat changes". Then the window can grow to the full period without a rewrite.

Recommendation: Ship the 24-hour hold now, and ask the billing team about renewal-time decreases. If they agree, the window question goes away.
