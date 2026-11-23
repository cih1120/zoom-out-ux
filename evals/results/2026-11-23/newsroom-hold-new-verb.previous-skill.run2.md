# newsroom-hold-new-verb — previous skill, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action: Hold, Park or Pause. It comes with a toolbar button, a list badge and a "Held stories" tab.
Zoomed out: New verb → Familiar: editors already have Unpublish, so the question becomes "what does Unpublish fail to do that made them copy the body by hand?"
Also Guardrail stacking → Different question: the tag, filter, badge and tab are all there to fake a status the enum doesn't have.

Within current constraints: Add a "Hold" button that unpublishes the story and adds a `legal-hold` tag. Add a badge and a saved filter in the story list. Name it **Hold**: "Pause" suggests it resumes by itself, and "Park" suggests a draft shelf. This is bounded by the fixed status enum, which the platform team owns and could change next quarter.

Reframed: There is no new verb. Unpublish gets an optional reason ("Legal review") that sets the tag. Held stories are then a filter chip on the existing list, with no badge or tab. Publish brings the story back. Needs: a check on why editors paste a placeholder instead of unpublishing. I'm guessing that unpublishing 404s the URL, which breaks links and shares. If so, the real gap is what readers see at that URL, and the platform team would need to serve a placeholder for unpublished stories. Costs: if the placeholder is the need, this depends on the platform team. Otherwise it's small.

Door: Make the tag name a constant and keep "held" out of the UI copy. A real enum value can then replace the tag later.

Recommendation: Ask editors why they paste the placeholder. If a plain 404 is acceptable, ship the Unpublish reason and the filter. If not, ship "Hold" as drafted, and raise the placeholder with the platform team.
