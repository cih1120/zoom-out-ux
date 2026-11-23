# parking-max-stay-dead-end — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: What should go on the "Maximum stay reached" error screen: A) find a nearby zone, B) move-your-car reminder, C) zone-rules explainer?
Zoomed out: Escape hatch + Explainer → Earlier: the dead end is built before the error. The push offers "Extend" in a zone where it can't work, and the duration picker never says the stay caps at 2h.

Within current constraints: Ship A on the error screen, with the cutoff time in the message ("Max stay is 2h. Your session ends at 1:40pm.") and a "Find a nearby zone" button that opens the map. Skip C, because that sentence is the explanation, and a link to the FAQ sends them out of the app. Skip B, because the 10-minute push already works as that reminder. Bounded by the API returning only MAX_STAY_EXCEEDED, owned by parking ops, who won't change it this sprint.
Reframed: Don't show Extend when it can't succeed. If the app already has each zone's max stay (I'm assuming it does, so check), the push for a maxed-out session reads "Max stay reached, move by 1:40pm" with a "Find nearby zone" button. The duration picker shows "Max 2h" and caps the choices there. The error screen stays as a fallback. Needs the zone max-stay value on the client. Costs: the rule now lives in two places and can drift, and there's push-copy work.
Door: build the error screen's message and button as one component that the push and picker can reuse.
Also possible: after the map opens, filter to zones where a fresh session is allowed.

Recommendation: Ship the local fix (A plus the cutoff time) this week. Include the "Max 2h" picker label and the push-copy change if the zone data is already on the client. Those two changes stop most drivers from hitting the error at all.
```
