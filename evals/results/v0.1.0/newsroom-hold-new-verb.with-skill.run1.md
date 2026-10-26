# newsroom-hold-new-verb — with skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action: Hold, Park or Pause.
Zoomed out: New verb, with Faster chore → Familiar: editors already have Unpublish, so the question becomes whether legal's hold is a separate action or a reason for unpublishing.

Within current constraints: Add a "Hold" button next to Unpublish that unpublishes, adds a `legal-hold` tag and serves the "being updated" placeholder. Add an "On hold" badge and a "Held stories" tab that filter on the tag. Pick "Hold" because it's legal's own word. "Park" sounds like shelved, and "Pause" implies it resumes on its own. Bounded by the status enum, which the platform team owns and won't change this quarter. The tag can drift out of sync with the real status, for example a published story that still carries the tag.

Reframed: There's no new button. Unpublish opens a small dialog with an optional reason, and "Legal hold" is one of the choices. That reason applies the tag and serves the placeholder. "Held stories" becomes a saved filter in the existing story list, and Publish restores the story and removes the tag. Needs the placeholder to be served at the story's URL, which both versions need anyway. Costs one dialog field, and the hold is less prominent than a toolbar button.

Door: Keep the tag in one helper or constant, so a real status value can replace it later without touching the UI.

Also possible: A log of who held a story and when, and a reminder for holds that are still open after a day.

Recommendation: Take the reframe. It adds no toolbar control and no naming debate. If the PM wants a dedicated button anyway, call it "Hold". I haven't looked at the codebase, so I'm assuming Unpublish keeps the body intact.
