At Zeppelin we help to protect the core infrastructure of open and
decentralized applications. My team is in charge of the
[security audits](https://zeppelin.solutions/security-audits/),
we review tons of lines of code written by very smart developers for projects
that will shake the very foundations of our society.

Finding security vulnerabilities on this futuristic cypherpunk environment is
super challenging and fun; but I think that security actually starts in a
pretty boring and traditional place, full of the wisdom that our elders* have
collected through millennia of developing free software in community. So here I
want to share our checklist for boring quality things to do before spending
thousands of dollars in an audit by an external team.

# ✔️ Choose a free software license

Closed code is insecure. If the people using your project can't inspect it,
study it, hack and experiment on it, there's no way it can be trusted. If you
hold abusive control over your users, there's nothing stopping you (or somebody
more powerful than you) from making them vulnerable.

Take a look at the
[Free Software Definition](https://www.gnu.org/philosophy/free-sw.en.html)
and start by [choosing the license](https://choosealicense.com/) that better
suits your objectives and preferences.

I'm sure you have already met our first wise elder: [Richard Stallman](https://en.wikipedia.org/wiki/Richard_Stallman) 🤪

[<img src="https://upload.wikimedia.org/wikipedia/commons/d/de/Richard_Stallman_by_gisleh_01.jpg" alt="Richard Stallman" width="200"/>](https://en.wikipedia.org/wiki/Richard_Stallman#/media/File:Richard_Stallman_by_gisleh_01.jpg)

# ✔️ Build your core team of maintainers

If your project succeeds, it will have hundreds of contributors. But in order to
get there you will need to bootstrap with a strong and diverse team of core
maintainers. They will take care of the bulk of the work, the fun and the boring
parts, proposing and reviewing all the code of your shared project. Together,
you all need to have a strong knowledge of all of the points on this checklist.
In addition to technical knowledge, look for a passion for cat hearding and a
healthy workstyle, because, well, things will get complicated.

Pay attention to your [bus factor](https://en.wikipedia.org/wiki/Bus_factor):
make sure that your team is sharing their expertise, the lessons learned and their
responsibilities, and make sure that you are all constantly mentoring new people
that could join this core team that sustains the project.

And somebody will have to lead and orchestrate, to get value out of the eternal
tendency to chaos. Let me introduce you to our second magician,
[Camille Fournier](http://www.camilletalk.com/) who wrote THE book of technical
management,
[The Managers's Path](https://www.goodreads.com/book/show/33369254-the-manager-s-path).

[<img src="https://static1.squarespace.com/static/56bf8b0622482edc3dc1919d/t/56bf8ef5f85082335f63196b/1455400011874/21793992240_b56cd4b3e2_o+%281%29.jpg?format=500w" alt="Camille Fournier" width="200"/>](http://www.camilletalk.com/contact/)

# ✔️ Write clean code

[The only valid measurement of code quality is WTFs/minute](https://www.osnews.com/story/19266/wtfsm/).

Clean Code, by Robert C. Martin.
Consistent code style

Unit tests
test coverage
Test Driven Development: By Example, by Kent Beck.
xUnit Test Patterns, by Gerard Meszaros.
Integration tests
Agile Testing, by Janet Gregory and Lisa Crispin.

Use CI

Publish the code

Documentation
readmes
docstrings
usability
Specification

Check your dependencies

Build a community
Jono Bacon
Code of conduct

Communication

Known issues

Ethernaut, by Zeppelin.
Zeppelin audits reports, by Zeppelin.
Zeppelin audits reports, by Zeppelin.

Define a process for change

 Succeeding with Agile: Software Development Using Scrum
(A Mike Cohn Signature Book)

Release early and often

Milestones and iterations

Contribution guidelines

Bug bounty

Hire an external auditing team

***

* counted in light years of roads traveled.