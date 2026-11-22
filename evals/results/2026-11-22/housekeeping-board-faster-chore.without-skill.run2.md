# housekeeping-board-faster-chore — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Neither is the biggest win. I'd put a third option first: **prefill the board from the nightly CSV.**

**Why the CSV first**

- Checkout, Stayover and Vacant are derived from reservations (departing today, in-house past tonight, no reservation). The supervisor is currently copying that from a printout by hand, floor by floor, and that's probably a large share of the 40 minutes.
- Your nightly export should have the data to compute it. "Today's rooms" would open already populated instead of empty.
- The export is stale by morning, so it will miss late checkouts, early arrivals and walk-ins. Treat the prefill as a draft: she scans it and fixes exceptions with one tap. Show which statuses she has changed, and keep a "last imported at" stamp visible so no one trusts it blindly.
- Check that the export covers the whole current stay (arrival and departure dates per room), not just new reservations. If it doesn't, this idea is much weaker, so look at a real file before committing.

**Why not "Copy yesterday's assignments" as proposed**

- Yesterday's statuses are wrong today, and the roster of housekeepers on shift changes.
- What does carry over is the room-to-housekeeper mapping, because most properties use fairly stable sections. So the better version is **suggested assignments**:
  - Each housekeeper has a default section, and rooms are pre-assigned from it.
  - The supervisor marks who's on shift, and an absent housekeeper's rooms get redistributed.
  - Weight the load by room type, since checkouts take far longer than stayovers, and vacant rooms are nearly free.
- Once statuses are prefilled, the suggestions are meaningful and she only adjusts them.

**Your original plan is still needed, but as the exception handler**

- After prefill and auto-suggest, she's moving a handful of rooms, not 150. Multi-select and a floor filter earn their place there.
- On a tablet, I'd use tap-to-select then tap a housekeeper rather than drag-and-drop. Dragging across a scrolling board is fiddly, and the tap version is faster and cheaper to build.

**Suggested order**

1. CSV import to prefill statuses, with override and an import timestamp.
2. Sticky default sections with auto-suggested assignments and a workload balance indicator.
3. Multi-select with tap-to-assign for exceptions.

Before building, it's worth watching her do one morning to time the two phases (marking statuses vs. assigning). That confirms where the 40 minutes goes. If most of it is the assignment phase, swap steps 1 and 2.
