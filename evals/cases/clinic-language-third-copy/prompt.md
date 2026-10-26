---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Front-end on our clinic check-in tablet. Patients go Welcome → Confirm identity → Insurance → Consent forms → Done. The language picker (EN / ES / VI / ZH) used to be only on Welcome. People tap through Welcome in English, hit the insurance questions and want to switch, and the only way back is Cancel, which wipes their entries. Last sprint we added a small globe icon on the Consent screen after the same complaint. Now the front desk wants it on Insurance too. Where should it go there? A) top-right of the header like on Consent, B) next to Back in the footer, C) a "Change language" link under the page title. All strings are already translated, the layout is fixed at 1024×768, and the footer already holds Back, Next and Call staff.
