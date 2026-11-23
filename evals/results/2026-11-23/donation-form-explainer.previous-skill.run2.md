# donation-form-explainer — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover for step 2, and should the help link open a modal or a new tab?

Zoomed out: Explainer → In place: the checkboxes' labels don't say what they do to the total, so the fix may belong in the labels and not in a 600-word page and a tour.

Within current constraints: Build what Comms asked for.
- Link: open it in a new tab with `rel="noopener"`. A modal holding 600 words is awkward on mobile, and a tab keeps the donor's form state.
- Tour: hand-roll it. Two popovers don't justify a library's weight or its accessibility surface. Use the native Popover API, focus management, Esc to close, and a localStorage flag for "Don't show again".
- Bounded by: the provider calculating the fee only after Continue, and no backend work being planned. Comms owns the page and the tour.

Reframed: Rewrite the labels and add one line of helper text under each checkbox, then link the page once as "Learn more".
- Fee: "Cover the processing fee. We add the provider's fee to your total. You'll see the exact amount on the next step."
- Tax: "Tax relief. We claim an extra [X]% from the tax you've paid, at no cost to you. Your total doesn't change."
- Next step: show the fee as its own line item, so "why is my total different" is answered where the number appears.
- If the provider's published rate is stable, the fee line can say "typically about N%". That's a copy change, not backend work.
- Needs: Comms to condense the page into those two lines, and the line item added on the next step.
- Costs: Comms' page becomes secondary, and the tour is dropped.

Also possible: A rate estimate on step 2, if the rate proves stable. Support emails can be tracked to see whether they drop.

Recommendation: Reframed. The confusion is the checkboxes' wording, and a tour that shows once and then can be dismissed won't fix that. If Comms insists on the tour, use the hand-rolled version and a new tab.
