# housekeeping-board-faster-chore — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

**Neither, as the first move. Use the nightly CSV to pre-build the board.**

Most of her 40 minutes is probably the first step: reading a printout and marking each room Checkout, Stayover or Vacant. Your plan and the "copy yesterday" button both leave that step alone.

**1. Auto-populate room status from the CSV (biggest win)**
- When she opens "Today's rooms", the board is already filled in. For each room, compare the reservation dates to today:
  - Departure is today → Checkout.
  - Arrived before today and departs after today → Stayover.
  - No reservation covering last night → Vacant.
- This removes the transcription step and the typos that come with it.
- Her job becomes reviewing exceptions instead of building the board.
- Show an "Updated from export, [timestamp]" label. A nightly file will be stale for early checkouts, late departures, extensions and walk-ins, so she needs to be able to tap any room to override it.
- Check that the export actually includes room numbers (not just room types) and that it reliably lands before 7:30. If it doesn't, none of this works, so confirm both first.

**2. Suggest assignments instead of copying yesterday's**
- "Copy yesterday" works poorly because yesterday's checkouts and stayovers aren't today's. A housekeeper with 12 stayovers yesterday might have 12 checkouts today, which is a very different workload.
- A better version: seed each housekeeper with a floor or section (sticky from past days), then auto-distribute today's rooms. Weight checkouts more heavily than stayovers, and skip vacant rooms unless they need cleaning.
- She tweaks the result instead of building it. Keep "copy yesterday's sections" as a fallback if you want a cheap first version.

**3. Multi-select, floor filter and bulk assign: build these for corrections**
- They matter once the board is pre-filled, because she'll be moving a handful of rooms, not hundreds.
- On a tablet, I'd use select rooms, then tap a housekeeper to assign, rather than drag-and-drop. Dragging across 8–10 columns is fiddly on a touchscreen, and it's the most expensive of the three to build. Add it last, if at all.

**Suggested order:** CSV import, then auto-suggested assignments, then multi-select with tap-to-assign. If the CSV has the fields, the first step alone might cut the 40 minutes to 10–15.

If you can share the CSV's columns, I can sketch the status-derivation logic. I can also look at the existing board code in the repo.
