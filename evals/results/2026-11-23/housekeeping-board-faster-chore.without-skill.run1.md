# housekeeping-board-faster-chore — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Neither of your two options is the biggest win. I'd import the nightly CSV to prefill the board.

**Prefill room status from the export (biggest win).** The supervisor is retyping the front-desk report by hand, and the CSV already has that information. Derive each room's status from it:
- **Checkout:** the departure date is today.
- **Stayover:** the room is in-house and the departure date is after today.
- **Vacant:** no reservation covers tonight.

The board then opens about 90% filled in, and her job changes from building it to correcting it. This probably removes most of the 40 minutes, since marking every room on every floor is likely the largest part of it. It also removes transcription errors.

**Suggest assignments (second).** Once statuses are known, you can propose an assignment. Keep stayovers with the same housekeeper as yesterday, and group rooms by floor or adjacency. Balance the load by weighting checkouts more heavily than stayovers, since a checkout takes much longer to clean. This is a better version of "Copy yesterday's assignments". A plain copy breaks because checkouts and room mix change every day. Stayovers are the part that carries over.

**Multi-select, floor filter and drag-and-drop (third).** Keep these for adjusting the suggested board, not for building it. On a tablet, drag-and-drop is fiddly with 8–10 columns. Select rooms, then tap a housekeeper, which is faster and more reliable. Floor filter plus multi-select is still worth having.

**Caveats to design for:**
- **The export is nightly, so it goes stale.** Early checkouts, walk-ins, extensions and room moves won't show up. Make every prefilled status a one-tap override, and mark which rooms were changed by hand. Say clearly in the UI when the data was exported ("Front-desk data as of 02:00").
- **Export timing and fields.** Check that the file reliably lands before 7:30. Also check that it has room number, arrival and departure dates and a room-level identifier, and how it handles room moves and out-of-order rooms. Decide what happens when the file is missing or late. The board should fall back to the manual flow, not break.
- **Measure first.** If you can, shadow her once or look at usage timing to see how the 40 minutes split between marking and assigning. That decides whether the suggested assignments are worth building right after the import.

If you want, I can look at the CSV format or the current "Today's rooms" code in the repo and sketch the import and status-derivation logic.
