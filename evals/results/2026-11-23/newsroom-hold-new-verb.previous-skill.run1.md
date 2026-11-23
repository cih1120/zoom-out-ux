# newsroom-hold-new-verb — previous skill, run 1

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Name the new action: Hold, Park or Pause?
Zoomed out: New verb → Familiar: editors already have Unpublish, so the question becomes what a hold does that Unpublish doesn't.

Within current constraints: Add "Hold" (not Park or Pause) as a toolbar button. It sets a `legal-hold` tag, swaps the body for the "being updated" placeholder, and stores the original body. The "On hold" badge and "Held stories" tab are filters on that tag. "Hold" is already newsroom language for this ("legal hold", "hold the story"). "Park" suggests shelved ideas, and "Pause" suggests it resumes on its own. Bounded by the fixed status enum, owned by the platform team. The rule can change, but not this quarter.
Reframed: Don't add a verb. Unpublish gets a reason picker, and "Legal review" sets the tag. The badge and the tab become a "Reason" filter on the unpublished list. Republishing clears the tag. Needs a reason field on unpublish, or just the tag. Costs: if legal needs the URL to keep showing the placeholder instead of a 404, Unpublish doesn't do that. I assumed the placeholder is a workaround, so please check. If it's required, the placeholder is a property of the hold, and the new button is justified.
Door: Build the tag, badge and filter as "reason" tags, not hold-specific ones, so the Unpublish route stays open.
Also possible: Other reasons (corrections, embargo) and a "held since" timestamp.

Recommendation: First ask legal whether a 404 is acceptable for a few hours. If it is, use Unpublish with a reason. If not, ship "Hold" as drafted.
