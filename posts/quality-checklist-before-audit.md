At Zeppelin we help to protect the core infrastructure of open and
decentralized applications. My team is in charge of the
[security audits](https://zeppelin.solutions/security-audits/),
we review tons of lines of code written by very smart developers for projects
that will shake the very foundations of our society.

Finding security vulnerabilities on this futuristic cypherpunk environment is
super challenging and fun; but I think that security actually starts in a
pretty boring and traditional place, full of the wisdom that our elders* have
collected through millennia of developing free software in community. So here I
want to share our checklist for boring quality things to do before an audit.

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

[<img src="https://upload.wikimedia.org/wikipedia/commons/d/de/Richard_Stallman_by_gisleh_01.jpg" alt="Richard Stallman" height="400"/>](https://en.wikipedia.org/wiki/Richard_Stallman#/media/File:Richard_Stallman_by_gisleh_01.jpg)

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

[<img src="https://static1.squarespace.com/static/56bf8b0622482edc3dc1919d/t/56bf8ef5f85082335f63196b/1455400011874/21793992240_b56cd4b3e2_o+%281%29.jpg?format=500w" alt="Camille Fournier" height="400"/>](http://www.camilletalk.com/contact/)

# ✔️ Write clean code

[The only valid measurement of code quality is WTFs/minute](https://www.osnews.com/story/19266/wtfsm/). This point *must* be simple. If things get complicated or
weird, you are doing it wrong. Go for a walk and try again with fresh eyes.

But don't get me wrong, no interesting software project is simple. Now add the
complexity dimensions of decentralization, transparency, cryptography, and all
these shiny ideas that are keeping us so busy these days. It's complicated by
design; but with the correct abstractions, a simple model, and encapsulation,
you can start building the bank-killer app one line at a time. And each of
those lines *must* be clean and readable.

I'm not a good programmer, I just had the luck to have read Uncle Bob Martin's
book [Clean Code](https://www.goodreads.com/book/show/3735293-clean-code) at
the right moment, and to have read a neverending stream of very ugly code.

[<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Robert_Cecil_Martin.png/800px-Robert_Cecil_Martin.png" alt="Robert C. Martin" height="400"/>](https://en.wikipedia.org/wiki/Robert_C._Martin#/media/File:Robert_Cecil_Martin.png)

Once you all agree on this point, enforce a consistent code style by running a
[linter](https://en.wikipedia.org/wiki/Lint_(software)) on every new line of
code you add. The particular rules are not as important as it is to strictly
follow them; but if you can
[sacrifice your peculiar preferences to be consistent with the rest of the world](https://github.com/OpenZeppelin/openzeppelin-solidity/issues/1396#issuecomment-440426310), your contributors will appreciate it a lot.

I also practice [slow-~~food~~](https://en.wikipedia.org/wiki/Slow_Food)programming.
Take your time, enjoy the journey, make this your craft and something you can
proudly set free, and let the masses read it and judge it.

# ✔️ Write unit tests

Tons of them. 100% coverage. This might sound extreme, but hey, your code is now
playing directly with somebody else's money. If you forgot or got lazy and
didn't write a test for that super obvious line of code, you might be opening
the door for an exploit later in the game that will make your project crash, and
all this magic internet money will disappear in no time. It has happened.

I feel immediatly more secure when I do test-driven development. At least give
an honest try to writting the tests first, and get into a cycle of
red-green-refactor. There are other techniques that can achieve the same
result, but I suggest to start here and then deviate if you find good
reasons to do so. If you've never worked this way, read
[Test Driven Development: By Example](https://www.goodreads.com/book/show/387190.Test_Driven_Development),
by Kent Beck. It's a quick read, that will help you avoid the temptation of
just jump into code without thinking it through.

Then, even if you design for testability, you will find many scenarios that are
hard to test. Gerard Meszaros provides all the answers in
[xUnit Test Patterns](https://www.goodreads.com/book/show/337302.xUnit_Test_Patterns).
This book is huge, so I recommend to choose a designated test expert on your
team.

[<img src="https://upload.wikimedia.org/wikipedia/commons/c/c0/Kent_Beck_1.jpg" alt="Kent Beck" height="400"/>](https://en.wikipedia.org/wiki/Kent_Beck#/media/File:Kent_Beck_1.jpg) [<img src="https://pbs.twimg.com/profile_images/71233259/Gerard_in_Vancouver__Brian_Foote-O-O_Canada_012_.jpg" alt="Gerard Meszaros" height="400"/>](https://twitter.com/gerardmes)

Make sure to run your unit tests on all the pull requests, and that they are
*all* green before accepting them. Also add a report of test coverage to make
sure that it never goes down.

# ✔️ Test early, test often, test agile

Now that you have your first layer of tests covered with tons of unit tests,
what comes next is... more tests! You need to test the integration between
all of your components, and you even need to go one level higher to test your
application from the point of view of a real user.

To me, this is the biggest challenge, and designing a good test suite that
keeps many bugs out of your system can be as difficult as designing the system
itself. Automate as much as possible, share the load of manual testing... and
let your community help you.

We'll talk later about community, but I think this is the justification for
publishing your code as early as possible: you can get help from early adopters
and enthusiasts to validate your system, no only for correctness but also to
verify that you are focusing on the right use cases, that you are solving a
real problem with a system that is usable.

A lot has been written about iterative development processes that deliver
functionalities in progressive sprints and milestones. I found that Mike Cohn's
[Succeeding with Agile: Software Development Using Scrum](https://www.goodreads.com/book/show/6707987-succeeding-with-agile)
is a good place to start, but keep in mind that any methodology will have to be
adjusted to your team, your users, and your context. There are a lot less
resources focused on the quality and testing part, that's why I was so happy
when I read
[Agile Testing](https://www.goodreads.com/book/show/5341009-agile-testing) by
Lisa Crispin and Janet Gregory, which is full of good ideas and advice. But
again, nothing you read will fit your project, take your time to design the
process with as much love and care as you design your architecture.

[<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Mike_Cohn_2013-06-12.jpg/1280px-Mike_Cohn_2013-06-12.jpg" alt="Mike Cohn" height="400"/>](https://en.wikipedia.org/wiki/Mike_Cohn#/media/File:Mike_Cohn_2013-06-12.jpg) [<img src="https://agiletester.ca/wp-content/uploads/sites/26/2013/09/Lisa-Crispin-and-Janet-Gregory.jpg" alt="Lisa Crispin and Janet Gregory" height="400"/>](https://agiletester.ca/about-the-authors/)

There's some debate here about when to audit, before or after the code is
published. I think audits should be performed when there is a release candidate
ready to be deployed to mainnet, after you have performed extensive alfa and
beta testing. I see some room for auditing before the code has been published,
but this would be more to check that the development process will lead to a
high quality, properly tested release candidate, not to perform a deep
inspection of the code.

# ✔️ Document


readmes
docstrings
usability
Specification

Check your dependencies
idiomatic
Build a community
Communication
Jono Bacon
Code of conduct
Contribution guidelines
Bug bounty

Known issues

Ethernaut, by Zeppelin.
Zeppelin audits reports, by Zeppelin.
consensys database


Hire an external auditing team

***

* counted in light years of roads traveled.