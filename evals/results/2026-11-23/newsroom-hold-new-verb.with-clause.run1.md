# newsroom-hold-new-verb — with skill plus the Different question clause, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

```
Ask: Name the new "Hold" action (Hold / Park / Pause) for temporarily pulling a story for legal.
Zoomed out: New verb → Familiar: editors already have Unpublish and Publish, so is a third verb needed, or is this Unpublish with a reason?

Within current constraints: Name it "Hold", because it's legal's own word and "Pause" implies it resumes by itself. Add the toolbar button, an "On hold" badge from a tag, and a "Held stories" tab that is a tag filter. Bounded by the fixed status enum, owned by the platform team (they can lift it, just not this quarter).
Reframed: There is no new button. Unpublish gets an optional "Reason: legal hold" choice that applies the tag. The existing list shows the tag as a chip, and legal gets a saved filter in the list they already use. Republishing is the existing Publish. Needs a check that Unpublish keeps the body intact, and a decision on whether the public URL must show "This story is being updated". If it must, the web team needs a rule that renders that notice for tagged stories. Costs: legal's "Held stories" becomes a filter and not a tab, and the status is still a tag, so it can be edited or removed by anyone who can edit tags.
Door: If you build the button anyway, use one reserved tag such as `hold:legal`, so a real status can replace it later with a simple migration.
Also possible: A hold note with who asked and when, and a nudge for holds that have run longer than N hours.

Recommendation: Try the reframed version first, since it needs no new verb or tab. Build the dedicated "Hold" button only if editors need the public notice and Unpublish can't give it to them.
```
