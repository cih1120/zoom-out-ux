# clinic-language-third-copy — without skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: pass

---

I'd go with **A, top-right of the header, the same as Consent.**

- **Consistency:** Patients who learned the globe on Consent will look in the same place. Keeping it in one spot on every post-Welcome screen is worth more than any local optimization. Ideally it lives in the shared header component, so Identity gets it too. That's the screen just before Insurance, and it has the same problem.
- **Language-neutral:** The people who need this are the ones who can't comfortably read the English UI. A globe icon, ideally with the current code ("EN ▾"), works for them. Option C's "Change language" is an English string, so it fails for the people it's meant to help. It's also the only option that adds a new element to the layout.
- **Mis-tap risk:** B puts a destructive-feeling control next to Back in an already crowded footer (Back, Next, Call staff). The footer is also where people go to leave or advance, so a language control there invites accidental taps and makes the row harder to scan.

**Implementation points:**
- Make the tap target at least 44–48px, even if the icon is small. This is a tablet, and the header corner is easy to miss.
- Switching language must preserve form state. The whole complaint is that Cancel wipes entries, so the switch should re-render the strings and leave the entered values alone. Check this explicitly on Insurance, since it has more inputs than Consent.
- If Consent's globe is its own one-off component, extract it and reuse it. That avoids a third copy when Identity gets it.

I haven't looked at the code. If you want, I can find the Consent implementation and wire it into Insurance.
