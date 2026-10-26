# clinic-language-third-copy — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Go with A: top-right of the header, same as Consent.**

- **Consistency:** Patients who learned where the globe is on Consent will look in the same place on Insurance. A fixed position across screens is what makes it findable for someone who is already struggling with the language.
- **The footer is the wrong place (B):** Back, Next and Call staff are all navigation or escalation actions. A language control beside Back looks like another navigation button, and at 1024×768 a crowded footer invites mis-taps on a tablet. A mis-tap on Back or Call staff is worse than a mis-tap on a header icon.
- **Option C is weaker:** A text link under the title is a different pattern from Consent, so you'd have two designs for one function. It's also a small tap target, and the link text is in the language the patient can't read. A globe is language-neutral.

Some details that matter more than the placement:

1. **Switching must not clear form state.** The original complaint is that the only way back is Cancel, which wipes entries. Check that changing language on Insurance re-renders strings without resetting the form or step. That's the most likely bug.
2. **Make the tap target at least 44×44 px,** even if the icon is small. Consider showing the current code (e.g. "🌐 EN") so it's clear what the control does.
3. **Show each language in its own name** in the picker (English, Español, Tiếng Việt, 中文), not translated into the current language.
4. **Put it on Confirm identity too.** It has the same problem and it's the screen right after Welcome. If you can, make it a shared header component on every screen after Welcome, so the next request doesn't turn into another one-off.

I haven't looked at the codebase. If you'd like, I can find the Consent header implementation and reuse it for Insurance, and check that the language switch preserves form state.
