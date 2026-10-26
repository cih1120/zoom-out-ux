# newsroom-hold-new-verb — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

**Use "Hold".**

- **It's a plain verb, like the neighbors.** Publish, Unpublish and Schedule are all plain verbs, and "Hold" and "On hold" use the same word for the action and the state. Legal will probably say "put a hold on it" anyway.
- **"Park" is jargon.** It's ambiguous: it could mean parking a draft for later, not pulling a live story.
- **"Pause" suggests it resumes by itself.** People will expect a timer, and it blurs into Schedule.

The one downside is that "legal hold" already means preserving records for litigation. If your org uses that term formally, put a tooltip on the button, such as "Temporarily replace with an update notice", and keep the badge as "On hold". Ask legal whether the overlap bothers them.

The tag-plus-filter approach works, but these points decide whether it holds up:

1. **Decide what Hold does to the body.** The story stays `published`, so the public page needs the placeholder text. The original body must be stored somewhere safe, such as a dedicated field or revision, not just in the editor's clipboard. Restoring should be a single "Release" action that puts the stored body back.
2. **Make the tag system-managed.** If editors can add or remove it like any other tag, someone can strip it and the story looks normal while still showing the placeholder (or the reverse). Use a reserved tag that only the Hold and Release actions write, and hide it from the normal tag picker.
3. **Check what else reads the body.** Feeds, syndication partners, search indexes, newsletters and CDN caches all need to pick up the placeholder, and purge caches when you hold or release.
4. **Block conflicting actions while held.** Decide what Unpublish, Schedule and edits do on a held story. Editing the placeholder body would corrupt the stash, so I'd disable body edits until release.
5. **Log who held it and when.** Legal will likely want an audit trail and a "held since" column in the Held stories tab.

If you'd like, I can look at the article toolbar and story list code in this repo and sketch the implementation.
