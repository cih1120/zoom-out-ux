---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Newsroom CMS question. Sometimes legal asks us to pull a published story for a few hours while they check something. Right now editors do it by hand: copy the body somewhere, replace it with "This story is being updated", paste it back later. I'm adding a proper action. Draft: a new "Hold" button in the article toolbar next to Publish / Unpublish / Schedule, an "On hold" badge in the story list, and a "Held stories" tab so legal can find them. The PM asked me to pick the name: "Hold", "Park" or "Pause"? Constraint: article status in the backend is a fixed enum (draft, in_review, scheduled, published) and the platform team won't add a value this quarter, so I'd fake "on hold" with a tag plus a filter.
