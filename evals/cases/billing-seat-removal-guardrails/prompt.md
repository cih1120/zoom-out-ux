---
max_turns: 6
allowed_tools: [Read, Glob, Grep, Skill]
---

SaaS billing settings, Members & seats page. When an admin removes a member we immediately reduce the seat count on the subscription, and if they add someone back the same day they get charged a new prorated seat. We're getting refund tickets from admins who removed someone by mistake or were just swapping one person for another. Fixes so far: a confirmation modal showing the price change, a red warning banner on the page, an email for every seat change, and an "Undo" toast. Open question for the team: should the undo window be 10 minutes or 24 hours? Constraint: the subscription quantity sync with our payment provider is owned by the billing team and they're mid-migration, so I can only change the front end and our own settings API.
