# bikeshare-dock-full-review — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

The proposal mostly holds up. I'd reorder it, cut one piece, and tighten a few things. I haven't looked at the code, so this is a design review only.

**What works**
- The hold button targets the actual harm, the meter running while the rider is stuck. Leaving billing rules alone is fine, because the free-hold window already exists and you're only exposing it where it matters.
- Using the live capacity API is right.

**What I'd change**

1. **Make "nearest dock with space" the primary action, and make it do more than open the map.**
   - Opening the map and tapping docks one by one is the exact friction you're trying to remove.
   - Since capacity is already in the API, show the 2–3 closest docks with free-slot counts and walking time right on the screen, each with a "Navigate" action.
   - Don't offer docks with only one free slot without flagging that they may fill before the rider arrives.

2. **Tie the hold to the walk.**
   - A rider who taps hold and then wanders into the map has a 15-minute clock running with no plan.
   - Show a visible countdown after the hold starts, and say plainly what happens at expiry: billing resumes at the normal rate.
   - Confirm with ops whether holds can be chained, since a rider could otherwise re-hold at each full dock. You don't need to reopen the rules to ask.

3. **Cut or shrink the capacity explainer.**
   - A rider standing at a full dock with the meter running doesn't want to learn how capacity works.
   - Replace it with one line of state: "This dock is full. Your ride is still active. Hold to pause the meter."
   - Keep the help-center link as a small footer.

4. **Say the billing status explicitly.** Whether the meter is running or paused should be the most visible thing on the screen. The complaint is that the meter keeps running, so the fix should be visible, not just available.

5. **Cover the failure cases.** Define what the screen does if the capacity API is stale or down, if no dock with space is nearby, or if the dock is "full" because of a fault rather than occupancy. Fault cases need a report-a-problem path, and probably a different hold policy.

**Questions to settle before the team meeting**
- Should the hold start automatically when the screen appears? That makes the fix work even for riders who don't read the screen. It may count as a billing-rule change, so it's a question for ops.
- Can you prevent the problem upstream? A "this dock is nearly full" warning during the ride, or on the map near the destination, would cut these cases before the rider arrives.
- What do the roughly 12 daily refunds break down into: full docks, faulty docks, or confusion about how to end the ride? The design is only right if full docks are the main cause.
- What will you measure? Good candidates are daily refund count, hold usage rate, how often holds expire without a dock completing, and time from the full-dock screen to a successful return.

**Pitch:** the hold stops the bleeding, the nearby-docks list fixes the cause, and the explainer is the part to drop.
