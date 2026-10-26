# donation-form-explainer — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover, and modal or new tab for the help link, for the two step-2 checkboxes and the "How your donation works" page.

Zoomed out: Explainer (a 600-word help page, a tour, "Don't show again") → In place: can each checkbox explain itself beside the control, at the moment of choice?
Different question: the confusion is "why is my total different", which comes from the fee being unseen on step 2. It isn't a missing tour.

Within current constraints: Build the tour as a hand-rolled popover, because two or three steps don't justify a library dependency. Link the help page in a modal so donors don't lose their form state, and add a "Don't show again" flag in localStorage. Bounded by the fee only being known after Continue (no backend work planned), owned by Comms for the page and by you for the form.
Reframed: Put two or three plain sentences under each checkbox. Fee: "Adds about 2–3% (the exact amount is shown on the next step)." Tax relief: "We claim an extra 25% from the government at no cost to you. This only applies if you pay UK tax." Put one "Learn more" text link to the page after each, and skip the tour. Needs Comms to cut the 600 words down to those lines, and the approximate fee rate from the payment provider's pricing. Costs a little vertical space on step 2, and the full page is read less often.
Door: If you build the tour first, keep the copy in one shared source so the inline text can replace it later.
Also possible: Show the fee estimate live once the fee rate is confirmed as a flat percentage (no backend needed). Add a "Total may change" note on the Continue button.

Recommendation: Do the reframed version, since inline text answers the support emails at the point of confusion and a tour will be dismissed before anyone has the question. If you still need the help page, make it a new tab, because a modal over a payment form is awkward on mobile and risks losing the form. The 25% and UK figures are my placeholders. Swap in your real rates and region.
