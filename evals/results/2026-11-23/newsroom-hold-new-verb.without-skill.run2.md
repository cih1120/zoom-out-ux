# newsroom-hold-new-verb — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Use "Hold".**

- **Hold** matches how legal already talks, and it implies a person placed it and a person will release it. The matching button is "Release hold".
- **Pause** suggests it will resume on its own, like a timer or a schedule. That's the wrong expectation next to Schedule.
- **Park** is newsroom and dev jargon, and it doesn't say why the story is off the site.

"Legal hold" also has a specific meaning, which is preserving documents for litigation. Someone might read "On hold" as "do not delete". If that's a risk, label the button "Put on hold" and show the badge as "On hold – legal" or similar. The name itself can stay "Hold".

The tag-plus-filter approach works, but the fake status causes some problems. I'd settle these before building:

1. **What Hold does to the real status.** Don't leave the story `published` with a tag. It would still be live, and the tag would only be a label. Hold should move the story to `draft` (unpublished) and add the `on-hold` tag. Release should restore the previous state. If you want to keep the "This story is being updated" stub at the URL, that's a separate decision.
2. **Guard Publish and Schedule.** While the tag is present, the backend still treats the story as a normal draft. Anyone, or a scheduled job, could republish it. Disable Publish and Schedule in the UI for held stories. Also check whether the API lets you reject those transitions, because the UI alone won't stop other clients or bulk actions.
3. **The tag is editable.** Anyone who can edit tags can silently release a legal hold. Restrict who can add or remove that tag, or use a reserved system tag that the normal tag editor can't touch.
4. **Remember the prior state.** A story that was `scheduled` or `in_review` when it was held needs to go back there. Store that, for example in tag metadata or a hold record, instead of assuming `published`.
5. **Audit trail.** Record who placed the hold, when, and an optional reason. Legal will probably ask.
6. **Search and feeds.** Check that the tag and the draft status take the story out of the sitemap, RSS and search indexes. Also check whether a CDN or cache still serves it.

I can look at the article toolbar and status-transition code in this repo to see how much of this the frontend can enforce. I haven't read any code yet, so tell me if you want me to.
