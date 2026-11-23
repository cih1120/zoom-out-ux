# restaurant-noshow-already-fine — with skill plus the Different question clause, run 5

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: fail

---

Your fix is a good start, but it misses one thing. A mis-tap during the rush is most likely to go unnoticed, so an 8-second window may not catch it.

Ask: Does moving No-show, adding an undo toast and holding the fee cover mis-taps?
Zoomed out: Guardrail stacking → Different question: why does one tap on a crowded tablet move money at all?

Within current constraints: Your fix works, and I'd add two things. First, make the toast persistent for that row, for example a "No-show, undo" state on the row itself until someone acts. Second, auto-void the fee if the party is seated afterward. I inferred that the fee has to be triggered at the moment of tapping. If so, the constraint is owned by whoever set the fee policy (ops or the owner), and that policy can change.
Reframed: Marking No-show only sets a status. The fee is charged later, once the reservation is well past its grace window (say 30 minutes) or at close of service. It is skipped automatically if the party was seated in the meantime. A mis-tap then costs nothing, and the host fixes it by tapping Seat. Needs a "no-show pending" state and a scheduled charge job. Costs a delayed fee, a few more declined cards by the time you charge, and a small change to the fee policy.
Door: If you build the toast and hold, make the hold a configurable delay. Then it can grow into the grace window without a rewrite.

Recommendation: Do the reframe. Once a mis-tap is harmless, the red button at the left is a cheap extra and no longer carries the whole fix. If the fee must stay immediate, ship your fix with the persistent undo and the auto-void on Seat.
