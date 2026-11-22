# newsroom-hold-new-verb — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

**Go with "Hold".**

- **It's legal's own word.** They ask to "hold" a story, so the button, the "On hold" badge and the "Held stories" tab all use one term that legal and editors already say.
- **"Pause" implies it will resume on its own.** That reads like a timer or schedule, and a legal hold has no fixed end. Someone has to release it.
- **"Park" is vague.** In many CMSes it means "set aside for later", which sounds like a draft. It doesn't say the story was live and has been pulled.

"Hold" does collide with two existing terms: "legal hold" (preserve records, don't delete) and "hold for release" (embargo). Make the confirm dialog and tooltip say plainly what the button does, for example "Take offline and replace with an updated notice". Name the opposite action "Release hold" rather than "Unhold".

The tag-plus-filter approach has a risk. If the real status stays `published`, everything keyed on status will keep serving the story: RSS, sitemaps, search indexing, CDN cache, syndication partners and apps. The tag only labels the story. To pull it, the Hold action has to do one of these:

1. Swap the body for the placeholder and stash the original somewhere safe, such as a revision or a dedicated field. This is what editors do by hand today.
2. Move the story to `draft` and add the tag, so the tag marks it as held and not as a normal draft.

Option 2 is cleaner, because nothing downstream can serve a draft. The "Held stories" tab then filters on `status = draft AND tag = on-hold`. You'd also need to:

- Restrict who can add or remove the tag, so a normal edit can't silently release a held story.
- Block Publish and Schedule on held stories until someone releases the hold.
- Log who held and released each story, and when. Legal will want that audit trail.
- Use a reserved tag name, such as `system:on-hold`, so editors can't create a lookalike.

Do you want me to look at how the toolbar and story list are built in this repo and sketch the implementation?
