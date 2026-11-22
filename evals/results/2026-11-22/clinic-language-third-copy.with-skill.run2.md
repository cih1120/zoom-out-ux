# clinic-language-third-copy — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

```
Ask: Where should the language picker go on the Insurance screen: header top-right, next to Back, or a link under the title?
Zoomed out: Placement shopping + Third copy → Wider: the picker belongs to every screen after Welcome, not to Insurance. Insurance is the third place that needs it, and Identity will be next.

Within current constraints: A, a globe in the top-right of the header, matching Consent.
- B puts a language control beside Back in a footer that already holds Back, Next and Call staff, and a mis-tap there risks leaving the screen.
- C would be a third pattern for the same control.
- Bounded by the fixed 1024×768 layout and the full footer, owned by whoever owns the tablet layout (I'm inferring that).

Reframed: Make the globe one shared header element on Identity, Insurance and Consent (and Done, if wanted).
- Language becomes app-level state, so switching re-renders the current screen and keeps what's been entered.
- Needs: the Consent globe pulled into a shared header component, and a check that switching mid-form never clears fields.
- Costs: touching the shared header and retesting every screen, instead of one screen.

Door: Don't copy the Consent globe into Insurance. Build Insurance's from the shared component, so the rollout to the other screens is only wiring.

Also possible: remembering a patient's language for return visits. I've left it out.

Recommendation: Use A, built as the shared header component, and add it to Identity at the same time. Without that, the same complaint comes back one screen earlier.
```

I haven't looked at the codebase yet. If you'd like, I can check how the Consent globe is built and whether the language state survives a switch.
