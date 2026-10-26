# billing-seat-removal-guardrails — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window be 10 minutes or 24 hours?
Zoomed out: Guardrail stacking → Different question: the ask is how long to remember a removal, but why does removing a member change the bill the same day?

Within current constraints: Keep the immediate reduction but hold the quantity change in our settings API for the undo window (assuming our API is what triggers the sync). Swaps and mistaken removals then net out before the provider sees them. Pick 24 hours, since swaps and mistakes get noticed the next day. Keep the Undo toast and one summary email, and drop the red banner. Bounded by the billing team's sync, which is mid-migration, and by whether our API can delay that call. Owned by billing.
Reframed: A removed member leaves an open seat that is already paid for until renewal. Re-adding someone, including a swap, fills the open seat at no charge. The seat count only drops at renewal. The modal price-change warning, banner, per-change emails and undo window are no longer needed. Needs the settings API to record the intended quantity and send decreases at renewal, with billing agreeing to that call. Costs losing mid-period credit for removed seats, which finance and product must approve.
Also possible: a "will drop to N seats at renewal" line on the page.

Recommendation: Ship the 24-hour delayed sync now, since it fixes the tickets without touching billing. Raise the open-seat model with billing and finance as the longer-term fix.
