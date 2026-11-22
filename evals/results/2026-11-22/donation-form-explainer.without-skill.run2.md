# donation-form-explainer — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

**My recommendation:** put the explanation next to the checkboxes first, use a new tab for the help page, and keep the tour minimal or skip it.

## Fix the confusion at the source
Both support emails come from missing context at the point of decision. A tour is shown once, before the donor has formed the question, and many donors dismiss it without reading. Inline text under each checkbox does most of the work:

- **Cover the processing fee:** "Adds the card/payment fee to your donation so we receive the full amount. The exact fee is calculated by our payment provider and shown on the next screen before you confirm."
- **Tax relief:** "Doesn't change what you pay. [How this works ↗]". Comms or finance should confirm the eligibility wording for your jurisdiction.

The first line answers "why is my total different" directly. The second answers "what does the tax thing do". If you can't show an exact fee, you could show an estimate from the provider's published rate, labeled "approx." Only do that if the estimate will be close, because a wrong number creates a new support email.

## Tour: library or hand-rolled?
With one step and two targets, I'd avoid a full tour library. If you do build the tour:

- **Hand-rolled:** this is fine for two non-blocking popovers anchored to the checkboxes. Skip the backdrop and focus trap. You need `aria-describedby` or `role="dialog"` handled properly, Esc to close, and no scroll-jacking on mobile.
- **Library:** use one only if the tour will grow to more steps or other pages. Shepherd and driver.js are the usual picks. Check their keyboard and screen-reader behavior and bundle cost before committing. Your form is a payment flow, so a heavy dependency there is a real cost.

For "Don't show again", store a flag in `localStorage` under a versioned key (e.g. `donationTourStep2_v1`) so you can re-show it after copy changes. Wrap access in try/catch for private browsing. Add a small "?" or "How this works" link that reopens the help, so dismissing the tour isn't permanent.

## Modal or new tab?
Use a **new tab** (`target="_blank" rel="noopener"`, with "(opens in new tab)" in the link text or an icon with an accessible label).

- A 600-word page in a modal on a payment form is awkward to scroll, especially on mobile. It also needs a focus trap and return-focus handling.
- The form state stays intact in the original tab, so donors can read the page and come back.
- Comms can edit and link to the page elsewhere without changing the form code.

If the form state lives only in memory and you see tab-switching drop-offs on mobile, check that with analytics. I wouldn't assume it's a problem.

## Suggested next step
Ask comms for a two-sentence summary of each concept, to use as the inline text, and keep the 600-word page as the "learn more" destination. Then track whether the two support emails drop before deciding the tour is worth building.

If you want, I can look at the step 2 component and sketch the inline text, link, and (if you still want it) the minimal tour.
