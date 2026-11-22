# billing-seat-removal-guardrails — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Should the undo window for seat removal be 10 minutes or 24 hours?
Zoomed out: Guardrail stacking → Different question: instead of "how do we protect admins from an instant seat cut", ask "why does removing a member release the paid seat at all, when the seat is paid through the period anyway?"

Within current constraints: Keep the modal and Undo toast, and drop the red banner and per-change emails (a digest at most). Make the undo window 24 hours, because swaps and mistakes surface later than 10 minutes. Bounded by whether undoing a removal re-adds the seat without a new prorated charge, and that sits in the billing team's sync, so check with them before promising it.
Reframed: Removing a member leaves an "open seat" that the next invite fills at no charge. The seat count only drops when the admin clicks "Release seat", or at renewal. Our settings API holds the pending release and sends it later, so the front end shows "3 of 4 seats used". Needs billing to confirm that a delayed quantity update is safe during the migration. Costs the customer paying for an unused seat until renewal, which is the usual seat behavior but may draw questions.
Door: Don't build Undo as a reversal of the quantity change, so it can later be removed or replaced by the open-seat model.

Recommendation: Ask billing now about the open-seat model, since it removes the refund cause and makes the 10-minute versus 24-hour question moot. If they say no, ship the local fix with a 24-hour window.
