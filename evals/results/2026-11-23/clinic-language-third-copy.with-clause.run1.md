# clinic-language-third-copy — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language picker go on Insurance: header top-right, next to Back in the footer, or a "Change language" link under the title?
Zoomed out: Third copy and Placement shopping → Wider: the question isn't where it goes on Insurance. It's why each screen needs its own copy. Identity has the same problem, and so does any later step.

Within current constraints: Use A, the top-right globe, matching Consent. B puts a language control beside Back and Next in a footer that's already full, and a mis-tap there is costly. C would be a third pattern for the same control. Bounded by the fixed 1024×768 layout and the full footer, owned by whoever owns the tablet design (front desk/product).
Reframed: Put the globe in the shared header of the check-in shell, so it shows on every step after Welcome. Switching language re-renders in place and keeps what the patient has typed. Needs the language held in app-level state, apart from each screen's form state, and Consent's own globe replaced by the shared one. Costs a small refactor now. After that, no screen needs another request like this one.
Door: Build the Insurance globe as a shared header component that takes no screen-specific props. Consent can then adopt it, and Identity gets it for free.

Recommendation: Go with A, built as the shared header element. The placement is the same as the local fix, but this stops the picker from being re-requested on Identity or any future step. Check that switching language mid-form keeps entries on Insurance. That is what Cancel was destroying, and it's the part patients care about.

I haven't looked at the code. If you want, I can check how Consent's globe is wired and how language state is stored.
