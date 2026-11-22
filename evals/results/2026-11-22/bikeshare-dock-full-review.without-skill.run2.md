# bikeshare-dock-full-review — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: pass

---

The proposal mostly holds up. The two buttons are the right core, and leaving billing alone is fine. I'd change five things.

**1. Make the hold automatic, or at least the default.**
- A rider who is standing at a full dock with the meter running is stressed and may not tap anything. Anyone who doesn't tap the button still gets charged, and that's the group that ends up in your refund queue.
- Start the hold when the "Dock full" screen appears, or when they tap "Nearest dock". Show a visible countdown.
- Check with ops that this fits the agreed rule. The window and the billing don't change, only the trigger, but ops should confirm that. If it doesn't fit, keep the button and make it the most prominent element.

**2. Merge the two buttons into one primary action.**
- The hold is only useful if they're walking somewhere. A single "Find a dock with space (15 min free starts now)" button is simpler than two competing buttons.
- Keep a secondary "Hold only" option for riders who want to wait for a slot to open.

**3. "Nearest dock with space" should do more than open the map.**
- Open the map already filtered to docks with free slots, with the nearest one preselected. Show walking time and free-slot count, and keep the hold countdown visible on the map.
- Capacity is live, but a dock with one free slot can fill before they arrive. Show the slot count, and consider offering the next-nearest dock as a fallback.
- Decide what happens if no dock with space is reachable within 15 minutes. Likely it's a "Contact support" path, or a longer hold. That's an ops call, but the screen needs to handle it.

**4. Design the expiry state.**
- What does the rider see at minute 12 and at minute 15? The hold ending and billing resuming should be unmistakable (warning at about 3 minutes left, plus a notification if the app is backgrounded).
- Settle whether they can re-hold at a second full dock. If the answer is no, say so on screen, because a surprise charge there creates a new refund category.

**5. Cut or shrink the explainer.**
- Someone at a full dock with a running meter won't read about how capacity works. A one-line reason ("This dock is full right now") plus a small help link is enough. Put the longer explanation in the help center, not on this screen.

**Two things to raise with the team:**
- **Prevention.** The live API lets you warn riders earlier, for example "your destination dock is nearly full, 2 spaces left" during the ride, or suggest an alternative before they arrive. That would cut the problem at its source, and it can be a follow-up rather than part of this change.
- **Faulty docks.** Confirm the screen distinguishes a truly full dock from a faulty one or a failed docking attempt. Sending someone off to walk when the dock is just jammed would be a bad experience.

**Metrics to agree on before launch:**
- Refunds per day for dock-full cases. Your baseline is about 12.
- Share of dock-full screens that lead to a hold.
- Share of holds that end in a successful dock before expiry.
- Share of holds that expire.

If the last number is high, the nearest-dock logic needs work. If refunds don't drop even though holds are high, riders probably aren't seeing the screen or the hold isn't starting.
