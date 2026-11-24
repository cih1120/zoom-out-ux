# zoom-out-ux

**A skill that pulls an AI out of fixing inside the current screen.**

Ask an AI to fix a piece of UI and it will usually fix it right there: a better button, one more safeguard, a faster version of the same chore. Someone who knows the real context keeps pulling it back out: the problem started two steps earlier, this belongs to the whole app, users already have a word for that, the explanation goes next to the control, why do this at all.

`zoom-out-ux` makes the AI do that pull itself, before it proposes, and again when it reviews a proposal. It returns two solutions side by side: the best fix within today's constraints, naming the constraint and who owns it, and the solution once the question is changed, with what it needs and what it costs.

## The five moves

| Move | The question | Fires when |
|---|---|---|
| **Earlier** | At which step did this problem become unavoidable? Who should have known what, when? | The fix moves from the moment the user is blocked to the moment they make the choice. |
| **Wider** | Does this belong to this page, or to every page that asks the same question? | One app-level element or one policy replaces a set of per-page copies. |
| **Familiar** | Does the user already have a verb, concept or control for this? | A new action name or state gives way to one users already know. |
| **In place** | Is the action on the thing it acts on, and the explanation beside the control when it matters? | A hub page, a crowded bar or a help page collapses back into its context, a control moves to the level it changes, or a label says what its explanation said. |
| **Different question** | Is the ask itself right? | "How do we do this faster" turns into "why do this at all". |

And one counter-move, **Zoom back in**: a changed question is not a license for a bigger feature set. Good reframes usually remove things.

## Nine smells

Signals that the work is still inside the frame: **placement shopping** (every option is "where to put it"), **third copy** (the same control needs a third home, or one page says the same thing a third time), **escape hatch** (an exit designed at the moment of being blocked), **prevented, not told** (a control disabled or locked with no word on which rule or what would unlock it), **guardrail stacking** (each risk gets one more safeguard), **explainer** (a help page or a tooltip defining a label is being added), **new verb** (a new name for something users already do), **faster chore** (a recurring task made faster, not questioned), **status words** (result states, counts or truncated paths instead of the relationship users ask about). Each one points at the move to try first. See [`skills/zoom-out-ux/SKILL.md`](skills/zoom-out-ux/SKILL.md).

## Before / after

Two of the seven worked cases, in short. The full versions, with what was proposed first and the sentence that changed it, are in [`references/cases.md`](skills/zoom-out-ux/references/cases.md).

**Expense reporting, one flagged line freezes the whole report.** A policy-exception flag sends the report to finance review for days, and approvers only find out after picking the flag type.
*Inside the screen:* add "Release unflagged lines" to the report toolbar.
*Zoomed out (Earlier, Familiar, In place):* show the consequence in the flag picker, at the moment of choosing; meanwhile reuse the verb approvers already have, "Split off this line", on the line itself. Both solutions are kept: the local fix is bounded by the finance rule, and the reframed one names what the picker has to carry.

**Personal finance app, logging an expense.** A log button on the home screen; then the budget page and the category page needed one; the options were "a button on each page / a docked entry sheet / only from home".
*Inside the screen:* a button on each page, which ended up as four placements with four looks.
*Zoomed out (Wider):* one floating log control on every page where a new expense makes sense. The placement question disappears with it.

## Does it work?

`evals/` holds nine scenarios whose problems the cases never touch; only scenario 9 shares a domain, the restaurant of case 5. Each is run in a fresh session with and without the skill. The outputs are recorded as they came back, under `evals/results/`, and judged one criterion at a time against a five-check rubric. See [`evals/scenarios.md`](evals/scenarios.md) for the prompts and [`evals/results/README.md`](evals/results/README.md) for the scorecard.

## Install

Claude Code:

```text
/plugin marketplace add cih1120/zoom-out-ux
/plugin install zoom-out-ux@zoom-out-ux
```

Any other agent runtime that reads `SKILL.md` folders: copy `skills/zoom-out-ux/` into your skills directory, or

```text
npx skills add cih1120/zoom-out-ux
```

The skill uses no tool specific to one runtime.

## When it triggers

On its own, when the AI is about to propose a UI or flow change where a user gets blocked, a control needs a home, a rule or status needs explaining, a recurring chore needs speeding up, or a new concept is about to appear. By name, to review a proposal: "zoom out on this".

It is not a visual-craft skill. Layout, typography, color, motion and copy polish belong to a design-craft skill such as [impeccable](https://github.com/pbakaus/impeccable) or to your own design guidelines. `zoom-out-ux` runs before craft, on the framing of the problem.

## Where it comes from

Patterns collected from product work where first drafts kept fixing inside the screen and reviews kept pulling them out. The cases are composites written in invented domains; no product described there exists.

## License

[MIT](LICENSE)
