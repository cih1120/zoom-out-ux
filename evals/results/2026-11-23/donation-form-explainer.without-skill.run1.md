# donation-form-explainer — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

**My recommendation is to skip the tour and put short inline help next to each checkbox. If comms still wants a tour, use a small library rather than hand-rolling one. For the help link, open the page in a new tab, not a modal.**

**Tour or inline help**
- A tour over two checkboxes is a lot of machinery for a small problem. It also shows up before the donor has met the confusion, so they tend to dismiss it. First-time donors are most of your traffic, and they're the ones least likely to read it.
- Support is getting "why is my total different" emails. That means the explanation is missing at the point of decision, so a tour won't fix it. One line of helper text under each checkbox plus a "Learn more" link will.
- If the tour is non-negotiable, use a library such as Shepherd or Driver.js. Hand-rolling means rebuilding focus management, Escape handling, screen-reader announcements, scroll and positioning on mobile, and resize behavior. That's where the bugs are, and you'd be doing it on a payment form.
- Persist "Don't show again" in `localStorage`. Expect it to be lost in private mode or after storage is cleared, so make sure the tour can't block the form.

**Modal or new tab**
- Use a new tab with `target="_blank" rel="noopener"`, and add "(opens in a new tab)" to the link text or `aria-label`. The donor keeps their step 2 state, and 600 words scroll better on a page than in a modal on a phone.
- A modal also needs focus trapping and a way to close it, and it interrupts checkout.
- If comms wants it to stay in-page, put a 2–3 sentence summary in an inline expander and link out for the full page.

**Fee without backend work**
- You can't show an exact amount, but you can set expectations in the copy. For example: "Your total will update on the next step to include the processing fee."
- If the provider's rate is a flat percentage plus a fixed amount, you could show an approximate figure client-side, labeled "about £X". It will be wrong whenever the fee varies by card type or country. Without a flat rate, stick with the wording above.
- Show the fee as its own line item on the next step. That should answer most of the "why is my total different" emails.

**Tax checkbox**
- Say what it does in the label or helper text: who it applies to and what it costs the donor, which is usually nothing. "Qualify for tax relief" is vague.
- This is probably a legal declaration, so have whoever owns compliance approve any rewording.

I haven't looked at the codebase. Tell me which frontend framework the form uses and I can sketch the helper text and link markup, or the tour setup.
