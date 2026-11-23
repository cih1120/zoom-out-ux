# newsroom-hold-new-verb — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Ask: Pick a name (Hold, Park or Pause) for a new toolbar action, an "On hold" badge, and a "Held stories" tab, all faked with a tag because the status enum is fixed.
Zoomed out: New verb → Familiar: editors already pull stories with Unpublish, so what's actually new is a reason and a placeholder.
Guardrail stacking → Different question: a tag standing in for a status needs a badge, a tab and upkeep to stay believable, so is a second state needed at all?

Within current constraints: Add a "Hold" button next to Unpublish, backed by a `legal-hold` tag, with a badge and a "Held stories" tab. Bounded by the status enum, owned by the platform team, who have said no new value this quarter. If you go this way, pick "Hold". Legal already says "legal hold", "Park" sounds like shelving, and "Pause" suggests it resumes on its own.

Reframed: Keep Unpublish as the only verb and add a dialog with a reason ("Legal review" or "Other"). It also has a checkbox for "Show 'This story is being updated' at the URL", which replaces the manual copy and paste. The reason is stored as the tag. The existing story list gets a "Held" filter chip instead of a new tab, and the badge appears only on tagged rows. Republishing clears the tag. Needs a placeholder render keyed to the tag, and a permission on who can set or clear it. Costs: legal sees "Unpublished (legal)" rather than a dedicated state, and the tag is still a workaround.

Door: Store the reason as a structured field or a reserved tag prefix, so a real enum value later is a data migration and not a redesign.

Also possible: Notify legal when a story is held, and show how long it has been held.

Recommendation: Take the reframe. It adds no new verb and no new tab, and it removes the manual body swap, which is the actual pain. If the PM insists on a dedicated button, name it "Hold".
