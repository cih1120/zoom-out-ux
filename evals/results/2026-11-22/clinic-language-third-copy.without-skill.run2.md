# clinic-language-third-copy — without skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: pass

---

**Go with A, the top-right of the header.**

- **Consistency:** Consent already has the globe there, so patients who learn it on one screen will look in the same place on the next. Ideally it becomes a shared header component on every screen after Welcome, rather than being re-added screen by screen.
- **B is crowded and risky:** The footer already holds Back, Next and Call staff. A fourth control next to Back invites mis-taps, and a language control sitting beside a navigation button can read as part of the navigation. Tablet users also tend to hit footer buttons quickly.
- **C adds a second pattern:** A text link under the title would be the only screen with a different treatment. It does have one advantage. A text label is more discoverable than a bare globe for people who don't recognize the icon. You can get that benefit within A by showing the globe with the current language code ("🌐 EN") instead of the icon alone. The label also helps someone who has landed in the wrong language and can't read the page. Since Consent already uses the plain globe, I'd make that change on both screens at once.

**Implementation points:**
- **Keep entries when the language changes.** The point of this change is to avoid the Cancel wipe, so switching language has to re-render in place. It must not reset the form state or navigation. Check that the language change doesn't remount the Insurance form or clear its fields. Also check that validation error messages re-translate rather than going stale in the old language.
- **Make the touch target at least 44×44 px.** At 1024×768 the header has room for that, and a small icon is easy to miss on a shared tablet.
- **Use the same picker on every screen.** Reuse the Consent dropdown or sheet so the behavior is identical.
- **Consider Identity too.** If people switch on Insurance, some will want to switch on Confirm identity as well. A shared header component would cover that.

I haven't looked at the code. If you'd like, I can find the Consent globe implementation and wire it into Insurance, and check how language state is held.
