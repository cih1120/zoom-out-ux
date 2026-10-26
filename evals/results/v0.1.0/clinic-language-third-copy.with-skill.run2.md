# clinic-language-third-copy — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Ask: Where should the language picker go on Insurance: header top-right, footer next to Back, or a link under the title?
Zoomed out: Third copy and placement shopping → Wider: the question is where a language control lives for every screen after Welcome, not where it goes on Insurance.

Within current constraints: Option A, a globe icon top-right of the header, matching Consent.
- Option B is out because the footer already holds Back, Next and Call staff, and a language control beside Back would be easy to mis-tap.
- Option C adds a third pattern.
- The constraint is the fixed 1024×768 layout, owned by the front-end team.

Reframed: Put the globe in the shared header component, so every step after Welcome shows it in the same spot. That covers Confirm identity, Insurance and Consent, and it's the same fix you'd otherwise make again when someone complains about Confirm identity.
- Needs: the header extracted into one component, and language held in app-level state so switching keeps the patient's entries. Check that the Consent globe does this today, because Cancel wiping entries was the original complaint.
- Costs: touching the Identity header and retesting all three screens.

Door: If you build A on Insurance now, build it as that shared component rather than a second copy of the Consent icon.

Also possible: Welcome's full picker could shrink to the same globe. I'd leave that for later.

Recommendation: Do the reframe. It's a small step beyond A, and it stops the next screen from needing its own request. If the schedule is tight, ship A as the shared component on Insurance and Consent, then add Identity.
