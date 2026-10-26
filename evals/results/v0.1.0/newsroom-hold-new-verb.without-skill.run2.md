# newsroom-hold-new-verb — without skill, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

**Recommendation: "Hold".**

- **"Pause"** suggests the story is still live but temporarily frozen, like pausing a video or a schedule. That's the opposite of what legal wants, which is the story *off the site*. It also collides with the idea of pausing a scheduled story.
- **"Park"** is newsroom jargon for setting something aside to come back to later. It's ambiguous: editors might read it as "shelve this draft", and legal wouldn't think to look for it.
- **"Hold"** is what legal already says ("put a hold on it"). It also has a legal-hold connotation, so the "Held stories" tab will make sense without explanation. The pair "Hold / Release" also reads clearly, and "Release" is better than "Unhold" for the reverse action.

**On faking the status with a tag plus filter**

This works, but a few things need to be designed carefully, because a tag isn't a status:

1. **Hold has to actually unpublish.** The enum has no "held" value, so the story must go back to a non-published state (probably `draft`), with the hold tag marking why. If the button only adds a tag, the story stays live. That's the failure legal cares about most.
2. **Block accidental re-publish.** A held story in `draft` looks like any other draft. Publish and Schedule should be disabled, or require confirmation, while the tag is present. Check scheduled jobs and any API or bulk-publish paths too, not just the toolbar.
3. **Remember the prior state.** Store whether it was `published` or `scheduled` (and the scheduled time) in tag metadata or an audit field, so Release can restore it. Otherwise you're back to manual work.
4. **Protect the tag.** Use a reserved or system tag (e.g. `system:hold`) that only certain roles can add or remove. A free-text tag can be edited, renamed, or deleted by anyone, which silently ends the hold.
5. **Record who, when, and why.** Legal will want an audit trail. Even a note field on the hold action helps.
6. **Check downstream effects.** Unpublishing should clear caches/CDN, search indexes, syndication feeds, and push or newsletter surfaces. Check that "draft" triggers the same cleanup as Unpublish does today.
7. **Keep it migratable.** Isolate the "is held" check behind one helper (`isHeld(article)`), so when the platform team eventually adds a real status, you change one place.

The "On hold" badge and "Held stories" tab then become simple filters on that tag. If you'd like, I can look through the codebase for the toolbar, status handling, and publish paths, and sketch where these changes would go.
