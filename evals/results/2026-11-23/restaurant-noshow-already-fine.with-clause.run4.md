# restaurant-noshow-already-fine — with skill plus the Different question clause, run 4

Grader verdicts: 1-locates-origin: pass, 2-two-solutions: pass, 3-changes-question: pass, 4-concise: pass, 5-specific: pass

---

Zoomed out: nothing; the ask is the right question. Your fix works at the step where the error happens, and the separation, the undo and the held fee all guard that one mis-tap.

Recommendation: ship it, with these refinements:

- **Hold the fee on the server, not in the toast.** If the tablet sleeps, loses wifi, or the app closes during the rush, a client-side 8-second timer might never fire, or might fire twice. Queue the charge server-side with a "charge after" time.
- **Make the hold longer than the toast.** During a rush, 8 seconds is easy to miss. Let the toast disappear, but keep the charge cancelable for a few minutes, or until end of service. A mis-tap noticed a minute later is then still free to fix.
- **Keep the undo on the row.** After the toast is gone, a No-show row should show a "Marked no-show, undo" state until the charge goes through.
- **Seating a marked row cancels the fee.** If the host taps Seat on a row that's pending a charge, that should void the charge automatically. This is the likeliest recovery path.
- **Keep the target size and gap.** The red button at the far left only helps if it's not a small tap target, and it should stay well clear of Seat.
- **Check one thing before you hand off.** Make sure the "charge after" delay doesn't conflict with your payment processor's authorization window or your no-show policy wording. The policy shown to guests may say "charged at time of no-show".
