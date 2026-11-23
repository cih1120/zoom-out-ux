# clinic-language-third-copy — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language switcher go on Insurance: header top-right, next to Back, or a link under the title?
Zoomed out: Placement shopping and Third copy → Wider: the switcher is a need on every step after Welcome, so the question is where it lives across the whole flow, not where it goes on Insurance.

Within current constraints: Option A, the top-right globe, matching Consent. B would crowd a footer that already holds Back, Next and Call staff, and it sits beside navigation, so it could be hit by mistake. C is a new pattern that would be the third placement style. Bounded by the fixed 1024×768 layout and the full footer, owned by whoever owns the tablet layout (front desk and design).
Reframed: Put the globe in one shared header used by every step, so Identity gets it too. Welcome keeps its large picker, and the globe sits in the same place on every later step. Switching language only changes the display language, so entries on the current and earlier steps stay. Needs the header pulled out into a shared component, and the language held in app-level state, not per-screen state. Costs a small refactor, plus touching Identity, which has the same problem.

Door: If you paste the globe into Insurance as another copy, Identity becomes a fourth. Build it as the shared header component now, and use it first on Insurance and Consent.

Recommendation: Go with A, built as the shared header. It's the same position as Consent, so it's consistent and it solves the Identity case. Before shipping, check that switching language doesn't reset form state. That reset is what makes Cancel feel like the only way back.
