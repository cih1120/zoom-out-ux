# parking-max-stay-dead-end — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: What should the "Maximum stay reached" error screen offer: A) nearby-zone map, B) move-car reminder, or C) zone-rules explainer?
Zoomed out: Escape hatch, Explainer → Earlier: the problem starts at the 10-minute push and at duration pick, where the app offers an "Extend" it can't honor. The question becomes why we offer Extend on a session that can't be extended.

Within current constraints: Ship A on the error screen, with the session's end time shown ("Your session ends 1:40 pm. Move your car by then"). The map opens pre-filtered to zones open now. Skip B, because the existing push already reminds them. Skip C, because a FAQ link is a dead end for someone at lunch. Bounded by the extend call returning only MAX_STAY_EXCEEDED, owned by parking ops, who won't change it this sprint.
Reframed: When the session's total time reaches the zone's max stay, the push drops "Extend" and says "Time's up at 1:40. Move your car", with "Find a nearby zone" as the button. Duration pick also shows "Max stay 2h, move by 1:40 pm". The error screen then rarely appears and keeps A as a fallback. Needs the zone's max stay in the client. I haven't checked whether zone data has it. If it doesn't, you can cache it per zone the first time the error fires. Costs a small change to push logic and the duration picker, plus a data question.
Door: Build A as one reusable "nearby zones" action so the error screen and the push button share it.
Also possible: Opt-in "remind me when I can re-park" later, once ops expose rule data.

Recommendation: Ship A on the error screen this week, since it needs no API change. In the same sprint, if the client knows the max stay, remove Extend from the push and the picker for capped sessions. That fixes the cause of the 1-star reviews.
```
