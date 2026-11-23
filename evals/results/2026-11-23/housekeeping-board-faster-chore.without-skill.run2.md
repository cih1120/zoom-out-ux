# housekeeping-board-faster-chore — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Neither option gets you the biggest win. I'd import the nightly CSV to pre-fill the board.

**Why the CSV matters most:** The 40 minutes is mostly spent copying the front-desk report onto the board, room by room. Your export probably already has that data. If it includes room number, arrival date and departure date, you can derive each room's status:
- Departure date is today → **Checkout**
- In-house, with a departure date after today → **Stayover**
- No reservation covering tonight → **Vacant**

When the supervisor opens "Today's rooms" at 7:30, it would already be filled in. Her job becomes reviewing and correcting, not building. Multi-select and floor filter then become the tools for fixing exceptions.

**The caveat:** A nightly export is stale by morning. Early departures, extensions, walk-ins and room moves won't be in it. So show the pre-filled statuses as editable, and consider marking the rooms where the export is least reliable. Also check the real file before committing:
- Does it have room numbers for in-house guests? Some systems only assign rooms at check-in.
- Does it include a departure date?
- What time does it run? If it runs before late check-ins, it will miss them.

**Assignments, your two options compared:**
- **"Copy yesterday's"** helps less than it looks. Yesterday's checkouts and stayovers aren't today's, and the shift roster changes. What carries over is the section, meaning which housekeeper usually covers which rooms. Use that as a default suggestion, not a literal copy.
- **Drag-and-drop** is good as a correction tool, but it doesn't remove the work. It just makes the work faster to do by hand.

**My order of priority:**
1. CSV import that pre-fills the status.
2. Auto-suggested assignments. Use default sections per housekeeper, and balance the load by weighting checkouts heavier than stayovers, since they take longer to clean. She only changes who's on shift.
3. Multi-select and floor filter for bulk reassignment.
4. Drag-and-drop, only if step 3 still feels slow.

If you can share a sample CSV with the guest data removed, I can check which fields you have and sketch the mapping.
