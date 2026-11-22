# clinic-language-third-copy — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language picker go on Insurance: header top-right, footer next to Back, or a link under the title?
Zoomed out: Placement shopping and Third copy → Wider: this is the third screen to need the picker, so the question is where language lives for the whole flow, not where it goes on this screen.

Within current constraints: Option A, a globe in the header top-right, matching Consent. It keeps the footer to Back, Next and Call staff. Bounded by the fixed 1024×768 layout and the existing Consent pattern, owned by the front-desk and product team, who can change both.
Reframed: Put one language control in the shared header on every step, Welcome through Done. Switching re-renders in place and keeps patient entries, so Cancel is no longer the only way back. Needs language held in app-level state, not per screen, and form values that survive a re-render. Costs a small refactor of Welcome and Consent, plus a check that Insurance fields and validation messages keep their values when the language changes.

Door: If you ship A as a copy on Insurance, build it as the shared header component, so Consent and the later screens can adopt it without a rewrite.
Also possible: Defaulting the language from the patient's record at check-in. I'm leaving that out.

Recommendation: Do the reframed version. Option A's placement is right, but make it one header control that all screens share, not a third copy. Show "🌐 EN" instead of a bare globe so patients can tell what it does.
