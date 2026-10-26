---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

Building the housekeeping supervisor view on our tablet app. Every morning around 7:30 the supervisor opens "Today's rooms", which starts empty, and builds the board: floor by floor she marks each room Checkout, Stayover or Vacant from a printout of the front-desk report, then assigns rooms to the 8–10 housekeepers on shift. It takes her 40+ minutes and she asked us to make it faster. My plan: multi-select rooms, a floor filter, and drag-and-drop onto housekeeper columns. Alternative: a "Copy yesterday's assignments" button. Which gives the biggest win? Constraint: the front-desk system is a separate vendor product, we only get a nightly reservations export as CSV, no live API, and that won't change this year.
