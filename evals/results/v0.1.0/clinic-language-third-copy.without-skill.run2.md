# clinic-language-third-copy — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: pass

---

**Recommendation: A, top-right of the header, matching Consent.**

- **Consistency:** Patients who learned the globe on Consent will look in the same place on Insurance. Since the problem is people not knowing they can switch, a fixed location across every post-Welcome screen matters more than any single placement.
- **Footer is full:** B would put a fourth control in a row that already has Back, Next and Call staff. That's a bad fit on a 1024×768 tablet, and a language control next to Back risks accidental taps that look like navigation. Language is a page-level setting, not a step action.
- **C adds a one-off pattern:** A text link under the title is a different control from the Consent globe, so you'd have two patterns for one feature. It's also a smaller touch target unless you pad it, and it pushes the form down on a screen that's probably already dense with insurance fields.

**Implementation notes:**
- Pull the globe into a shared header component used by both Consent and Insurance (and ideally Confirm identity too). Then the placement can't drift.
- Switching language must not reset form state. That's the original complaint, so check that the Insurance entries survive a locale change. The insurance questions are probably the longest strings, so also check ES and VI for text overflow.
- Make the touch target at least 44×44 px even if the icon is small, and give it an accessible label such as "Language", itself localized or shown as the native names (English, Español, Tiếng Việt, 中文).
- Consider a visible "EN ▾" or label next to the globe. A bare icon is easy to miss, and the people who need it may not read the current language well.

If you want, I can look at the Consent implementation in the repo and wire the shared header into Insurance.
