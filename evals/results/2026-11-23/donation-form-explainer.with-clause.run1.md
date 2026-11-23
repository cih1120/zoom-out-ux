# donation-form-explainer — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Tour library or hand-rolled popover, and modal or new tab for the help link, on the step 2 checkboxes.

Zoomed out: Explainer → In place: the question changes from "how do we deliver the explanation" to "what do the two labels need to say so nobody needs one".

Within current constraints: Use a hand-rolled popover. Two tooltips don't justify a library dependency, so only pick a library if another tour already exists in the app. Open the help page in a new tab with `rel="noopener"`. The form stays intact, and you avoid building a modal with a focus trap. Store "Don't show again" in localStorage. This is bounded by Comms' brief (the page, the links and the tour), and by the backend, since the fee is only known after Continue.

Reframed: Put the answer under each checkbox as one line of helper text.
- Fee: "We'll add the card fee on the next step, and you'll see the exact total before you pay."
- Tax: say what it does and that it costs the donor nothing, for example "Lets the charity claim [X] on your gift. Your payment stays the same."

Keep one "How your donation works" link under the pair. Skip the tour. This needs Comms to agree to drop the tour and to approve the two lines. I'm assuming the next step shows the fee-inclusive total before payment. If it doesn't, that's the real cause of the "why is my total different" emails. It costs a copy review, and some vertical space on step 2.

Also possible: if the provider publishes a flat rate, the fee line can quote "about N%".

Recommendation: Do the reframe. It's less to build, and it answers the support emails at the point where donors get confused. Keep the new-tab link as the fallback.
