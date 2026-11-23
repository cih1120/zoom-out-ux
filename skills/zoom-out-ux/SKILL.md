---
name: zoom-out-ux
description: Reframes a UI or flow problem before solving it, then returns a constrained fix and a reframed one side by side. Use before proposing a UI or flow change when a user gets blocked and needs a way out, a control needs a home on yet another screen, safeguards are stacking on one model, a rule or status needs a help page, a recurring chore is to be made faster, or a new action name is about to be invented; and when reviewing someone's UI proposal or asked to zoom out on one. Not for visual craft, layout, typography, copy polish, or backend-only work.
---

# Zoom out before you design

Asked to fix a screen, the default instinct is to solve it inside the screen as shown and to treat the ask as fixed. The options that come out are variants of one question ("put it here or there"), safeguards pile onto a model nobody questioned, and a chore gets faster instead of disappearing. Pull the work back out before proposing, and again when reviewing a proposal: the problem may have started two steps earlier, belong to the whole app, already have a word users use, belong next to the control, or not need doing at all. The reframe is cheapest before anything is built.

## Smells

A smell means the work is still inside the frame. Check the draft (yours or the one under review) against each; a hit names the move to try first.

- **Placement shopping**: every option answers "where does it go". Try Wider, then Different question.
- **Third copy**: the same control, logic or wording needs a home on a third screen, or one screen states the same thing a third time (as a control, a chip and a sentence). Lay the copies side by side, then try Wider across screens, In place on one.
- **Escape hatch**: the design adds a way out at the moment the user is blocked. Try Earlier.
- **Prevented, not told**: the control is disabled, hidden or mutually locked so a rule can't be broken, and the user can't tell which rule or what would satisfy it. Try In place.
- **Guardrail stacking**: each risk of the chosen model earns one more safeguard (bigger label, removable chip, extra confirm). Try Different question. Safeguards that all sit on one error, at the step where it is made, are one fix, not a stack: check When nothing changes first.
- **Explainer**: a help page, long helper text, a tooltip defining a label, a tour, a "don't show again". Try In place.
- **New verb**: a new action name for something users already do. Try Familiar.
- **Faster chore**: a recurring manual task gets optimized without asking why it recurs. Try Different question.
- **Status words**: the screen labels a result state ("visible", "hidden") instead of answering the relationship the user asks about ("where does this appear"), or answers it with a count or a truncated path ("manages 2", "… 3 levels …"). Try Different question.

## Five moves

Ask all five, one question each. Most come back empty; one or two change the answer.

- **Earlier**: at which step of the flow did this problem become unavoidable, and who should have known what at that moment? It fires when the fix moves from the moment the user is blocked to the moment they make the choice, with the consequence shown there.
- **Wider**: does this belong to this page, or to every page that asks the same question? It fires when one app-level element, shared panel or single policy replaces a set of per-page copies.
- **Familiar**: does the user already have a verb, concept or control for this? It fires when a new action name, state or screen gives way to one users already know and use.
- **In place**: is the action on the thing it acts on (the page, a panel, the table, a row), and the explanation beside the control at the moment it matters? It fires when a hub page, a crowded action bar, a help page or a dismissible tip collapses back into the context it was pulled out of, a control moves to the level whose state it changes, or an explanation shrinks or goes because the label now says it.
- **Different question**: is the ask itself right? It fires when "how do we do this faster" becomes "why do this at all", "how long should it remember" becomes "why remember", or "how do we work around a read-only object" becomes "which operations are actually restricted"; the safeguards stacked on the old premise fall with it. Keep the real restriction; remove the model that extends it to unrelated actions. If the model is already correct and only a button is missing, fix the button; that is not a reframe.

## What to produce

A block of about 200 words, one sentence per line; the reasoning stays in your head and only the conclusions land on the page. Give both solutions, because the person deciding needs the local fix, its constraint and owner, and the cost of the reframe in view at once. When reviewing someone's proposal, that proposal is the within-constraints line and its constraint is inferred (say so), and the review adds the rest, unless When nothing changes holds. A rule the user's team set earlier is a constraint too: name that team as its owner and say the rule can change. Unrelated asks in one request get one block each; asks that share a zoomed-out question share one. Details the user will ask for next (field rules, edge cases, build order) wait for the next turn.

```
Ask: <the question as given>
Zoomed out: <smell> → <move>: <the changed question>   (one or two lines)

Within current constraints: <best local fix>. Bounded by <rule / data / permission / date>, owned by <who>; or "no hard constraint".
Reframed: <the solution once the question changes>. Needs <what has to change, if anything>. Costs <cost>.
Door: <only if the local fix would make the reframe harder: what keeps it open>
Also possible: <only if the reframe opened extras you are leaving out>

Recommendation: <which one, in one or two sentences>
```

## Zoom back in (the counter-move)

Zooming out changes the question; it leaves the size of the deliverable where the user put it. Once the question changes, cut the answer back to what was asked. Features the reframe makes possible (queues, logs, versions, admin options) go on a separate "also possible" line, outside the proposal. A good reframe usually removes things: columns, safeguards, copies of a control. When the reframed design comes out larger than the original, zoom back in before presenting it. After moving something, ask whether it needs to exist at all; the new home often covers it already.

## When nothing changes

When the user's fix works on a model that is already correct, at the step where the error is made (not only where it surfaces), the ask is the right question; several safeguards on that one error are one fix. The same holds when all five moves come back empty, or what they find only refines that fix and keeps its model (a better moment, a bigger target; holding a consequence the fix already delays until a later step is a better moment). The block then shrinks to two lines: `Zoomed out: nothing; the ask is the right question.` and the recommendation, with the refinement inside it. A refinement dressed up as a reframe costs the reader trust on the day a real one arrives.

## Worked cases

`references/cases.md` holds seven cases, each traced from the ask through the redirect to what replaced what. Read it when you want to see a move applied end to end, or when a smell is present but you can't name the zoomed-out question.

1. Report frozen by a flagged line (expense reporting): Earlier, Familiar, In place; Escape hatch, New verb; the two-solution output under a finance rule.
2. Logging from every screen (personal finance app): Wider, Different question; Placement shopping, Third copy.
3. Remembering the serving size (recipe app): Different question, In place; Guardrail stacking, Explainer.
4. Who receives this notice (residents' community app): Different question, Wider, In place; Status words, Third copy.
5. Printing menus and specials (restaurant admin): Different question, Wider, Earlier; Faster chore, then the counter-move Zoom back in.
6. Saying it three times on one page (library staff app): Different question, In place, then Zoom back in; Third copy, Placement shopping, Explainer.
7. A car's history or a day's log (garage workshop app): Different question, Wider, In place, then Zoom back in; no smell fired.
