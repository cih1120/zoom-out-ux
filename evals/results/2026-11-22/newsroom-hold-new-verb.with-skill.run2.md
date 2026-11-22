# newsroom-hold-new-verb — with skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action: Hold, Park or Pause?
Zoomed out: New verb → Familiar: editors already have Unpublish, so what is missing is a reason and a way to find the story again, not a fourth status verb.
Third copy → In place: a button, a badge and a tab all describe one fake state, and the state can drift from the real status.

Within current constraints: Add a "Hold" button that unpublishes the story and adds a `hold` tag, with a badge and a saved "Held" filter. Clear the tag automatically on Publish or Schedule so it can't go stale. Pick "Hold" over Park or Pause, because Pause implies it resumes by itself and Park is jargon. One caution: "legal hold" has a specific preservation meaning, so check the name with legal. Bounded by the status enum, owned by the platform team, who won't change it this quarter. The rule can change later.

Reframed: No new action. Unpublish gets an optional "Reason" (e.g. Legal review) that applies the tag. Legal finds held stories through a saved filter in the existing story list, not a new tab. Needs the Unpublish dialog and the list filter to support a reason tag. Costs: Unpublish takes one more field, and you lose a dedicated button, which editors may like.

Open question that decides this: the manual workflow keeps the URL live with "This story is being updated". Unpublish probably returns a 404 instead. If the public notice matters, a new action is justified, and you should say so in the PM thread.

Door: Store the reason as a tag now, so it can move to a real status value if the platform team adds one.

Recommendation: Take the reframed route unless the placeholder page is required. If it is, build Hold, because it does something Unpublish doesn't.
