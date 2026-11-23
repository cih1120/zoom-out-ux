# clinic-language-third-copy — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language picker go on Insurance: header, footer or a link under the title?
Zoomed out: Placement shopping and Third copy (Welcome, Consent, now Insurance) → Wider: language belongs to the whole flow, not to each page. The same complaint will come back for Confirm identity.

Within current constraints: Option A, a top-right globe matching Consent. Option B crowds a footer that already holds Back, Next and Call staff. Option C is a new pattern that only Insurance would have. Bounded by the fixed 1024×768 layout and the full footer, owned by the front-end team. I haven't looked at the code, so I'm assuming the header is a separate component on each screen.
Reframed: One globe in a shared header on every screen after Welcome, with the language held in app-level state. Switching it re-renders the labels and leaves entries alone. Needs form state to be independent of language, which includes validation messages and any values stored as translated text. It also needs the header to be one shared component. Costs: touching Confirm identity as well, plus a test that entries survive a switch on each screen.
Door: If you build A as another per-screen copy, you'll build a fourth one for Confirm identity. Build it as the shared header now, even if only Insurance and Consent use it at first.
Also possible: Defaulting the language from the appointment record, so fewer people start in English. I've left it out.

Recommendation: Do A, but as the shared header component so Consent and Insurance use the same code. Add Confirm identity when you next touch it. Cancel then stops being the only way back for someone who just needs another language.
