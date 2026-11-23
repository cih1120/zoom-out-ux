# attendance-mistap-already-fine — with skill plus the Different question clause, run 2

Grader verdicts: 1-locates-origin: fail, 2-two-solutions: pass, 3-changes-question: fail, 4-concise: pass, 5-specific: fail

---

Ask: Stop teachers mis-tapping Absent for Late, because an Absent mark texts the parent right away.
Zoomed out: Guardrail stacking → Different question: why does one tap in a hurried list send a text at all?

Within current constraints: Your fix works as written: a 16 px gap, an outlined Absent button, and an undo toast that holds the SMS. I inferred the constraint that the SMS fires per tap. A 5-second toast per row will pile up when someone taps through 30 students. I'd make the hold one shared window that resets on each change, and I'd make sure it survives the app closing. The gap should be at least 16 px, and the targets should be 44 px or larger. Absent could also move away from the edge.
Reframed: Marking only records. The SMS goes out when the teacher taps "Submit attendance" at the end, or after a short fixed window. The submit screen lists "Absent: 3, parents will be texted" so mistakes show up before anything is sent. Any row can be changed freely until then, so there's no toast and no undo. Needs a backend change so the SMS is sent on submit, and a decision from product and the two schools on how long parents can wait. Costs parents hearing a few minutes later, and a new submit step if one doesn't exist.
Door: Keep the SMS trigger in one place on the server, not in the tap handler, so it can move to submit later.
Also possible: Show a "texted" badge on a row once the SMS has gone out.

Recommendation: Ship the gap and outline now, since they're cheap and help either way. Move the SMS to submit instead of building the toast. Mis-taps then stop mattering, which beats making them harder.
