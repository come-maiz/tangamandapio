At Zeppelin we help protect the core infrastructure of open and
decentralized applications. I'm part of the Research team, which is in charge of conducting
[security audits](https://zeppelin.solutions/security-audits/).
We review tons of lines of code written by very smart developers for projects
that will shake the bedrock of our society.

Finding security vulnerabilities on this futuristic cypherpunk environment is
super challenging and fun; but I think that security actually starts in a
pretty boring and traditional place, full of the wisdom that our elders* have
collected through millennia of developing software in community. So here I
want to share our checklist for boring quality things that your next awesome project should consider before handing it over for an external audit.

# ✔️ Choose a free software license

Closed code is inherently insecure. If people using your project can't inspect it,
study it, hack and experiment on it, there's no way it can be trusted. If you
hold abusive control over your users, nothing prevents you (or anyone
more powerful than you) from making them vulnerable.

Take a look at the
[Free Software Definition](https://www.gnu.org/philosophy/free-sw.en.html),
and begin with [choosing the license](https://choosealicense.com/) that best
suits your needs.

This is a good moment to introduce our first wise elder!
[Richard Stallman](https://en.wikipedia.org/wiki/Richard_Stallman),
who hacked the copyright laws, started the free software movement, and wrote
the definition above.

[<img src="https://upload.wikimedia.org/wikipedia/commons/d/de/Richard_Stallman_by_gisleh_01.jpg" alt="Richard Stallman" height="350"/>](https://en.wikipedia.org/wiki/Richard_Stallman#/media/File:Richard_Stallman_by_gisleh_01.jpg)

# ✔️ Build your core team of maintainers

When your project succeeds, hundreds of external contributors will surely be supporting it. But in order to
get there you will need to bootstrap with a strong and diverse team of core
maintainers. They will take care of the bulk of the work, the fun and the boring
parts, proposing and reviewing the code of your shared project. Together,
you all need to have a strong knowledge of all of the points on this checklist.
Look not only for technical knowledge, but also a knack for cat herding and a
healthy work style, because, well, things will get complicated.

Pay attention to your [bus factor](https://en.wikipedia.org/wiki/Bus_factor):
make sure that your team members are sharing their expertise, the lessons learned and their
responsibilities, while at the same time constantly mentoring new people
that could potentially join the core team.

And somebody will have to lead and orchestrate, to get value out of the eternal
tendency to chaos. Let me introduce you to our second magician,
[Camille Fournier](http://www.camilletalk.com/), who wrote THE book of technical
management,
[The Manager's Path](https://www.goodreads.com/book/show/33369254-the-manager-s-path).

[<img src="https://static1.squarespace.com/static/56bf8b0622482edc3dc1919d/t/56bf8ef5f85082335f63196b/1455400011874/21793992240_b56cd4b3e2_o+%281%29.jpg?format=500w" alt="Camille Fournier" height="350"/>](http://www.camilletalk.com/contact/)

# ✔️ Write clean code

[The only valid measurement of code quality is WTFs/minute](https://www.osnews.com/story/19266/wtfsm/). This point *must* be simple. If things get overly complicated or
weird, you are doing it wrong. Go for a walk and try again with fresh eyes.

But don't get me wrong, no interesting software project is simple. Now add the
complexity dimensions of decentralization, transparency, cryptography, and all
these shiny ideas that are keeping us so busy these days. It's complicated by
design; but with the correct abstractions, a clear thought-out model, and proper encapsulation,
you can start building the bank-killer app one line at a time. And each of
those lines *must* be clean and readable.

I'm not a breathtaking programmer, I just was lucky to have read Uncle Bob
Martin's book
[Clean Code](https://www.goodreads.com/book/show/3735293-clean-code) at
the right moment, and to have read a never-ending stream of very very ugly code.

[<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Robert_Cecil_Martin.png/800px-Robert_Cecil_Martin.png" alt="Robert C. Martin" height="250"/>](https://en.wikipedia.org/wiki/Robert_C._Martin#/media/File:Robert_Cecil_Martin.png)

Once all core maintainers reach common grounds on this topic, a consistent code style should be enforced by running a
[linter](https://en.wikipedia.org/wiki/Lint_(software)) on every new line of
code that's added. The particular rules are not as important as strictly
following them; but if you can
[sacrifice your peculiar preferences to be consistent with the rest of the world](https://github.com/OpenZeppelin/openzeppelin-solidity/issues/1396#issuecomment-440426310), your contributors will appreciate it a lot.

I also practice [slow-~~food~~](https://en.wikipedia.org/wiki/Slow_Food)programming.
Take your time, enjoy the journey to become a master of this craft, and when you've built something you can
proudly set free, let the masses read it and judge it.

# ✔️ Write unit tests

Tons of them. 100% coverage. This might sound extreme, but hey, your code is now
playing directly with somebody else's money. If you forget, or just get lazy and
don't write a test for that super obvious line of code, you might be leaving an open
door for an exploit later in the game that will make your project crash, and
all this magic internet money will disappear in no time. It has happened.

I feel immediately more secure when I do test-driven development. At least give
an honest try to writing the tests first, and get into a cycle of
red-green-refactor. There are other techniques that can achieve the same
result, but I suggest to start here and then deviate if you find good
reasons to do so. If you've never worked this way, read
[Test Driven Development: By Example](https://www.goodreads.com/book/show/387190.Test_Driven_Development),
by Kent Beck. It's a quick read, that will help you avoid the temptation of
just jumping into code without thinking it through.

Then, even if you design for testability, you will find many scenarios that are
hard to test. Gerard Meszaros provides all the answers in
[xUnit Test Patterns](https://www.goodreads.com/book/show/337302.xUnit_Test_Patterns).
This book is huge, so I recommend to choose a designated test expert on your
team.

[<img src="https://upload.wikimedia.org/wikipedia/commons/c/c0/Kent_Beck_1.jpg" alt="Kent Beck" height="350"/>](https://en.wikipedia.org/wiki/Kent_Beck#/media/File:Kent_Beck_1.jpg) [<img src="https://pbs.twimg.com/profile_images/71233259/Gerard_in_Vancouver__Brian_Foote-O-O_Canada_012_.jpg" alt="Gerard Meszaros" height="350"/>](https://twitter.com/gerardmes)

Finally, make sure to run your unit tests on every single pull request, and that they have all passed
*all* green before merging the changes. In addition, you can set up a test coverage report to ensure
test coverage never goes down.

# ✔️ Test early, test often, test agile

Now that you have your first layer of tests covered with tons of unit tests,
what comes next are... more tests! You need to test the integration between
all of your components, then go one level higher to test your
application from the point of view of a real user, and then go even
higher to test the interactions with other systems end-to-end.

To me, this is the biggest challenge, and designing a good process that
keeps many bugs out of your system can be as difficult as designing the system
itself. Iterate, automate as much as possible, share the load of manual
testing... and let your community help.

We'll talk later about community, but I think this is the reason for
publishing your code as early as possible: you can get help from early adopters
and enthusiasts to validate your system, not only for correctness but also to
verify that you are focusing on the right user stories and that you are tackling a
real problem with a user-friendly solution.

A lot has been written about iterative development processes that deliver
functionalities in progressive sprints and milestones. I found that Mike Cohn's
[Succeeding with Agile: Software Development Using Scrum](https://www.goodreads.com/book/show/6707987-succeeding-with-agile)
is a good place to start, but keep in mind that any methodology will have to be
adjusted to your team, your users, and your context. There are a lot less
resources focused on the quality and testing part, that's why I was so happy
when I read
[Agile Testing](https://www.goodreads.com/book/show/5341009-agile-testing) by
Lisa Crispin and Janet Gregory, which is full of good ideas and advice. But
let me stress it again, nothing you read will perfectly fit your project, so take your
time to design the testing process with as much love and care as you design the system's```
architecture.

[<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Mike_Cohn_2013-06-12.jpg/1280px-Mike_Cohn_2013-06-12.jpg" alt="Mike Cohn" height="350"/>](https://en.wikipedia.org/wiki/Mike_Cohn#/media/File:Mike_Cohn_2013-06-12.jpg) [<img src="https://agiletester.ca/wp-content/uploads/sites/26/2013/09/Lisa-Crispin-and-Janet-Gregory.jpg" alt="Lisa Crispin and Janet Gregory" height="350"/>](https://agiletester.ca/about-the-authors/)

While there's still some debate about the perfect moment for auditing a project (before or after the code is
published, I think audits should be performed when there is a release candidate
ready to be deployed to mainnet, after you have performed extensive alpha and
beta testing. I see room for auditing before the code has been published,
but this would be more related to checking that the development process will lead to a
high quality, properly tested release candidate, and to validate the bases of
your project, than to perform a deep and thorough inspection of the codebase.

# ✔️ Document

This is my least favorite part, by far. So let's keep it simple, starting at
the beginning: the README, the most important file of your repository.
And yet, it is usually either empty or bloated, outdated and ugly. Ideally, as it is the
first thing developers and potential contributors will read, it should work as a clear and straightforward index of
your project.

It's best not to get creative here, just follow this simple specification that
works for all cases, proposed by Richard Littauer on
[Standard Readme](https://github.com/RichardLitt/standard-readme/blob/master/spec.md).
*Do not forget* to include a specific section in the main README that states how people should disclose any security
vulnerabilities found on your project.

[<img src="https://pbs.twimg.com/profile_images/853672023511490561/m_RAvJfy.jpg" alt="Richard Littauer" height="350"/>](https://twitter.com/richlitt)

Next come the docstrings, the documentation inside your code files. We hit
an apparent conflict here, since in theory, if your code is clean
it will not require documentation. However, note that we are not anymore
designing standalone systems that work as a black box. We are building
protocols for decentralized applications, your code will be called by all sorts
of external agents. So by all means, document every function that is part
of the contracts' public API following the
[NatSpec format](https://github.com/ethereum/wiki/wiki/Ethereum-Natural-Specification-Format).

Which brings me to the next point. It is advisable to document the
specification of your protocol, that's how others will know what to call and
what to expect. But more related to the topic at hand, in an audit we check that
the implemented code works as intended by the specification. This document is
a *must*, without it auditors will just guess your intentions which might
result on some issues missed, because they are completely consistent within
the system but take it to a state that you want to avoid.

Finally, there's the user documentation. For high quality systems,
writing the user documentation should be mostly painless. The moment things get cumbersome
while documenting, consider reevaluating your user stories and don't be afraid to go back to iterate on
them.

# ✔️ Check your dependencies

Your project builds on top of many many others. It'll probably depend at least
on the Ethereum protocol and its network of nodes, on Solidity, a bunch of
EIPs and their implementation, libraries for testing and UI, and maybe hundreds
of other small projects. Even if yours is secure, you need to check how healthy your dependencies are,
since they can easily become the source of
vulnerabilities.

Earlier I mentioned that your team should have a strong and diverse knowledge.
That includes all the projects that surround you. You should be able to
write idiomatic code following the best practices of the language, to identify
and avoid known issues, always keeping an eye on new
[CVEs](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
that may directly (or indirectly, through third-party dependencies) affect your project. Moreover, try to participate on the communities around your
dependencies, as it is an excellent way to firsthand see how safe and trustworthy they are.
You should also consider actively participating in those communities, to gain some karma that will surely come in
handy later when you need new features and bug fixes.

Moreover, don't forget to pay attention to their finances. When making your project's budget,
take into account a share for your dependencies, as they may need it in order
to remain actively maintained. There's a very nice project called
[OpenCollective](https://opencollective.com/discover),
lead by Pia Mancini, that's making super easy to support in a transparent way
the organizations and developers you depend on.

[<img src="https://static.wixstatic.com/media/a7bdaa_ab650ff17e804731b7cf560bc5ee9a02~mv2.jpg/v1/crop/x_0,y_120,w_961,h_961/fill/w_530,h_530,al_c,q_80,usm_0.66_1.00_0.01/Pia%20Mancini%20-%20headshot.jpg" alt="Pia Mancini" height="350"/>](https://www.piamancini.com/)

And of course, with [ZeppelinOS](https://zeppelinos.org/) we are building a
platform that will let you vouch for the security of a package. This is in beta
testing, so expect exciting news very soon.

Specific to Ethereum and Solidity, the community is collecting the lessons
learned (usually on a painful way). You can learn a lot about interesting
and tricky vulnerabilities playing the
[Ethernaut capture the flag game](https://ethernaut.zeppelin.solutions/).
We have
[published many of our past audits](https://blog.zeppelin.solutions/tagged/security)
with descriptions of the issues found, recommendations, and usually with a link
to the patch that fixes them. All of our learnings from audits are distilled into
the [OpenZeppelin package](https://openzeppelin.org/), which you should definitely add
to your list of dependencies - if you are not one of the thousands that already did. The
[Smart Contracts Weakness Registry](https://smartcontractsecurity.github.io/SWC-registry/)
maintained by the Mythril team is also a great resource to learn from the
experience of others.

Whatever approach you take, remember that as the Ethereum space is very young and unexplored, we are learning many things as we go, so _always_
proceed with caution.

# ✔️ Build your community

This is a complement to the first point: code without a community is insecure.
The community gives you eyes to monitor the project, hands to test it in a
real environment, support to survive challenging problems, and resilience to
adjust to the unexpected. There is no amount of money, experience or knowledge
that can substitute this.

Once you publish the code, you can get started engaging your community. If your
project is interesting, they will come, and this is where the cat herding
abilities of your team will shine. However, you definitely need to set up proper and fluent communication channels,
invest in some marketing, and hire a bold community manager with a plan in order to disentangle
and wisely leverage all the opportunities that your community brings. I can't
recommend enough the writings and videos by
[Jono Bacon](https://www.jonobacon.com/).

[<img src="https://farm4.staticflickr.com/3740/12622356185_b89d134675_k.jpg" alt="Jono Bacon" height="350"/>](https://www.flickr.com/photos/jonobacon/12622356185/)

You should be thoughtful and caring with your community. A small step that
goes a long way is to adopt and enforce a
[code of conduct](https://www.contributor-covenant.org/) so you all can feel
safe. Then, write some contribution guidelines to make sure that all of their
enthusiasm can be put to good use and they don't get lost. Lastly, think about
setting up a [bug bounty program](https://www.hackerone.com/) that will
encourage your community to watch out for vulnerabilities in the wild,
providing hackers with enough incentives to disclose security issues in a responsible way.

# ✔️ Hire an external auditing team

That's us! :) We can help you reviewing the quality of your project and
processes. We'll take a deep and thorough dive on your code, with years of experience hacking,
researching and developing on blockchains, plus a little touch of Latin
American fire, to give you and your users all the confidence you need to
continue building the core systems of this new decentralized, global and open economy.

We are available for auditing services, more information here:
https://zeppelin.solutions/security-audits/

[<img src="https://pbs.twimg.com/media/DtgyV1zWwAEO1O2.jpg" alt="Zeppelin Team" height="350"/>](https://zeppelin.solutions)

***

tldr:

✔️ Choose a free software license.

✔️ Build a strong and diverse team of core maintainers.

✔️ Increase your bus factor: share knowledge and responsibilities.

✔️ Choose a good leader.

✔️ Write clean code.

✔️ Enforce a consistent code style.

✔️ 100% unit test coverage.

✔️ Enforce green tests on all your pull requests.

✔️ Design your iterative development and testing process.

✔️ Publish your code.

✔️ Write a good README.

✔️ Document the functions of your public API.

✔️ Document your protocol.

✔️ Write the end-user documentation.

✔️ Make sure that your dependencies can be trusted.

✔️ Review known issues and keep an eye for new ones.

✔️ Use OpenZeppelin, the community-vetted standard for smart contract development

✔️ Build and care for your community.

✔️ Audit!

***

&ast; counted in light years of roads traveled.
