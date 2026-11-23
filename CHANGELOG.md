# Changelog

All notable changes to this project are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project uses [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added

- Smell **Prevented, not told**: a control disabled, hidden or mutually locked with no word on which rule or what would satisfy it; try In place.
- `references/cases.md` case 6, saying it three times on one page (library staff app): Third copy on one page, a control moved to the level it changes, an explanation replaced by the label, and the zoom-back-in question "does it still need to exist".
- `references/cases.md` case 7, a car's history or a day's log (garage workshop app): two reports in one ask, told apart by what each reader decides; the object's history becomes a page about the object, reached from wherever it appears.
- Eval scenario 9, `restaurant-noshow-already-fine`: a second request where nothing should change, in another domain, so the "already right" rule is not tuned to scenario 8.

### Changed

- **When nothing changes**: a user's fix on a model that is already correct, at the step where the error is made, is the right question, and a refinement keeps the fix's model; holding a consequence the fix already delays until a later step counts as a better moment. Smell **Guardrail stacking** points there when the safeguards all sit on one error at the step where it is made. In review, the proposal is the within-constraints line unless this holds. Targets the Known attendance issue of 0.1.0; see `evals/results/README.md` (2026-11-22).
- Smell **Third copy** also covers one screen stating the same thing a third time (as a control, a chip and a sentence); on one screen, try In place.
- Smell **Explainer** also covers a tooltip defining a label.
- Move **In place** also fires when a control moves to the level whose state it changes (the page, a panel, the table, a row), and when an explanation shrinks or goes because the label now says it.
- Output: a rule the user's team set earlier is named with that team as owner and as changeable; unrelated asks in one request get one block each, asks that share a zoomed-out question share one.
- **Zoom back in**: after moving something, ask whether it needs to exist at all.
- Smell **Status words** also covers a relationship answered with a count or a truncated path ("manages 2", "… 3 levels …").
- Move **Different question** also fires when a read-only object is being worked around: ask which operations are actually restricted, keep that restriction, and drop the model that extends it to unrelated actions; a correct model missing one button is a fix, not a reframe.

## [0.1.0] - 2026-10-26

### Added

- `zoom-out-ux` skill: five zoom-out moves, eight smells, a two-solution output contract, and the zoom-back-in counter-lesson.
- `references/cases.md`: five worked cases in public domains.
- `evals/`: eight scenarios with a five-point rubric in the `claude plugin eval` format, plus recorded with/without-skill outputs and a scorecard.
- Claude Code plugin and marketplace manifests; MIT license.

### Known

- On a request that is already the right question, the skill tends to present a small refinement as a reframe (see `evals/results/README.md`, the attendance scenario).

[Unreleased]: https://github.com/cih1120/zoom-out-ux/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/cih1120/zoom-out-ux/releases/tag/v0.1.0
