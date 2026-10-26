# donation-form-explainer — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: fail, 5-specific: fail

---

**My recommendation:** hand-roll it if you build the tour at all, open the help page in a new tab, and fix the confusion at the source before adding a tour.

**Fix the checkboxes first**
- Most "what does this do" confusion comes from labels that state a condition but not the effect. Put one line of helper text under each checkbox.
  - Fee: "Adds the card processing fee to your total so 100% of your gift reaches us. The exact amount is shown on the next step before you pay."
  - Tax: say what it does in plain terms, such as "We claim an extra X% from the government at no cost to you." Keep any legally required eligibility wording.
- You can't show an exact fee, but you can say when it appears. That answers "why is my total different" without backend work. If the provider's rate is stable, "usually about 2%" is fine as long as it's labeled approximate.
- Make the next step's total line itemize the donation and the fee, so the difference is explained at the moment the donor notices it.
- Put "Learn more" links next to the helper text, not instead of it.

**Tour: library or hand-rolled?**
- Step 2 has two or three anchors, so a library (Shepherd, Driver.js) is more weight than the job needs. Check Intro.js's licence before considering it.
- A hand-rolled popover is small now. The native Popover API handles dismiss-on-Escape and the top layer. You still have to write positioning, focus management and `aria-describedby` yourself. That accessibility work is what a library would save you.
- A tour has two bigger risks than the library choice:
  - On a donation form, "first visit" is nearly every donor. You'd be putting an overlay in front of the conversion step for almost everyone.
  - "Don't show again" means storing a flag in localStorage. That's usually fine as a UI preference, but confirm it with whoever owns your consent and privacy setup.
- I'd ship the inline text and links first. Then A/B the tour, or replace it with a single dismissible callout above the checkboxes.

**Help link: modal or new tab?**
- **New tab.** Six hundred words is too long for a modal. Modals also need a focus trap, scroll handling and mobile care. A new tab leaves the donor's form state untouched, and Support gets a plain URL they can paste into replies.
- Use `target="_blank" rel="noopener"`. Say "(opens in new tab)" in the link text or in visually hidden text.
- Ask Comms to put a short "In brief" summary at the top of the page, with anchors for the fee and tax sections. Then each checkbox can link to its own section, such as `#processing-fee` and `#tax-relief`.

I haven't looked at the codebase. If you point me at the step 2 component, I can draft the helper text and link markup, or a minimal popover tour, in your existing framework and styling.
