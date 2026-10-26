# donation-form-explainer — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**My recommendation:** put the explanation next to the checkboxes first, and treat the tour as optional. I haven't looked at your codebase, so this is based only on what you've described.

**Tour: hand-rolled or library**
- Step 2 has two things to explain, so a tour library (Shepherd, driver.js, etc.) is overkill. The exception is if one is already in your bundle.
- If you do build the tour, hand-roll it, but get the accessibility right. Each popover needs a proper role and label, focus has to move into it and back out, and Esc has to dismiss it. Don't let it block the form, and check how it lays out on mobile.
- "Don't show again" can be a single `localStorage` flag. Keep the tour re-openable from a small "How does this work?" link, so donors who dismissed it aren't stuck.
- I'd question whether the tour is the right fix. Tours get dismissed reflexively, and the confusion happens at decision time, when donors are looking at the checkboxes. A tooltip that has already closed can't help them.

**Help link: modal or new tab**
- Use a new tab (`target="_blank" rel="noopener"`) and say "(opens in new tab)" in the link text or an `aria-label`.
- A 600-word page in a modal means scrolling inside a scroll, a focus trap to get right, and a poor mobile experience.
- Form state survives in the original tab, so donors can read the page and come back.
- One link per checkbox is fine, but anchor each to its own section of the page (`#processing-fee`, `#tax-relief`). That way the link answers the question the donor actually has.

**What I'd do instead of or before the tour**
1. **Put a short plain-language sentence under each checkbox,** with the "Learn more" link at the end. For example:
   - Fee: "Adds the card/payment fee to your total so the full amount reaches us. You'll see the exact total on the next screen before you pay."
   - Tax relief: "Doesn't change what you pay. It lets us claim an extra amount from the tax authority on your gift."
2. **Cover the fee gap with copy.** You can't show an exact number, but "why is my total different" is mostly a surprise problem. Two options:
   - Show an approximate figure ("usually about 2–3%") if the provider's rate is stable.
   - At minimum, say that the total is confirmed on the next screen. Then make sure that screen labels the fee as its own line item.
3. **Measure the effect.** Track support emails on those two topics, and compare click-through on the help links, before deciding the tour is worth building.

If Comms insists on the tour, a two-stop hand-rolled version is about a day of work. I'd still ship the inline text either way.

I can sketch the checkbox markup with helper text, or the popover component, if you point me at the form's framework and the relevant files.
