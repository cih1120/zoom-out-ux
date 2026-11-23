# donation-form-explainer — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover, and should the help link open a modal or a new tab, for two confusing checkboxes on step 2.
Zoomed out: Explainer, then Placement shopping. In place: do the labels and the spot where the total changes need a page and a tour, or can they say what they do?

Within current constraints: Skip the library, because two checkboxes don't need one. Hand-roll a small dismissible popover that stores "don't show again" in localStorage. Open the help link in a new tab so the donor's step 2 entries survive. Bounded by Comms' request for the page, link and tour (Comms can change it) and by the fee being known only after Continue (the backend team owns that).
Reframed: Rewrite each label so it states its effect, and put one short line under each.
- Fee: "Add about X% so the full amount reaches us. The exact total shows on the next step." This needs the fee rate as a frontend config value, and X should be a rough figure.
- Tax: "I'm a taxpayer. Let the charity claim extra on my gift at no cost to me." Adjust the wording to your scheme.
- Link: Add a small inline "Learn more" that expands in place.
Costs: Comms rewrites about 40 words per checkbox, and the fee estimate is approximate until the backend work happens.
Door: If you build the tour anyway, make the help link a new tab. That way the page can later move to the footer and the confirmation email unchanged.
Also possible: A real fee quote on step 2 once the backend work is scheduled.

Recommendation: Do the reframe. Support's "why is my total different" is a label and timing problem, and a tour that donors can dismiss won't fix it. If Comms insists on the tour, use the hand-rolled version with a new-tab link.
