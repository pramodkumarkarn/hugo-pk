---
author: p3trk
cover: Picture-3.jpg
date: 2018-03-20
title: Metrics for agile teams supporting legacy applications
categories:
  - Blog
  - Agile
---

Recently I've been working with a team who are supporting (and developing against) a legacy service which affects the daily lives of millions of people. It’s old, and made up of many applications and a couple of huge monoliths with plenty of complexity everywhere. Most things about this service are difficult. It’s tough to develop, tough to test, tough to release, tough to fix bugs (which are plentiful) and tough to feel like you’re making a difference day to day.

We’ve done a lot to make the process more bearable by looking at our [ways of working](https://www.gov.uk/service-manual/agile-delivery/core-principles-agile) but it hasn’t really translated into more frequent releases of high-quality, valuable software to our users.

## Better metrics for better outcomes

To help us focus on user value and pace of delivery we’re looking at a new set of metrics around actually getting things released and reducing the amount of time we spend fixing bugs. This team is using scrum so you’ll see references to story points but you could adjust these for a more kanban world by counting tickets.

Each of these is just a metric, but it's great to combine them with a target, perhaps as part of your [OKRs](/cv).

Here they are:

### Deployment time
How long does the average successful release take to perform? Besides making our releases faster and easier, looking at this metric has the added benefit of forcing us to get really clear on what a release is (and isn’t) when _exactly_ does it start? And when is it “finished”?

### Time between successful releases
How often do we complete a successful release? By dividing the number days between our first and latest release by the number of releases, we have an average number of days between releases. Again, this metric forces us to be clear on our shared definition of a “successful release”.

### Release success rate
It can also be useful to look at rolled back releases or "release attempts”. Divide the number of successful releases by the total number of attempts to get your success rate. As before, do we have a shared understanding of the criteria for cancelling or rolling back a release?

### User-facing points released per sprint
In a perfect world, "done" means "live" and every completed user story gets released by the end of each sprint. This isn’t always possible. Legacy apps often have lots of ad-hoc technical tasks which don't specifically relate to new features (e.g. infrastructure tweaks, tech-debt, hot-fixes, documentation, build automation, etc). These tasks should (eventually) result in more business value being delivered. By looking at the average number of user-facing story points deployed to production each sprint (even if they were "completed" but not released in previous sprints) we stay conscious of how much user value we're actually shipping.

### Unplanned Work (Emergencies)
How many story points of unplanned "showstopper" work are getting introduced into each running sprint? Without automated tests and monitoring tools in place, we're relying on users to tell us what's broken. This is far from ideal. However, by embracing this metric, we can see how much time our defects are costing us and, hopefully, justify a greater investment in preventing defects from making it to production.

## What do you think?

There are lots of metrics you might choose to use in an agile team. We’re using the ones above to help us focus on improving our code quality and our build & release process. You may only need to track one or two of these to make huge improvements. I’d love to know what you think! Have you tried similar metrics? What would you change or add? Are they likely to introduce any pitfalls or perverse incentives? Please [contact me](/contact) with your ideas and feedback.

<!--https://unsplash.com/photos/yD5rv8_WzxA-->
<!--small>Photo by Nick Hillier on Unsplash</small-->
