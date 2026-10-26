# newsroom-hold-new-verb — with skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action: "Hold", "Park" or "Pause"?
Zoomed out: New verb → Familiar: users already have Unpublish, and a hold is an unpublish with a reason.

Within current constraints: Name it "Hold", which is the word legal already uses ("legal hold"). Add a toolbar button that unpublishes the story to draft and adds a `on-hold` tag. Add a list badge from the tag and a "Held stories" tab that filters on it. Publish clears the tag. Bounded by the status enum, owned by the platform team, who won't add a value this quarter.
Reframed: There is no new button. Unpublish opens a small dialog with an optional reason, "Legal hold", that applies the tag. The tag shows as a chip in the story list. "Held stories" becomes a saved filter on the existing list rather than a new tab. Republishing is just Publish. Needs the Unpublish dialog to take a reason and Publish to clear the tag. Costs a bit less discoverability than a dedicated button, and legal has to learn that holds live under Unpublish.
Door: If you build the button, make it call the same unpublish-with-reason path, so you can drop the button later without migrating data.
Also possible: A public "This story is being updated" placeholder at the URL, so links don't 404 while the story is held. Check this, because it's what editors are faking by hand today.

Recommendation: Take the reframed version. It adds no new verb or toolbar control, and the tag-as-status workaround stays in one place. If the PM insists on a visible button, use "Hold" and wire it to Unpublish.
