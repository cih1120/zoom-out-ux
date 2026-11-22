# newsroom-hold-new-verb — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action "Hold", "Park" or "Pause", and add a button, a badge and a tab for it.
Zoomed out: New verb → Familiar: editors already Unpublish and republish, so the question becomes what a temporary pull needs that Unpublish doesn't give you.
Smell: Third copy, because the button, badge and tab each state the same thing.

Within current constraints: Add "Hold" (legal's own phrase, "legal hold"). It's a button that applies a `on-hold` tag and unpublishes, with the badge and a tab filtered on that tag. I'm inferring the constraint from your draft: the status enum is fixed, so the tag fakes the state. The platform team owns the enum, and that rule can change.
Reframed: Keep Unpublish as the only action. Its dialog gets an optional reason, "Legal review", which applies the tag. Legal finds these stories with a saved filter on the existing story list, and Publish brings them back. No new button, badge or tab, and the naming question goes away. Needs the unpublish dialog to take a reason and the list to support a saved tag filter. Costs a held story looks like any other draft unless you filter, and the tag can be removed by anyone who can edit tags.
Door: Keep the tag name and the filter definition stable. A real enum value later then replaces the tag without changing the UI.
Also possible: If the URL must show "This story is being updated" instead of a 404, have the public page render that notice for unpublished stories with the tag. That would replace the manual body swap. I don't know whether legal needs this, so please check.

Recommendation: Take the reframe, with Unpublish plus a reason and a saved filter. If the PM insists on a dedicated button, use "Hold". "Park" is jargon, and "Pause" suggests the story resumes on its own.
