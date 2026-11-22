# housekeeping-board-faster-chore — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

**Biggest win: prefill the board from the nightly CSV.** Neither of your two options does that, and it should come first.

**Why the CSV matters most**

Marking each room Checkout, Stayover or Vacant is transcription. The supervisor reads the front-desk report and re-keys it, and that data is already in your export. A nightly export is enough to derive most of it:
- Departure date is today → **Checkout**
- Arrived before today and departs after today → **Stayover**
- No reservation covering last night → **Vacant**

Import the file overnight and "Today's rooms" opens about 90% filled in. Her job becomes reviewing exceptions instead of building the board. That likely removes most of the status-marking time.

**What the CSV can't tell you**
- Same-day changes, such as early departures, late checkouts, walk-ins and room moves. The supervisor still needs a fast way to edit a single room's status.
- Whether the export is reliably there by 7:30, and whether it includes today's departures. Check both before you commit to this.
- Arrivals today. These are probably "Vacant, needs clean". Confirm with her how she treats them.

**Assignments: how I'd rank your options**
1. **"Copy yesterday's assignments"** helps only if the room-to-housekeeper mapping is stable day to day. Staff vary, and a checkout takes much longer than a stayover, so yesterday's loads are often wrong today. A better version is a saved "default sections" template (floor or room ranges per housekeeper). Apply it, then adjust. Ask her how often the sections stay the same.
2. **Multi-select plus a floor filter** is the right tool for the adjustments. Use "select, then tap a housekeeper" to assign.
3. **Drag-and-drop** is the lowest priority. It's fiddly on a tablet, takes work to build, and is rarely faster than select-and-tap.

An optional extra is a workload indicator per housekeeper, such as checkouts counted as 2 points and stayovers as 1. That lets her balance loads at a glance.

**Suggested order:** CSV prefill, then default-section templates, then multi-select with floor filter, and skip drag-and-drop for now.

Before you build, get a sample CSV and one real morning's printout. Run your derivation rules against them and see how many rooms it gets right. That number tells you how much time you'll save.
