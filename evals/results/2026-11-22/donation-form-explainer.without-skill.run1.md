# donation-form-explainer — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Recommendation:** skip the tour, put short explanatory text next to each checkbox, and open the help page in a new tab.

**Tour vs. hand-rolled popover**
- A tour is the weakest fix here. Donors on a payment form are task-focused and will dismiss an overlay without reading it. It also won't help the "why is my total different" emails, because that confusion happens on the next step, after the fee is added.
- If Comms insists, hand-rolling is fine for 2–3 stops on one screen. Use a positioning primitive you already have (Floating UI, Radix Popover) rather than a full tour library. You'd be adding a dependency, and often a license or styling fight, for one screen. The work is in accessibility: focus management, Escape to close, `aria-describedby`, mobile positioning, and respecting reduced motion.
- Persist "seen" in `localStorage` when the donor finishes or dismisses the tour, and wrap it in try/catch for private browsing. A "Don't show again" checkbox isn't needed, and it adds a third checkbox to the step that's already confusing. A "Got it" button does the same job.

**What I'd build instead**
1. **Inline helper text under each checkbox.** One sentence each, with the "How your donation works" link at the end.
   - Fee: "Our payment provider charges a small fee on each card payment. Tick this to add it to your total so the full amount reaches us. You'll see the exact figure on the next step before you confirm."
   - Tax: say plainly what it does and whether the donor's total changes. If it doesn't, say "this doesn't cost you anything extra."
2. **Show the fee as its own line on the next step.** Something like "Includes £X processing fee you chose to cover" fixes the "why is my total different" confusion where it happens. It needs no backend work, since you already have the number at that point.
3. **Optional estimate.** If the fee schedule is stable, say "usually about 2–3%". Only do this if it's accurate, since a wrong estimate creates new support emails.

**Help link: modal or new tab**
- Use a new tab with `target="_blank" rel="noopener"`, and make the link text signal it, e.g. "How your donation works (opens in new tab)".
- A 600-word modal in the middle of a payment flow is awkward on mobile, needs a focus trap, and adds a way to lose or confuse form state. A new tab leaves the form untouched.
- If Comms wants it faster to scan, make the page's first paragraph answer the two checkbox questions, and anchor-link each checkbox to its own section (`#fee`, `#tax-relief`).

If you tell me the stack, or want me to look at the step 2 component in this repo, I can sketch the helper text and the line item on the next step.
