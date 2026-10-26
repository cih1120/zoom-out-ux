---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Getting a lot of 1-star reviews about extending parking. Flow today: driver starts a session in a zone, picks a duration, and gets a push 10 min before expiry with an "Extend" button. In zones with a max stay (2h in most of downtown), extend fails and they land on an error screen: "Maximum stay reached for this zone." Dead end, and they're usually still at lunch. The extend call only returns MAX_STAY_EXCEEDED and the parking ops team won't touch the API this sprint. I want to add something useful on that error screen. Options I'm thinking: A) a "Find a nearby zone" button that opens the map, B) a "Remind me to move my car" toggle, C) a short explainer of zone rules linking to the city's FAQ. Which one, or a combo? Need to ship this week.
