# newsroom-hold-new-verb — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

**Use "Hold".**

- **Hold** is a verb editors already use ("hold the story"). It implies temporary and reversible, and it pairs naturally with the badge ("On hold") and the tab ("Held stories"). The three labels read consistently.
- **Pause** suggests something that resumes automatically, like a scheduled post. Nobody expects a legal review to end on a timer, and it would sit confusingly next to Schedule.
- **Park** is vague. It could mean shelving a draft for later, not pulling a live story.

One caveat is that "legal hold" means preserving records for litigation. Check with legal that "Hold" won't make them think the action does that. If it might, "Pause" is the fallback. I'd still ship Hold and use the tooltip "Temporarily pull this story from the site".

**Risks of the tag-plus-filter approach:**
- **Status.** Decide what status a held story has. If it stays `published`, the placeholder text could still go out through RSS, syndication, search and the API. If you move it to `draft`, it disappears from the site, which is probably what legal wants. In that case, store the previous status so "Release" can restore it.
- **Original body.** Keep it in a revision or a dedicated field, not in the tag. Release should restore it exactly.
- **Tag permissions.** Anyone who can edit tags could remove or fake the tag, so restrict it. Use a reserved tag name, such as `system:on-hold`, that the editor UI hides.
- **Other queries.** Make sure the "Held stories" filter and the badge check the same tag. Also exclude held stories from the normal Draft list so they aren't edited or republished by accident.
- **Audit trail.** Log who held and released each story, and when. Legal will probably ask for it.
- **Naming the undo.** Call it "Release" (or "Lift hold") rather than "Publish", so people don't confuse it with a fresh publish.

If you share the repo structure, I can look at the toolbar and story list code and sketch the implementation.
