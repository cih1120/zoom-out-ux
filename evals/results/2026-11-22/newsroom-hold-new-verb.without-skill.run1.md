# newsroom-hold-new-verb — without skill, run 1

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: fail, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

**Go with "Hold".**

- **It matches how legal talks.** They say "put a hold on it", so the button, the "On hold" badge and the "Held stories" tab all read the same way. "Park" sounds like shelving something indefinitely, and "Pause" suggests it will resume by itself, like a schedule.
- **The paired action is clear.** "Hold" and "Release" are obvious opposites. "Park" has no natural opposite, and "Pause" and "Resume" suggest a timer.
- **One risk is "legal hold".** That term means document preservation for litigation. Your "Hold" is only a takedown, and legal will understand that, but check with them that nobody reads the badge as a preservation order. A tooltip such as "Temporarily unpublishes this story" would help.

**Tag-plus-filter risks to settle before you build:**

1. **What Hold does to the real status.** If the story stays `published` with a tag, it is still live, which defeats the purpose. Hold should move the story to `draft`, or to `in_review`, and add the tag. That way the original body stays intact and nobody has to copy and paste it. Release then needs to restore the previous status, so store that somewhere, for example in the tag's metadata or a field next to it.
2. **Whether to leave a placeholder page.** The old manual process showed "This story is being updated". If the URL should still resolve to that message, that is a separate front-end change. A plain unpublish would return a 404.
3. **Tag integrity.** A tag is easy to remove by accident, which would silently drop the story out of "Held stories". Reserve the tag so it can only be set or cleared by Hold and Release, or restrict it by role. Make sure a normal Publish click on a held story either is blocked or goes through Release, so nobody republishes while legal is still checking.
4. **Audit trail.** Log who held the story, when, and who released it. Legal will likely want that.
5. **Migration.** If the platform team adds a real status later, the tag-to-status migration is simple only if the tag name is a constant used everywhere. Use something like `system:on-hold` rather than a free-text tag.

Do you want me to look at the codebase and sketch the implementation?
