# donation-form-explainer — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover, and should the help link open a modal or a new tab?
Zoomed out: Explainer → In place: why do two labels need a 600-word page and a tour, when the label and the total could say what they do?

Within current constraints: Hand-roll it. Three popovers don't justify a tour library's bundle size and styling fights. Store the "Don't show again" flag in localStorage. Open the help page in a new tab with `rel="noopener"`, because a modal holding 600 words is awkward and a same-tab link loses form state. Bounded by the fee being unknown until Continue, owned by the backend/payment provider team. Comms owns the page and the request to link it.
Reframed: Put the consequence in the label and add a one-line helper under each checkbox.
- Fee: "Add the processing fee so 100% of my gift reaches us. The exact amount is shown on the next step."
- Tax: "I'm a taxpayer: the charity can claim extra on my gift at no cost to me."
- Add a "Total" line that reads "£50 + fee, confirmed next step", so the total change isn't a surprise.
- Keep a small "Learn more" link, opening in a new tab, as the only use of the page.
- Drop the tour and its "Don't show again" state.

Needs Comms to supply two or three short sentences from their page, and the tax wording checked against your jurisdiction's rules. Costs Comms' attachment to the tour and some copy review time.
Also possible: If the provider's rate is fixed, a front-end "about X" estimate. I left it out because it needs someone to own the rate.

Recommendation: Take the reframe. Support's "why is my total different" emails come from a surprise at Continue, which a tour doesn't fix and a clear label and total line do. If Comms insists on the tour, use the hand-rolled version above.
