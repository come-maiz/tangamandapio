[![screenshot of Robert Plant and his kids in The Song Remains the Same](https://archive.org/download/elopio-screenshots/zeppelin/the_song_remains_the_same.png)](https://archive.org/download/elopio-screenshots/zeppelin/the_song_remains_the_same.png)

(The screenshot is from
[The Song Remains the Same](https://en.wikipedia.org/wiki/The_Song_Remains_the_Same_(film)),
all of our love to the soul of Karac Plant <3)

[OpenZeppelin](https://openzeppelin.org/) is a community project to build a
battle-tested framework of reusable smart contracts for Ethereum. Copying a bit
more from the website: the project is focused on security, it has a modular
approach and it's open source. This brings a lot of opportunities, since I
joined the maintainers team I've been very impressed by everything the
community has done so far and all the potential for what's to come. But
achieving those three principles at the same time is not an easy task, we need
lots of constant help from the community.

We want to grow the number of contracts and features that we support, to enable
developers to mix and match them and keep building the decentralized revolution
using OpenZeppelin as a super safe base. This community is amazing, they keep
sending us proposals of new things and improvements to the existing ones. They
try things on their personal projects or with their companies and then want to
share them.

I love this, and I love that they trust us to make good use of this precious
code. But because things are moving so fast in Ethereum, when we receive a
contribution, how can we know if the design follows the right approach to beat
all the dangers out there when the real world tries to break us? How can we be
sure that the implementation is modular enough to support all the crazy things
that will appear next week? How can we tell if the community will use these new
things extensively, providing all the required eyes and hands to make this
project sustainable? What we need is a safe space to experiment and receive
feedback, get more smart people to join us reviewing the code, testing the
features and voicing their opinion, as we build together this project.

So, we want to propose the OpenZeppelin Nursery! (wink to our
[Rust](https://github.com/rust-lang-nursery) friends). The idea is to make it
simple: when we receive a contribution that is correct, fully documented, all
covered by automated tests, and that passes our initial security review; but
we are not 100% sure if it should be added to the next stable release of
OpenZeppelin, we will put it in the
[nursery](https://github.com/OpenZeppelin/openzeppelin-solidity/labels/nursery)
of pull requests.

This means we are asking for your help and input. If you want to contribute,
the first thing you can do is to read the description of the pull request and
leave your reaction with a thumb up if you like it. Leave a <3 if you love it,
if you need it in order to be happy and want it right away. If you have
opinions or suggestions, leave them as a comment. We will appreciate this
immensely, and so will all the developers and users that rely on OpenZeppelin.

If you want to go further, it would be great to get the contracts tested in
real world scenarios. Integrate them into your decentralized apps and let us
know how did it go. With
[Embark](https://github.com/OpenZeppelin/openzeppelin-solidity#embark) it's
super simple to use a contract from a git branch. For example, if you want to
give a try to the
[Dutch Action that Doug Crescenzi proposed](https://github.com/OpenZeppelin/openzeppelin-solidity/pull/989),
you can import it in your Solidity contract with:

    import "github.com/dougiebuckets/openzeppelin-solidity/contracts/auctions/DutchAuction.sol#feature/auction-458";

If you are using
[Truffle](https://github.com/OpenZeppelin/openzeppelin-solidity#truffle),
the testing setup will require an extra step. Let's say you are interested
in the
[Oracle interface proposed by Andrei Karpushonak](https://github.com/OpenZeppelin/openzeppelin-solidity/pull/971).
Then, instead of installing openzeppelin-solidity from the `npm` registry as
you normally do, you will have to install it from his branch:

     npm install git://github.com/miktam/openzeppelin-solidity.git#better_oracle_interfaces_16

And import it as if it were part of the OpenZeppelin release:

    import "openzeppelin-solidity/contracts/oracle/Oracle.sol";

A final way in which you can help is trying to find security vulnerabilities
on the proposed code. If you do find a security issue, we ask to please make a
responsible disclosure by sending an email to security@openzeppelin.org. A lot
of this code is shared after being deployed on existing projects, and the last
thing we want to do is to hurt them.

Note that these pull requests in the nursery are work in progress. They are
not yet part of the stable release of OpenZeppelin and thus they haven't yet
passed all our security reviews. **Do not use them in production**, only for
testing. But having said that, let's break things and have fun nursing these
cool ideas!

To find what's in the nursery right now, just take a look at the GitHub tag:
https://github.com/OpenZeppelin/openzeppelin-solidity/labels/nursery

If you are unsure where to start, or want to share your ideas with us, please
jump into our [Slack chat](https://slack.openzeppelin.org/).
