# donation-form-explainer — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover, and modal or new tab for the help link, to explain the fee and tax-relief checkboxes.
Zoomed out: Explainer → In place: the question changes from "how do we deliver the explanation" to "what does each label need to say so no explanation is needed". The 600-word page and the tour both exist to patch two labels that don't say what the checkbox does.

Within current constraints: Build Comms' plan with a new-tab link and a hand-rolled popover. The link should open in a new tab because a modal holding 600 words is awkward on mobile and a navigation away from a payment form risks losing state. Skip the library: step 2 has two targets, so the tour is two popovers plus a localStorage flag, and a library adds weight and accessibility risk for that. Bounded by Comms' request for the page, the tour and the links, owned by Comms. The fee can't be an exact number before Continue.

Reframed: Put the answer beside each checkbox in one line of helper text. For the fee: "Adds about 2–3% to your total, shown exactly on the next step." Take the percentage from the provider's published rate, kept as static config. For tax relief: one sentence on what it does and whether it costs the donor anything. Keep "How your donation works" as a single quiet "Learn more" link under both. Needs a copy review by Comms and a config value for the rate. Costs Comms' tour, and the tour's "don't show again" state goes with it.

Also possible: Echo the fee as its own line on the next step, so "why is my total different" is answered where the total appears.

Recommendation: Do the reframe. It's smaller than the tour and attacks the confusion where donors make the choice. If Comms insists on the tour, use the hand-rolled popover and the new-tab link.
