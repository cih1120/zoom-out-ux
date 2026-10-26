---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Can you review this before I take it to the team? Bike-share app, rider side. Problem: riders arrive at a full dock, can't end the ride, and the meter keeps running; support refunds about a dozen rides a day. My proposal for the "Dock full" screen: (1) a "Hold my bike, 15 min free" button that pauses billing while they walk to another dock, (2) a "Nearest dock with space" button that opens the map, (3) a short explainer of how dock capacity works, with a link to the help center. Constraint: billing rules and the free-hold window are owned by the ops team and already agreed, so I'd rather not reopen that. Dock capacity is live in the API; the map already shows it if you tap a dock. Does the proposal hold up, and what would you change?
