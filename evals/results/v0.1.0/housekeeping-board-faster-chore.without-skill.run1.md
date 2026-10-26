# housekeeping-board-faster-chore — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

**Biggest win: prefill the board from the nightly CSV.** Neither of your two options is first.

**Why the CSV beats both**
- Half of her 40+ minutes is re-keying the front-desk report, room by room. A reservations export already says which rooms depart today, which are occupied through tonight, and which are empty. You can derive Checkout, Stayover and Vacant from arrival and departure dates and have the board open pre-filled.
- It also removes transcription errors from the printout.
- The "no live API" constraint matters less than it seems. The board is built at 7:30 from the previous night's state, so the nightly export is nearly current enough.
- Her job becomes reviewing exceptions: late checkouts, early arrivals, extensions and room moves made after the export ran. Make those quick to flip, with a one-tap status change per room.

**"Copy yesterday's assignments" is weak as stated.** Yesterday's room statuses and staffing don't match today's. A room that was a checkout yesterday is usually a vacant or stayover room today, and the housekeepers on shift change. Copying would bring in wrong rooms and absent staff, and she'd spend time cleaning that up.

A better version, once statuses are prefilled, is to **suggest assignments from today's real workload**:
- Remember which housekeeper usually covers which floor or section. That's the useful part of "yesterday".
- Weight the workload, since a checkout takes much longer than a stayover or a vacant-clean. Balance by estimated minutes, not room count.
- Show the result as a draft she can edit.

**Multi-select, floor filter and drag-and-drop** are still worth building, but second. They are the tool for correcting the prefilled board and the draft assignments, not for building it from scratch. Multi-select plus "assign to…" is faster on a tablet than dragging across 8–10 columns. Keep drag as a secondary gesture.

**Suggested order**
1. CSV import and status prefill, with a visible "data as of <export time>" label and easy overrides.
2. Draft assignments from floor affinity and weighted workload.
3. Multi-select, floor filter and drag for the exceptions.

**Check before committing**
- Get a sample export and confirm it has per-room departure and arrival dates, and a stay-over signal or enough to derive one.
- Confirm when the export lands. It needs to be there before 7:30, and ideally after the front desk's late-night changes.
- Ask the supervisor how often the printout differs from the prior night's state. That tells you how much exception editing to design for.

I can sketch the status derivation rules or the CSV parsing if you share a sample file.
