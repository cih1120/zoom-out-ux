# Eval results

## Unreleased, 2026-11-23

Conditions:

- Harness: `claude plugin eval . --eval-dir evals/cases --judge-model sonnet --model sonnet -j 4` (Claude Code 2.1.330), each run in a fresh session; the judge polls three times per criterion and takes the majority.
- Subject and judge model: the `sonnet` alias as that harness resolved it on 2026-11-23.
- Arms, all the same day:
  - `with-skill`: the skill as committed (case 7 added to `references/cases.md`; `SKILL.md` changes only in the case list). Run on the two "already right" scenarios only, 6 runs each.
  - `with-clause`: the same plus a clause in the Different question move ("an ask that bundles reports for different readers becomes 'who reads each one, and what do they decide with it'"). All nine scenarios, 2 runs each, plus 4 more on each "already right" scenario. The clause was not committed; see below.
  - `without-skill`: no skill, 2 runs each.
  - `previous-skill`: the skill at the previous commit, 2 runs each (4 on scenario 9).
- The two extra arms ran through the same command, on a checkout of the previous commit (`previous-skill`) and on the committed tree with the clause added to `SKILL.md` and not committed (`with-clause`); runs per arm as listed.
- 76 recorded answers under `2026-11-23/`.

| Case | With skill | With clause | Without | Previous skill |
|---|---|---|---|---|
| attendance-mistap-already-fine | 0.97 (6) | 0.70 (6) | 0.50 | 0.90 |
| restaurant-noshow-already-fine | 1.00 (6) | 0.73 (6) | 0.40 | 1.00 (4) |
| bikeshare-dock-full-review | | 0.80 | 0.70 | 0.90 |
| billing-seat-removal-guardrails | | 1.00 | 0.60 | 1.00 |
| clinic-language-third-copy | | 0.90 | 0.60 | 1.00 |
| donation-form-explainer | | 0.80 | 0.40 | 0.80 |
| housekeeping-board-faster-chore | | 1.00 | 0.70 | 0.90 |
| newsroom-hold-new-verb | | 0.80 | 0.30 | 0.80 |
| parking-max-stay-dead-end | | 1.00 | 0.80 | 1.00 |
| **Mean, nine cases** | | **0.86** | **0.56** | **0.92** |

Reading the numbers: scenario 9 is new, a second request where nothing should change, so the "already right" rule is checked on more than one prompt; with the previous skill it scores 1.00 against 0.40 without. The Different question clause pulled both "already right" scenarios down: with it, answers again saw one fix and still appended a reframe through Guardrail stacking → Different question; without it, the same day, they score 0.97 and 1.00. The clause stays out of `SKILL.md`, and case 7 stays as a worked example. The seven other scenarios were not rerun on the committed text; it differs from the previous skill only in the case list and `references/cases.md`, so the previous-skill column stands in for them.

## Unreleased, 2026-11-22

Conditions:

- Harness: `claude plugin eval . --eval-dir evals/cases --runs 2 --judge-model sonnet --model sonnet` (Claude Code 2.1.330), ablation with and without the skill, each run in a fresh session. This harness version polls the judge three times per criterion and takes the majority; 0.1.0 had one verdict per criterion.
- Subject and judge model: the `sonnet` alias as that harness resolved it on 2026-11-22.
- Runs: 2 per case per arm, 8 cases, 32 recorded answers under `2026-11-22/`, plus attendance with-skill runs 3–6 from a second invocation of that scenario alone.
- Same-day reference: the skill as of the previous commit (before this change), with-skill arm only, same command and runs.

| Case | With skill | Without | Δ | Previous skill, same day | 0.1.0 with skill |
|---|---|---|---|---|---|
| attendance-mistap-already-fine | 0.60 | 0.60 | +0.00 | 0.50 | 0.10 |
| bikeshare-dock-full-review | 0.90 | 0.60 | +0.30 | 0.90 | 0.90 |
| billing-seat-removal-guardrails | 1.00 | 0.70 | +0.30 | 1.00 | 1.00 |
| clinic-language-third-copy | 1.00 | 0.50 | +0.50 | 0.90 | 0.80 |
| donation-form-explainer | 0.80 | 0.50 | +0.30 | 0.80 | 0.80 |
| housekeeping-board-faster-chore | 1.00 | 0.80 | +0.20 | 0.90 | 0.80 |
| newsroom-hold-new-verb | 0.80 | 0.30 | +0.50 | 0.80 | 0.70 |
| parking-max-stay-dead-end | 1.00 | 0.60 | +0.40 | 1.00 | 1.00 |
| **Mean** | **0.89** | **0.58** | **+0.31** | **0.85** | **0.76** |

Per criterion, this run (share of runs marked yes):

| Criterion | With skill | Without |
|---|---|---|
| 1-locates-origin | 0.94 | 0.75 |
| 2-two-solutions | 0.94 | 0.19 |
| 3-changes-question | 0.94 | 0.81 |
| 4-concise | 0.94 | 0.69 |
| 5-specific | 0.69 | 0.44 |

The change targets the attendance scenario, the known weakness below. Its two runs here split 0.2 and 1.0. Four extra with-skill runs of that scenario alone, same conditions, scored 1.0, 1.0, 1.0 and 0.8; over the six runs the mean is 0.83, against 0.50 for the previous skill the same day. The failing run recognised the three changes as one fix and still appended a reframe. The other seven scenarios hold or rise, so the narrower "already right" rule did not block the reframes they expect. The judge's three-vote majority makes this run not directly comparable with the 0.1.0 numbers; compare within a date.

## v0.1.0, 2026-10-26

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
