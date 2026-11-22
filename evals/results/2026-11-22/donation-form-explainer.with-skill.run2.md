# donation-form-explainer — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Link Comms's "How your donation works" page from both checkboxes, add a first-visit tour of step 2 with "Don't show again", and choose between a tour library and a hand-rolled popover, and between a modal and a new tab.
Zoomed out: Explainer → In place: the checkboxes confuse donors because the labels don't say what they do, so rewrite the labels and the explanation moves out of a page and tour and into the labels.
The "why is my total different" emails also trace back to an Earlier problem. The donor picks the fee box on step 2 and only sees the consequence after Continue.

Within current constraints: Add a "Learn more" link on each checkbox that opens in a new tab with `rel="noopener"`, so the half-filled form and its state survive. Skip a tour library for two checkboxes. If Comms insists on the tour, hand-roll one popover with the dismissal stored in localStorage. Bounded by the payment provider calculating the fee only after Continue, owned by backend/payments, with no change planned. Comms owns the page and the tour request, and that request can change.
Reframed: Rewrite both labels to state the consequence.
- Fee: "Add the card processing fee to my donation. The exact amount is shown on the next step before you pay."
- Tax: "I'm a taxpayer. My charity can claim tax relief on this gift. This doesn't change what I pay."
- Step 3 itemizes "Processing fee (you chose to cover it)", so the total difference is explained where it appears.
- The help page stays as a single quiet link, with no tour and no "Don't show again".

Needs: copy changes, plus a legal or compliance check on the tax wording. No backend work.
Costs: Comms's page becomes secondary, and the fee still can't be shown as a number on step 2.
Also possible: Trim the 600-word page using the new label wording as its summary.

Recommendation: Go with the reframe. The two sentences in the labels and the itemized fee on step 3 answer both support emails directly, and they remove the tour, its dismissal storage and the modal-versus-tab question. Keep the new-tab link as the fallback.
