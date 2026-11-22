# attendance-mistap-already-fine — with skill, run 6 (extra run, this scenario alone)

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Zoomed out: nothing; the ask is the right question. All three parts of your fix act on one error, the Late/Absent mis-tap, at the moment it happens, so they count as one fix.

Recommendation: Ship the gap and the outlined style, but change the undo. A per-row toast is the weak part, because a teacher moving fast down 30 rows will stack toasts, and a 5-second window can pass unnoticed on a loud bus. Hold the SMS until the teacher taps a "Done / Submit attendance" step instead, or until a fixed window such as 2 minutes after the last change. Until then, any row can be changed with one tap and nothing has gone out. The toast then isn't needed, or can shrink to a plain confirmation. It also covers a mis-tap that gets noticed 10 seconds later, which the toast doesn't. Two small additions:
- Make the targets at least 44 px tall, since the gap only helps if the targets are also big.
- Put Absent where it's hard to hit by accident, for example not directly next to Late. Outlining it already helps with this.
