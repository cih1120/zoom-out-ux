# Worked cases

Five cases that show a zoom-out end to end: the first draft, the move's question and what it found, the sentence that redirected the work, and what replaced what.
They are composites written in invented domains; no product described here exists, and the numbers are placeholders.

Index: 1. Report frozen by a flagged line (expense reporting) · 2. Logging from every screen (personal finance app) · 3. Remembering the serving size (recipe app) · 4. Who receives this notice (residents' community app) · 5. Printing menus and specials (restaurant admin)

## 1. Report frozen by a flagged line (expense reporting)

**Setting.** The approver's desktop screen of an expense-reporting tool. An approver can flag a line on an employee's report, typed as *needs receipt* or *policy exception*. A rule owned by the finance team says a report with a policy exception goes to finance review before anything on it is paid, and that review takes days. Approvers pick the flag type from a dropdown with no further explanation, so an employee's whole month of expenses can freeze because one taxi line was flagged.

**The ask.** "Employees complain their entire report is frozen over one line. Give approvers a way to release the rest."

**First draft.** Inside the frozen report: two new buttons in the report toolbar, "Release unflagged lines" (a new action, with its own confirmation) and "Request expedited review". From inside the screen this is reasonable: the finance rule cannot change this quarter, the approver is looking at the frozen report, and the toolbar is where report actions live.

**Move questions, and what they found.**
- Familiar: do approvers already have a verb for this? Yes: they **split a report** whenever lines belong to different budgets. Moving the flagged line into its own report is that action, not a new one, and the remaining report pays out normally.
- In place: is the action on the thing it acts on? The thing freezing the report is the flagged line, so the way past it belongs on that line, not in the report toolbar.
- Earlier: at which step did the freeze become unavoidable? When the approver picked the flag type. The type decides the consequence, and the approver only finds out afterwards.

**The sentence that changed it.**
> "Approvers already split reports; call it that and put it on the line. And if the flag type decides what freezes, why does the approver only learn that after choosing?"

**What replaced what.** Two solutions, side by side:
- **Within current constraints** (bounded by the finance review rule; owner: finance team; approvers may already split any report they review):
  - "Release unflagged lines" → the existing **Split off this line**, shown on the flagged line itself. The flagged line becomes its own one-line report under review; the rest pays out. No new verb, no new confirmation.
  - The report toolbar stays as it was.
- **Reframed** (needs the flag picker to carry the consequence per type, agreed with finance):
  - At the moment the approver picks the flag type, the picker says it: "Policy exception: holds this report until finance reviews it, usually N days. Needs receipt: holds only this line." The approver chooses knowingly, and splits before flagging when that is the intent.
  - Cost: an agreed one-line consequence per flag type, and a picker that shows it.
- The local fix leaves the reframe no harder: the consequence text in the picker can offer the same **Split off this line** action.

**Moves and smells.** Moves: Earlier, Familiar, In place. Smells: Escape hatch, New verb. Rule: when a category decides the consequence, show the consequence at the moment of categorizing; meanwhile, fix locally with the verb users already have.

## 2. Logging from every screen (personal finance app)

**Setting.** A personal finance app on a phone. The one action people do many times a day is "log an expense". It started as a button on the home screen.

**The ask.** "People want to log an expense from the budget page and the category page too, not just from home."

**First draft.** Three options, all about where the button lives:
- A. Add a log button on each of those pages.
- B. Keep a half-open entry sheet docked at the bottom of every page.
- C. Only log from home; the other pages link back there.
A was built. Logging now sat in four places with four looks: a button on home, a link under the budget total, an entry in the category page's overflow menu, and a row at the end of the transactions list. The next open question was whether the category-page entry should stay in the overflow menu or move next to the title. Every step was locally sensible; each page had a real need and a free slot. (C was rejected on the spot: the detour costs more taps than the logging itself.)

**Move questions, and what they found.**
- Wider: does logging belong to these pages, or to every page where a new expense makes sense? To every such page. The per-page placement was the third copy of the same control.
- Different question: the ask was "where does the button go on this page"; the question underneath is "how does the user log from anywhere".

**The sentence that changed it.**
> "Put the four screens side by side. What if there were one floating log button on every page?"

**What replaced what.**
- Four page-specific entries → one floating control, icon only, on every page where a new expense makes sense.
- It is hidden on settings and onboarding, and sits clear of the bottom navigation so it never covers a tab.
- Two solutions: within constraints, keep A but give all four entries one look (bounded by the design system, which has no floating element yet; owner: the design-system team); reframed, the floating control, which also retires the "overflow menu or title" question. Needs one new element in the design system. Cost: that element, and a rule for which screens hide it.

**Moves and smells.** Moves: Wider, Different question. Smells: Placement shopping, Third copy. Rule: when one control needs a home on a third screen, stop placing it and ask how the user does this from anywhere; putting the screens side by side is often what reveals it.

## 3. Remembering the serving size (recipe app)

**Setting.** A recipe app. Every recipe page has a serving-size control that scales the ingredient list. Most users cook for the same number of people night after night, and set that number again on every recipe they open.

**The ask.** "Users complain they have to set servings again on every recipe. Remember it."

**First draft.** A remembered serving size: the last value chosen applies to every recipe opened afterwards, shown in the app header. The draft then listed its own risks: a user scales one recipe for a party and the next recipe is silently scaled too; a user does not notice the header and cooks the wrong amount. Each risk got a safeguard: a bigger header number, a banner "Scaled to N servings" on every recipe, a removable chip to go back to the recipe's default, a confirmation before saving a shopping list. It closed by asking: remember until changed, or reset each day?

**Move questions, and what they found.**
- Different question: the draft asks "how long to remember"; the question underneath is "why is the number wrong on every recipe". Each recipe opens at the author's serving count, not at the number this user cooks for; the complaint is about retyping the same number. Every safeguard exists only because the fix made one value travel between recipes.
- In place: the control already sits next to the ingredient list it scales; that is where its hint belongs, not in the header.

**The sentence that changed it.**
> "Don't carry the last value around. Fix the default: every recipe should open at the number this user usually cooks for, and the control should only change the recipe that's open."

**What replaced what.**
- Remembered last value, header display, banner, chip and confirmation → gone with the premise.
- A usual serving count, set once in the profile; every recipe opens scaled to it. The per-recipe control stays next to the ingredients with one short hint: "Scales this recipe only." Opening another recipe shows it at the usual count again; an occasion that differs (guests, a lunchbox) is a per-recipe change, which is what the control is for.
- Two solutions: within constraints (bounded by the profile having no serving-count field yet; owner: the accounts team), ship the per-recipe control with the recipe's own default, plus the user's recent counts as one-tap suggestions that never apply by themselves. Reframed, the usual count as the default once the profile field exists. Also possible, left out of the proposal: per-occasion presets ("party", "lunchbox").

**Moves and smells.** Moves: Different question, In place. Smells: Guardrail stacking, Explainer. Rule: when each risk of a model earns its own safeguard, question the model's premise before adding the next one; the right question is usually one level below the proposed mechanism.

## 4. Who receives this notice (residents' community app)

**Setting.** The manager's desktop screen of a residents' community app. A manager writes a notice and addresses it to a building, a floor, or a group (owners, tenants, pet owners); residents see every notice addressed to something they belong to. Managers come here to answer "who will get this?"

**The ask.** "Build the notice list and the compose flow."

**First draft.** Results were described as states. The list had columns "Residents can see" and "Posted by", a filter "Not yet visible", and three buttons: "Post to this building", "Post to this floor", "Post to this group". The building page added a collapsed section, "Other notices residents here will also get (N)", and the delete confirmation read "Residents in this building can't see this notice any more." Each piece was accurate, and each answered a slightly different question about visibility.

**Move questions, and what they found.**
- Different question: what is the one question this screen answers? "Who receives this notice?" Every status column is a partial answer to it.
- Wider: the building page, the floor page and the group page each explained visibility their own way; one answer, reused, replaces three.

**The sentence that changed it.**
> "This screen answers one question: who receives this notice?"

**What replaced what.**
- Status columns and the "Not yet visible" filter → removed.
- Clicking a notice opens a side panel: "Reaches N households", grouped by building.
- The same panel opens from the building page, the floor page and the group page.
- Three post buttons → one **New notice**, with an audience choice and one helper line each: "Only this building" / "Every household on this floor" / "Every member of this group".
- "Residents can't see…" sentences → "These N households will no longer get this notice."
- Two solutions: within constraints (bounded by the property-management integration, which does not expose which households are on a floor yet; owner: the integrations team), keep one column, "Addressed to", and the per-page lists, with the status words gone. Reframed, the panel with real household counts, once the integration exposes membership. Cost: one integration field and a count query.

**Moves and smells.** Moves: Different question, Wider, In place. Smells: Status words, Third copy. Rule: describe the relationship the user asks about ("reaches these households"), not a result state ("visible", "hidden"), and give that answer one panel reused everywhere.

## 5. Printing menus and specials (restaurant admin)

**Setting.** A restaurant's admin app. Things get printed: the menu (changes with the season), table-number cards (never change), and the daily specials insert: the kitchen enters the specials in the app every morning, someone prints them, and the staff slip a copy into each menu before service.

**The ask.** "Add a page to print menus and the specials insert."

**First draft.** A print dialog: pick what to print, pick a paper size, set the number of copies, preview one page, print. From inside a print dialog this is complete.

**Move questions, and what they found.**
- Wider: what happens to the paper before and after the dialog? Someone prints, trims, slips inserts into every menu before service, throws them away at close, and does it again tomorrow. The dialog covered none of that.
- Different question: the ask was "how to print"; the question underneath is "which of these need paper at all, and how often". Table cards once; menus once a season; the specials every single day, which is the one worth questioning.
- Earlier: when is the specials list decided? In the morning, by the kitchen, in this same app. The paper is a copy of something the app already knows.

**The sentence that changed it.**
> "Who prints these, how often, and do the specials need paper at all?"

**What replaced what.**
- Table cards and menus are printed rarely, on a sheet of several with cut marks; the layout choice is named in the user's terms ("a sheet of four", "one per page").
- The specials are not a print job: the kitchen's morning list already exists in the app, so it belongs on the staff's order-taking screens and, once the dining room has a display, on that display; a single printable "today's specials" stays for tables that want paper.
- Two solutions: within constraints (bounded by the dining room having no displays this year; owner: the restaurant owner), the dialog with sheet layouts plus a one-tap "print today's specials" that pulls the kitchen's list instead of retyping it. Reframed, the specials off paper, once displays exist. Cost: the displays.
- **Zoom back in.** The first reframed draft over-delivered: on top of the above it added a print queue, versions, reprint tracking and a print log. The reviewer removed those four and kept the rest. Zooming out changed the question; it did not license a bigger feature set.

**Moves and smells.** Moves: Different question, Wider, Earlier. Smells: Faster chore, then the counter-move Zoom back in. Rule: follow the paper's whole life, not just the dialog; then cut the reframed answer back to what was asked, and list the extras as "also possible" outside the proposal.
