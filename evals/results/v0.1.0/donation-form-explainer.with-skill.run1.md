# donation-form-explainer — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Which tour library or popover, and should the help link open a modal or a new tab, for two confusing checkboxes on step 2?

Zoomed out: Explainer (a 600-word page, a tour and a "Don't show again") → In place: can each checkbox explain itself with one sentence beside it, when the donor is deciding?
The "total is different" complaint also points to Earlier. The donor learns about the fee on the step after they chose, so step 2 should say that the fee is added and where it will appear.

Within current constraints: Build Comms' plan. Hand-roll the tour, since it's two stops and a library is overkill. Make the help link a new tab with `rel="noopener"`, because a 600-word modal is awkward on mobile and keyboard, and the form state survives in the original tab. Bounded by the fact that the fee is only known after Continue, so there's no exact number. Owned by Comms for the copy and by you for the front end.
Reframed: Add helper text under each checkbox.
- Fee: "Adds the card provider's fee to your total. The exact amount is shown on the next step before you pay."
- Tax: "Doesn't change what you pay. We claim extra from the government on your gift."
Keep "How your donation works" as a plain footer link. Needs Comms to cut the two sentences from their page (and to confirm the tax claim wording is legally correct for your country). Costs: no tour, so no dismissal state or library to maintain.

Also possible: A "+ processing fee, confirmed next step" line in the step 2 total. This is a small change with no backend work.

Recommendation: Do the reframe. Two sentences beside the controls answer both support emails at the moment of choice, and you can add the tour later if the emails don't drop. If Comms insists on the tour, hand-roll it and open the page in a new tab.
