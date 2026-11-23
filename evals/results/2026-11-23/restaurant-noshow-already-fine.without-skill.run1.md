# restaurant-noshow-already-fine — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: fail, 4-concise: fail, 5-specific: pass

---

Your fix covers the mis-tap itself, but a few gaps could still charge a seated guest.

**1. The hold has to live on the server.**
If the 8-second timer runs on the tablet, a sleep, app backgrounding, refresh, crash or Wi-Fi drop can lose the charge or fire it at the wrong time. The no-show call should create a pending charge with a `charge_after` timestamp. A server job should capture it, and undo should cancel it. Make the charge idempotent so a retry can't double-bill.

**2. Eight seconds is short for the mistake you're describing.**
During a rush, a host often won't notice the mis-tap until the guest has been seated for a minute. Consider these options:
- Keep the row in a visible "No-show (undo)" state, not just a toast, so it can be reversed after the toast is gone.
- Delay the actual charge much longer. Options include 10–15 minutes, or a batch at close of service, or manager review. Real no-shows are still billed, and the mis-tap window gets much wider.

**3. Seating a row already marked no-show needs defined behavior.**
- While the charge is still pending, tapping Seat should cancel it.
- If the charge already went through, there should be an automatic refund or a flagged review. Otherwise the guest is stuck with a fee and no way to reverse it.

**4. Add a time guard.**
Don't allow No-show until the reservation time plus a grace period, such as 15 minutes. That alone blocks most Friday-rush mis-taps, because the guests you're seating are usually on time. Before the grace period, the button could be disabled or ask for a confirmation.

**5. Edge cases in the toast.**
- Several no-shows in a row should each get their own undo, not replace each other. Undo must target the right reservation.
- Make the toast big enough to hit with a rushed tap, and keep it from covering the Seat buttons.
- Log who marked the no-show and when, so you can settle disputes.
- Decide what happens if the charge fails (declined card, no card on file). It shouldn't surface to the host mid-rush.

Moving the button and adding undo are both good. The two changes that matter most are the server-side pending charge and a longer or batched charge window. I'd also add the grace-period guard.
