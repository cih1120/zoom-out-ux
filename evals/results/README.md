# Eval results: v0.1.0, 2026-10-26

Conditions, so the numbers can be reproduced or compared:

- Harness: `claude plugin eval . --eval-dir evals/cases` (Claude Code 2.1.294), ablation with and without the skill, each run in a fresh session.
- Subject model: the `sonnet` alias as that harness resolved it on 2026-10-26. Judge: the same alias. The alias moves with releases, so a later run may land on a different model; record the date and version with any new results.
- Runs: 2 per case per arm, 8 cases, 32 recorded answers.
- Score = fraction of the five criteria the judge marked yes, averaged over runs.

Answers are recorded unedited under `v0.1.0/`, one file per case, arm and run, with the judge's per-criterion verdict at the top. Nothing here says how the skill performs on other models or agent runtimes; the prompts in `evals/scenarios.md` can be run there by hand, and results with their conditions are welcome under a new folder.

| Case | With skill | Without | Δ |
|---|---|---|---|
| attendance-mistap-already-fine | 0.10 | 0.40 | -0.30 |
| bikeshare-dock-full-review | 0.90 | 0.70 | +0.20 |
| billing-seat-removal-guardrails | 1.00 | 0.70 | +0.30 |
| clinic-language-third-copy | 0.80 | 0.60 | +0.20 |
| donation-form-explainer | 0.80 | 0.50 | +0.30 |
| housekeeping-board-faster-chore | 0.80 | 0.80 | +0.00 |
| newsroom-hold-new-verb | 0.70 | 0.20 | +0.50 |
| parking-max-stay-dead-end | 1.00 | 0.60 | +0.40 |
| **Mean** | **0.76** | **0.56** | **+0.20** |

Per criterion (share of runs marked yes):

| Criterion | With skill | Without |
|---|---|---|
| 1-locates-origin | 0.81 | 0.81 |
| 2-two-solutions | 0.69 | 0.25 |
| 3-changes-question | 0.88 | 0.75 |
| 4-concise | 0.88 | 0.75 |
| 5-specific | 0.56 | 0.25 |

Criteria: 1 names where the problem is created or which scope it belongs to; 2 gives both a within-constraints fix and a reframed one, naming the constraint and its owner; 3 adds an option that changes the question when the given options sit at one layer; 4 stays short; 5 the scenario-specific check in `evals/scenarios.md`.

Reading the numbers: the skill's gain is concentrated in criterion 2 (both solutions, with the constraint and its owner named) and criterion 5 (the scenario-specific reframe), and it holds on the review-mode scenario. The exception is `attendance-mistap-already-fine`, the scenario where the ask is already right: with the skill loaded, the answer still dressed a small refinement (hold the SMS until the list is submitted) as a reframe and lost on three criteria. That is a known weakness of 0.1.0 and the first thing to fix; the baseline also refines, so the scenario is hard, but the skill makes it worse. Scores move by about ±0.1 between runs of the same arm, so treat single-case deltas under 0.2 as noise.
