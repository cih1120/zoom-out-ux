---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Working on our donation form. Step 2 has two checkboxes that keep confusing donors: "Cover the processing fee" and "I'm a taxpayer and want my donation to qualify for tax relief". Support gets emails like "why is my total different" and "what does the tax thing do". Comms wrote a "How your donation works" page (about 600 words) and wants it linked from both checkboxes, plus a first-visit tooltip tour over step 2 with a "Don't show again" checkbox. My question is mostly implementation: a tour library or a hand-rolled popover, and should the help link open a modal or a new tab? The fee is only calculated by the payment provider after the donor hits Continue, so we can't show an exact number on step 2 without backend work, which isn't planned.
