---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Quick one. Teachers take attendance on their phones: a list of students, each row has three tap targets, Present / Late / Absent, and Present is the default. Problem reported by two schools: teachers mis-tap Absent when they meant Late, because the two buttons sit 8 px apart on the right edge and the bus is loud and they're in a hurry. An absent mark triggers an automatic SMS to the parent, so the mistake is embarrassing. My fix: widen the gap to 16 px, make Absent a distinct outlined style instead of filled, and show a 5-second "Marked absent, undo" toast that also delays the SMS until the toast is gone. Does that cover it, or am I missing something?
