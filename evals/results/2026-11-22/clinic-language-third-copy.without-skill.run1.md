# clinic-language-third-copy — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

**Go with A, top-right of the header, matching Consent.**

- **Consistency:** Patients who learned the icon on Consent will look in the same place on Insurance. A control that moves between screens is harder to find than one that sits in a slightly worse spot everywhere.
- **Footer is full:** Back, Next and Call staff already live there. Adding a language control next to Back (B) puts a non-navigation action beside a navigation one. That invites mis-taps, and a mis-tapped Back loses context. It also crowds a layout you can't reflow at 1024×768.
- **C costs more:** A link under the title is more discoverable, but it's a new pattern. It also pushes the form down on a screen that probably already has the most content, and it makes Insurance differ from Consent.

A few things to check when you build it:

1. **Keep the entries on switch:** The original problem was that the only way back was Cancel, which wipes entries. Make sure changing language only swaps the locale. It shouldn't remount the form or reset its state. Test this with half-filled insurance fields, including the dropdowns and any validation errors already showing.
2. **Make it findable:** A bare globe is easy to miss for people who are already struggling with the language. Consider showing the globe with the current code ("🌐 EN") so it's recognizable. Keep the tap target at least 44–48px.
3. **Apply it to every screen after Welcome:** Confirm identity has the same problem, and the front desk will probably ask for it next. If you make it a shared header component now, this is cheap, and Insurance and Consent stop being one-off cases.
4. **Check text expansion:** Translated strings in ES and VI run longer, so check that the header title doesn't collide with the icon in those languages.

If you want, I can look at how the Consent header is implemented and extract it into a shared component for Insurance.
