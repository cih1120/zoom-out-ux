# clinic-language-third-copy — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language control go on Insurance: header top-right, footer next to Back, or a link under the title?
Zoomed out: Placement shopping and Third copy → Wider: the question becomes "why does each screen have to adopt this control one complaint at a time?" Welcome has a picker, Consent has a globe, and Insurance would be the third copy. Identity and Done will be next.

Within current constraints: A, the globe in the header's top-right, copied from Consent. The footer is already full with Back, Next and Call staff, so B crowds the primary navigation. C adds a new pattern that matches nothing else. The 1024×768 fixed layout is the constraint. It is owned by whoever owns the tablet layout, and the header slot is already free on Consent.
Reframed: Put the globe in the shared header on every step, from Welcome through Done. Switching language re-renders in place and keeps the patient's entries. Needs the header to be one shared component, and the language state to live above the screens so a switch never resets the form. Costs touching Welcome and Consent, plus a pass to check that the longer ES, VI and ZH strings still fit beside the globe at 1024×768.

Door: If you ship A now, build it as the shared header component rather than a second copy-paste. Then Identity and Done are free later.

Also possible: Remembering the chosen language for the next patient is left out. Resetting to English after Done is probably the safer default for a shared tablet.

Recommendation: Do A, but build it as the shared header element so it is one control on all five screens. It's the same placement you asked about, and it ends the screen-by-screen requests. The switch must never wipe entries. That is the real fix for the Cancel problem.
