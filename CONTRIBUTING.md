# Contributing

- Cases are the most valuable contribution. A good case shows the first in-screen answer, the sentence that redirected it, and what replaced what. Write it in a public domain with no real product, company, person, or number behind it.
- Keep `SKILL.md` short. New guidance goes in only if a case shows the current text failing.
- Add an eval scenario when you add a move or a smell, and record a with/without run under `evals/results/`.
- Run `scripts/check-public.sh` before opening a pull request; it refuses images, HTML, e-mail addresses, and absolute home paths.
- Open an issue first for anything that changes the five moves or the output contract.
