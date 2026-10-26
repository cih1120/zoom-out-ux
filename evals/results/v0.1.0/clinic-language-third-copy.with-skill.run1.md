# clinic-language-third-copy — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Where should the language picker go on Insurance: header top-right, footer next to Back, or a link under the title?
Zoomed out: Placement shopping and Third copy → Wider: the picker now needs a home on a third screen (Welcome, Consent, Insurance), so the question becomes which screens should have it at all.
Zoomed out: Escape hatch → Different question: switching language shouldn't be a risky exit, so it should never touch the patient's entries.

Within current constraints: Option A, a globe at top-right of the Insurance header, matching Consent. Skip B because the footer already holds Back, Next and Call staff, and a language control beside Back is easy to mis-tap. Skip C because it is a one-off pattern that adds a third placement style. This is bounded by the fixed 1024×768 layout and the full footer, and I'm assuming the front-end team owns it.
Reframed: Put the globe in the shared header on every screen after Welcome, including Confirm identity, which has the same gap. Keep the chosen language in app state, so switching re-renders in place and keeps everything entered. Needs the header to be one shared component, and Consent's globe to move into it. Costs a small refactor, plus a check that no screen stores translated strings in its form state.
Door: If you ship A first, build it as that shared header component rather than copying Consent's markup, so the third copy doesn't become the fourth.
Also possible: Reset the language to default on Done, so the next patient doesn't inherit it.

Recommendation: Do the reframed version. The visible change on Insurance is the same as A, but Confirm identity gets fixed too and Cancel stops being the only way back. I haven't looked at the code, so check that language switching really does preserve entries on Consent today.
