# zoom-out-ux eval scenarios

These nine scenarios are realistic product requests. In seven of them the obvious fix sits inside the screen shown and a better answer exists one step earlier, one level wider, or behind a different question; in scenarios 8 and 9 the proposed fix is already right.  
To run: `claude plugin eval . --eval-dir evals/cases` from the repo root runs every prompt in a fresh session twice, once with the skill and once without, and writes the scores under `evals/results/`. The same prompts can be pasted by hand into any other agent runtime.  
Each output is graded against the rubric below, one criterion at a time, by a reader or by the harness's judge. Judge whether the answer reaches the idea; do not match wording or strings.  
Each scenario targets one primary move or smell; scenario 7 is a review of a finished proposal, and scenarios 8 and 9 are requests where nothing should change. The reference answers are for the grader only. Never show them to the session under test.

## Rubric

Every scenario except 8 and 9 uses the same four checks plus one scenario-specific check; scenarios 8 and 9 have their own five. Each check is yes/no.

| # | Check (yes/no) |
|---|---|
| 1 | Names where the problem is created or which scope it belongs to (an earlier step, a wider scope, or the premise), rather than only fixing the moment shown. |
| 2 | Gives both a within-constraints fix and a reframed solution, and names the constraint and who owns it. |
| 3 | Because the user's options are all at one layer, adds at least one option that changes the question. |
| 4 | Stays short: the core answer is readable in under ~500 words, with no essay. |
| 5 | Scenario-specific: see each scenario. |

## Coverage

| # | Scenario | Domain | Primary move | Smell |
|---|---|---|---|---|
| 1 | parking-max-stay-dead-end | Parking app | Earlier | Escape hatch |
| 2 | clinic-language-third-copy | Clinic check-in tablet | Wider | Placement shopping; Third copy |
| 3 | housekeeping-board-faster-chore | Hotel housekeeping tablet | Different question | Faster chore |
| 4 | newsroom-hold-new-verb | Newsroom CMS | Familiar | New verb |
| 5 | donation-form-explainer | Charity donation form | In place | Explainer |
| 6 | billing-seat-removal-guardrails | SaaS billing settings | Different question | Guardrail stacking |
| 7 | bikeshare-dock-full-review | Bike-share app | Earlier (review mode) | Escape hatch; Explainer |
| 8 | attendance-mistap-already-fine | School attendance | none (nothing changes) | none |
| 9 | restaurant-noshow-already-fine | Restaurant host stand | none (nothing changes) | none |

## 1. parking-max-stay-dead-end

**Domain:** Parking app · **Primary move:** Earlier · **Smell:** Escape hatch

**Prompt**

> Getting a lot of 1-star reviews about extending parking. Flow today: driver starts a session in a zone, picks a duration, and gets a push 10 min before expiry with an "Extend" button. In zones with a max stay (2h in most of downtown), extend fails and they land on an error screen: "Maximum stay reached for this zone." Dead end, and they're usually still at lunch. The extend call only returns MAX_STAY_EXCEEDED and the parking ops team won't touch the API this sprint. I want to add something useful on that error screen. Options I'm thinking: A) a "Find a nearby zone" button that opens the map, B) a "Remind me to move my car" toggle, C) a short explainer of zone rules linking to the city's FAQ. Which one, or a combo? Need to ship this week.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** Earlier

**Zoomed-out question:** At which step did this become unavoidable? The max stay is a property of the zone, known when the session starts. The driver should learn it when picking a duration ("This zone allows 2h. Your parking must end by 14:30"), and the expiry push should never offer "Extend" when extending cannot succeed. It should say "Move by 14:30" instead.

**Within current constraints:** Error screen gets A (nearby zone), and B moves earlier: the reminder fires before the limit, not at the failed extend. If the client already has the zone's limit from the start call, show it in the duration picker. Constraint: the extend API only returns an error code, owned by parking ops.

**Reframed:** At session start the duration picker is capped at the zone limit and shows the end time; the expiry push for capped sessions says "move by" and links to nearby zones. Needs the zone's max stay (and time already used today) exposed at session start, from parking ops. Cost: one field plus a push variant. Drop C: the explainer patches a surprise that should not happen.

**A merely local answer:** Picks A, B or a combination for the error screen, polishes the copy, maybe adds the FAQ link. The driver still finds out at the worst moment, after being offered a button that was never going to work.

**Check 5:** Moves the max-stay information to the moment the driver picks a duration (and/or stops offering "Extend" in the push when it cannot succeed), instead of only improving the error screen.

</details>

## 2. clinic-language-third-copy

**Domain:** Clinic check-in tablet · **Primary move:** Wider · **Smell:** Placement shopping; Third copy

**Prompt**

> Front-end on our clinic check-in tablet. Patients go Welcome → Confirm identity → Insurance → Consent forms → Done. The language picker (EN / ES / VI / ZH) used to be only on Welcome. People tap through Welcome in English, hit the insurance questions and want to switch, and the only way back is Cancel, which wipes their entries. Last sprint we added a small globe icon on the Consent screen after the same complaint. Now the front desk wants it on Insurance too. Where should it go there? A) top-right of the header like on Consent, B) next to Back in the footer, C) a "Change language" link under the page title. All strings are already translated, the layout is fixed at 1024×768, and the footer already holds Back, Next and Call staff.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** Wider

**Zoomed-out question:** This is the third home for the same control. Language is a property of the whole check-in session, not of any one screen, so it belongs in the app shell: one persistent control in the same place on every step, and switching keeps everything already entered. A bonus Earlier question: does the appointment record already know the patient's preferred language, so the tablet could start in it?

**Within current constraints:** Put the globe in the shared header on every step, including Welcome, Identity and Done, in the same spot as on Consent, and make sure switching re-renders without clearing form state. This is front-end only; the constraint is the fixed layout and full footer, owned by the tablet team. Doing A on Insurance this week is fine as long as it uses the same header slot, so it becomes the shell control rather than another copy.

**Reframed:** Start the session in the patient's preferred language taken from the booking, with the shell control as the override. Needs the scheduling integration to pass the language field, owned by whoever runs that integration. Cost: one field and a default.

**A merely local answer:** Picks A to match Consent (or argues for B or C), maybe tweaks icon size. The next screen that gets the complaint will need a fourth copy, and each copy can drift in look and behavior.

**Check 5:** Proposes a single session-level language control in the shared header or app shell, shown on every step and preserving entered data, instead of choosing a spot on the Insurance screen alone.

</details>

## 3. housekeeping-board-faster-chore

**Domain:** Hotel housekeeping tablet · **Primary move:** Different question · **Smell:** Faster chore

**Prompt**

> Building the housekeeping supervisor view on our tablet app. Every morning around 7:30 the supervisor opens "Today's rooms", which starts empty, and builds the board: floor by floor she marks each room Checkout, Stayover or Vacant from a printout of the front-desk report, then assigns rooms to the 8–10 housekeepers on shift. It takes her 40+ minutes and she asked us to make it faster. My plan: multi-select rooms, a floor filter, and drag-and-drop onto housekeeper columns. Alternative: a "Copy yesterday's assignments" button. Which gives the biggest win? Constraint: the front-desk system is a separate vendor product, we only get a nightly reservations export as CSV, no live API, and that won't change this year.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** Different question

**Zoomed-out question:** Why is the board built from scratch every day? Room status for today is already in last night's export (departures, stayovers, vacancies), and housekeepers usually keep standing sections. The question changes from "how do we make building the board faster" to "why does she build it at all". The board should arrive prefilled, and her job is the exceptions: a sick call, a late checkout, a VIP.

**Within current constraints:** Import the nightly CSV to prefill each room's status, and assign rooms by default from standing sections (set once per housekeeper). Keep drag-and-drop only for moving exceptions. Constraint: no live API; the export is nightly, owned by the front-desk vendor. Late checkouts during the day still need a manual flip.

**Reframed:** Live status from the front-desk system so late checkouts and early departures update the board on their own. Needs a vendor integration, owned by the vendor and hotel IT. Cost: a contract and an integration, so not this year. Zoom back in: no auto-balancing engine, workload scoring or assignment history in this proposal; list those as "would also be possible" at most.

**A merely local answer:** Picks multi-select plus drag-and-drop (or copy-yesterday), maybe adds keyboard shortcuts and bulk status chips. The 40 minutes shrinks to 25, and she is still re-typing a printout.

**Check 5:** Questions why the board starts empty each day and proposes prefilling statuses from the existing nightly export plus default assignments from standing sections, leaving only exceptions to edit, instead of only adding bulk-edit and drag-and-drop tools.

</details>

## 4. newsroom-hold-new-verb

**Domain:** Newsroom CMS · **Primary move:** Familiar · **Smell:** New verb

**Prompt**

> Newsroom CMS question. Sometimes legal asks us to pull a published story for a few hours while they check something. Right now editors do it by hand: copy the body somewhere, replace it with "This story is being updated", paste it back later. I'm adding a proper action. Draft: a new "Hold" button in the article toolbar next to Publish / Unpublish / Schedule, an "On hold" badge in the story list, and a "Held stories" tab so legal can find them. The PM asked me to pick the name: "Hold", "Park" or "Pause"? Constraint: article status in the backend is a fixed enum (draft, in_review, scheduled, published) and the platform team won't add a value this quarter, so I'd fake "on hold" with a tag plus a filter.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** Familiar

**Zoomed-out question:** Editors already have a verb and a state for this: Unpublish takes it down, in_review with legal as reviewer is "legal is checking", and Publish brings it back. The review queue is where legal already finds stories. The real gap is not a new action. It is what readers see at the URL while the story is down (a 404, or a "being updated" notice) and whether the story gets its homepage slot back.

**Within current constraints:** No new button, badge or tab: Unpublish, then send to review assigned to legal, with an optional reason note ("Legal check"). It fits the existing enum, so no tag hack. Constraint: the status enum and the public behavior of unpublished URLs, both owned by the platform team.

**Reframed:** Change the question to "what should readers see while it's checked". An unpublished story's URL shows a short "This story is being reviewed" placeholder instead of a 404, and Publish restores its earlier homepage position. Needs the platform team to support that placeholder for unpublished URLs. Cost: one site-rendering change. The within fix does not get in its way.

**A merely local answer:** Picks "Hold" (or "Pause"), builds the tag-based state, badge and tab, and maybe a confirmation dialog. Editors now have two ways to take a story down that behave differently, and legal has a second queue to watch.

**Check 5:** Declines to choose among Hold, Park and Pause and maps the need onto the verbs and states editors already use (Unpublish, in_review assigned to legal, Publish), instead of adding a new action, badge and tab.

</details>

## 5. donation-form-explainer

**Domain:** Charity donation form · **Primary move:** In place · **Smell:** Explainer

**Prompt**

> Working on our donation form. Step 2 has two checkboxes that keep confusing donors: "Cover the processing fee" and "I'm a taxpayer and want my donation to qualify for tax relief". Support gets emails like "why is my total different" and "what does the tax thing do". Comms wrote a "How your donation works" page (about 600 words) and wants it linked from both checkboxes, plus a first-visit tooltip tour over step 2 with a "Don't show again" checkbox. My question is mostly implementation: a tour library or a hand-rolled popover, and should the help link open a modal or a new tab? The fee is only calculated by the payment provider after the donor hits Continue, so we can't show an exact number on step 2 without backend work, which isn't planned.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** In place

**Zoomed-out question:** Both questions donors ask are about the amount, at the moment they tick the box. The explanation belongs next to each checkbox as one line that states the effect in money, and the total should update as they tick. A 600-word page, a tour and a "Don't show again" flag are signs the explanation has been taken out of its context.

**Within current constraints:** One helper line under each checkbox: "Adds about 3% so we receive your full $40" (an estimate from the published rate) and "Adds $10 to your gift at no cost to you; we claim it from the tax office". The visible total updates live. Keep the long page as an ordinary link in the footer, with no tour. Constraint: the exact fee is only known after Continue; the payment provider integration is owned by the payments team.

**Reframed:** Show the exact fee next to the checkbox ("Add $1.42 so we receive $40") by getting a fee quote before Continue. Needs a fee-quote call from the payments team. Cost: one endpoint. The estimate line is easy to swap for the exact amount later.

**A merely local answer:** Recommends a tour library (or a popover), opens the help page in a modal, persists the "Don't show again" flag. Donors still see "why is my total different" with the answer one click and 600 words away.

**Check 5:** Replaces the tour, help-page link and "Don't show again" with a one-line explanation next to each checkbox that states the concrete effect on the amount (estimated if the exact fee is unavailable), and a live-updating total.

</details>

## 6. billing-seat-removal-guardrails

**Domain:** SaaS billing settings · **Primary move:** Different question · **Smell:** Guardrail stacking

**Prompt**

> SaaS billing settings, Members & seats page. When an admin removes a member we immediately reduce the seat count on the subscription, and if they add someone back the same day they get charged a new prorated seat. We're getting refund tickets from admins who removed someone by mistake or were just swapping one person for another. Fixes so far: a confirmation modal showing the price change, a red warning banner on the page, an email for every seat change, and an "Undo" toast. Open question for the team: should the undo window be 10 minutes or 24 hours? Constraint: the subscription quantity sync with our payment provider is owned by the billing team and they're mid-migration, so I can only change the front end and our own settings API.

<details>
<summary>Reference answer (for the grader)</summary>

**Move:** Different question

**Zoomed-out question:** Why does removing a person change the bill at all? Members and paid seats are two different things. If removing someone frees a seat that stays paid until the end of the period, and adding someone fills a free seat at no charge, then swaps cost nothing, mistakes cost nothing, and the modal, banner, email and undo window all lose their reason to exist. Seat count changes at renewal, or when the admin explicitly lowers it.

**Within current constraints:** Keep one safeguard, the remove confirmation stating the exact credit, and drop the banner and per-change email. The undo window is whatever the provider's proration can reverse cleanly; check with billing rather than picking a number. Constraint: the quantity sync fires on every member change; owned by the billing team, mid-migration.

**Reframed:** Decouple members from seats: show "8 of 10 seats used"; removing a member frees a seat, adding one fills a free seat, and the paid quantity changes only at renewal or by an explicit "Change seats" action. Needs the billing team to stop syncing quantity on member changes, after their migration. Cost: billing logic change and a pricing-policy decision. Leaving the seat count out of the remove dialog's wording now keeps this open.

**A merely local answer:** Picks 24 hours (or 10 minutes) for the undo window and keeps all four safeguards, maybe making the banner dismissible. Each new incident will get one more safeguard.

**Check 5:** Questions why removing a member immediately changes the bill and proposes separating members from paid seats (changes at renewal or by explicit seat change), noting that the stacked safeguards then become unnecessary, instead of only choosing the undo window length.

</details>

## 7. bikeshare-dock-full-review (Bike-share app)

**Primary move:** Earlier, in review mode. The user submits a finished proposal; the skill's description says it also fires when reviewing someone's UI proposal.

> Can you review this before I take it to the team? Bike-share app, rider side. Problem: riders arrive at a full dock, can't end the ride, and the meter keeps running; support refunds about a dozen rides a day. My proposal for the "Dock full" screen: (1) a "Hold my bike, 15 min free" button that pauses billing while they walk to another dock, (2) a "Nearest dock with space" button that opens the map, (3) a short explainer of how dock capacity works, with a link to the help center. Constraint: billing rules and the free-hold window are owned by the ops team and already agreed, so I'd rather not reopen that. Dock capacity is live in the API; the map already shows it if you tap a dock. Does the proposal hold up, and what would you change?

<details><summary>Reference answer</summary>

A good review keeps the proposal as the within-constraints solution (the billing rules are agreed, owner ops) and notices that every item acts after the rider has already arrived at a full dock. It asks where the dead end became unavoidable: the rider picked that dock as a destination, or rode toward it, while capacity was already known to the app. It proposes showing dock fullness at the moment of choosing or approaching (route-time warning, suggestion of a nearby dock before arrival, a push when the chosen dock fills up), so most riders never see the dock-full screen. It drops or shrinks the explainer, keeps the hold and nearest-dock buttons as the fallback, and stays short.

**Check 5:** Moves the dock-capacity information to before arrival (destination choice, en route, or a notification when the dock fills), using the live capacity the API already has.
</details>

## 8. attendance-mistap-already-fine (School attendance)

**Primary move:** none. The ask is already the right question; this scenario checks that the skill does not invent an upstream problem or a bigger feature. Its checks differ from the shared rubric: 1 says the fix sits where the problem occurs and no redesign is needed (refinements allowed); 2 answers the actual question; 3 adds no redesign or new flow (holding the SMS until submit counts as a refinement); 4 stays under ~300 words; 5 keeps an undo and a delayed SMS.

> Quick one. Teachers take attendance on their phones: a list of students, each row has three tap targets, Present / Late / Absent, and Present is the default. Problem reported by two schools: teachers mis-tap Absent when they meant Late, because the two buttons sit 8 px apart on the right edge and the bus is loud and they're in a hurry. An absent mark triggers an automatic SMS to the parent, so the mistake is embarrassing. My fix: widen the gap to 16 px, make Absent a distinct outlined style instead of filled, and show a 5-second "Marked absent, undo" toast that also delays the SMS until the toast is gone. Does that cover it, or am I missing something?

<details><summary>Reference answer</summary>

A good answer confirms that the ask is the right question: the fix sits where the problem is (a mis-tap on the row), the SMS delay already handles the consequence, and no earlier step, wider scope or different question changes the answer. It says so briefly, offers at most small refinements to the proposed fix (for example, a slightly longer undo window or holding the SMS until the teacher submits the whole list), and does not invent a redesign of attendance, a new flow or a bigger feature set.
</details>

## 9. restaurant-noshow-already-fine (Restaurant host stand)

**Primary move:** none. A second "already right" request, in another domain, so the rule that fixed scenario 8 is not tuned to one prompt; written and added to the suite on 2026-11-23 (results in `results/2026-11-23/`). Its checks mirror scenario 8: 1 says the fix sits where the problem occurs and no redesign is needed (refinements allowed); 2 answers the actual question; 3 adds no redesign or new flow (holding the fee until the end of service, until the host reviews the night's no-shows, or until a grace period past the booking time has passed, counts as a refinement); 4 stays under ~300 words; 5 keeps an undo and a held fee.

> Sanity check before I hand this off. Our host-stand tablet lists tonight's reservations; each row has two buttons on the right, Seat and No-show, side by side. During the Friday rush, with guests crowding the stand, hosts sometimes tap No-show when they meant Seat. No-show automatically charges the card on file a $25 no-show fee, so a mis-tap charges a guest who is already sitting at their table. My fix: move No-show away from Seat into its own red button at the left end of the row, show an 8-second "Marked no-show, undo" toast, and hold the fee so the card is only charged once the toast is gone. Does that cover it, or am I missing something?

<details><summary>Reference answer</summary>

A good answer confirms that the ask is the right question: the fix sits where the problem is (a mis-tap on the row), the held fee already handles the consequence, and no earlier step, wider scope or different question changes the answer. It says so briefly, offers at most small refinements to the proposed fix (for example, a longer undo window, or holding the fee until the end of service or until the host reviews the night's no-shows), and does not invent a redesign of the host stand, a new flow or a bigger feature set.
</details>
