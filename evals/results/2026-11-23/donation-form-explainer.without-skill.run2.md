# donation-form-explainer — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**My recommendation:** use a new tab for the help link, and swap the tour for inline microcopy. If Comms insists on the tour, use a small library.

**Help link: new tab, not a modal**
- 600 words is too long for a modal, especially on mobile.
- A new tab can't lose the donor's form state, and a modal can if it's dismissed badly or the back button misfires.
- A modal also needs a focus trap, Esc handling and scroll locking, so it's more to build and test.
- Use `target="_blank" rel="noopener"` and put "(opens in new tab)" in the link text or `aria-label`.
- If you want to stay on the page, an inline expandable "How does this work?" under each checkbox is a better alternative than a modal.

**Tour: library, if you build it at all**
- Hand-rolling the tour is where the cost is. Positioning, focus management, screen-reader announcements, scroll-into-view and mobile layout are all fiddly.
- Pick a small MIT-licensed library such as Driver.js or Shepherd. Check the license first, because Intro.js is AGPL or commercial.
- Floating UI is a lighter option if you only need a popover or two and no stepper.
- Store "Don't show again" in `localStorage` and fall back gracefully if storage is blocked. Don't auto-start the tour on small screens.
- A tour over a payment form can pull donors out of the flow, and it doesn't fix the underlying copy problem.

**What I'd do before the tour**
The support emails say the labels and totals are unclear, so I'd fix those first:
- **Fee checkbox:** you can't show an exact fee, but you can show an estimate with no backend work if the provider's rate is stable. For example: "Add about 3% to cover processing fees (final amount shown on the next step)." You can also add a one-line note under the total: "Your total may change if you cover fees."
- **Tax checkbox:** say what it does in the label, for example "Yes, claim tax relief. The charity gets an extra X% at no cost to me." Add one line saying you must be a taxpayer.
- **Help link:** put a "How this works" link beside each checkbox, pointing at the matching anchor on Comms' page.
- **Next step:** show the fee line item and the final total on the confirmation step, so "why is my total different" has an answer on screen.

I'd ship the inline copy and links first, then check whether support volume drops before adding the tour. I haven't looked at your codebase. If you tell me the framework, or point me at the Step 2 component, I can sketch the implementation.
