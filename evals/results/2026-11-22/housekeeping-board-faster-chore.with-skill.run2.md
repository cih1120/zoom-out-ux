# housekeeping-board-faster-chore — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Which makes building the 7:30 board fastest: multi-select, floor filter and drag-and-drop, or "Copy yesterday's assignments"?
Zoomed out: Faster chore → Different question: why is she keying Checkout/Stayover/Vacant by hand from a printout of data we already receive nightly?

Within current constraints: Multi-select, floor filter and drag-and-drop onto housekeeper columns, with "Copy yesterday" as a bonus. Bounded by the vendor's nightly CSV-only export (no live API), owned by the front-desk vendor. Copy-yesterday alone is weak, because yesterday's checkouts are not today's.
Reframed: "Today's rooms" opens already built. An overnight CSV import sets each room's status (departure today → Checkout, in-house and staying → Stayover, otherwise Vacant), and rooms start with their usual housekeeper's section. She only corrects exceptions, such as early checkouts, late departures and walk-ins. Needs: confirmation that the CSV has room numbers, arrival and departure dates and in-house status, plus a scheduled import and a default section per housekeeper. Costs: the data is as of the export, so same-day changes still need manual edits. Show the export time on the board so she knows how fresh it is.
Door: Build multi-select as the way to correct the prefilled board. Don't build it as the main way to fill an empty one.
Also possible: balancing the load by room type, and flagging rooms the printout disagrees with.

Recommendation: Do the reframe: prefill statuses from the CSV and default the assignments. Add multi-select as a light correction tool, and skip drag-and-drop until you see how many corrections she still makes. Check the CSV's columns first, since the whole plan depends on them.
```
