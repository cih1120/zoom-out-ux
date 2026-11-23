# clinic-language-third-copy — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: pass

---

I'd go with **A, top-right of the header**, using the same component as Consent.

- **Consistency:** Patients who learn where the globe is on one screen will look for it in the same place on the next. A "Change language" link (C) or a footer button (B) would make them hunt on each screen.
- **The footer is full:** It already holds Back, Next and Call staff. A fourth control next to Back risks mis-taps on a touch screen. Someone reaching for Back could switch the language, or the reverse. Back is also the control people use when they're lost, so it's the wrong neighbor for a language switch.
- **C has some merit:** A text link is more discoverable than an icon, and it could be written in the patient's own language. But it adds a different pattern, pushes content down on a fixed 1024×768 layout, and Insurance is a dense form.

Some things to check when you build it:
1. **Make it a shared header element.** Put the picker in the common header and render it on Identity, Insurance and Consent. Then Insurance isn't a one-off. Identity has the same problem and probably needs it too.
2. **Keep the form state on switch.** The problem is that Cancel wipes entries, so changing language mustn't reset anything. The form state should live above the translated strings. Re-translate any visible validation errors and placeholders in place, and keep focus where it was.
3. **Size the touch target.** Make the hit area at least 44×44 px, even if the icon stays small.
4. **Consider a label.** If patients miss the bare globe, add the current code beside it, such as "🌐 EN". That helps people who don't recognize the icon. Do it on every screen if you do it at all.

I haven't looked at the code. If you want, point me at the Consent header component and I can wire it into Insurance.
