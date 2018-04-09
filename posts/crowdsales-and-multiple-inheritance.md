On 2017 we saw a mind-blowing number of crowdsales. They have proved to be a
powerful tool to collect the funds required to start a project, and they are
one of the most common uses for smart contracts right now. The Zeppelin team
has been very involved in this topic,
[auditing many crowdsale contracts](https://blog.zeppelin.solutions/tagged/audit),
and supporting [OpenZeppelin](https://openzeppelin.org/), the most popular
framework to build these crowdsales.

Earlier this year, part of the team took the task to redesign our base
`Crowdsale` contract in order to easily support a lot of new crowdsale flavors,
and to make the experience of building and publishing your own crowdsale more
clear and secure. These new contracts were added to OpenZeppelin version
`1.7.0`, and since the release they have been widely used by our community with
great success. So, this is a good moment to show them off.

Let's start with a dive into
[the source code of the `Crowdsale` base contract](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/crowdsale/Crowdsale.sol).
The first thing you will notice is a lot of comments, guiding you through the
details of the OpenZeppelin crowdsale architecture. They explain that some
functions are the core of the architecture and should not be overriden, like
`buyTokens`. Some others like `_preValidatePurchase` can be overriden to
implement the requirements of your crowdsale, but that extra behavior should
be concatenated with the one of the parent calling `super`, to preserve the
validations from the  base contract. And, some functions like
`_postValidatePurchase` can be just added as hooks in other parts of the
crowdsale's lifecycle.

Building on top of this base, we now provide some contracts for common
crowdsale scenarios involving
[distribution](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale/distribution),
[emission](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale/emission),
[price](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale/price),
and
[validation](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale/validation).

So, let's say that you want to set a goal for your crowdsale and if it's not
met by the time the sale finishes, you want to refund all your investors. For
that, you can use the
[RefundableCrowdsale contract](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/crowdsale/distribution/RefundableCrowdsale.sol),
which overrides the base `_forwardFunds` behavior to send the funds to a fancy
[RefundVault](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/crowdsale/distribution/utils/RefundVault.sol)
while the crowdsale is in progress, instead of sending them directly to the
wallet of the crowdsale owner.

Another common scenario is when you want the tokens to be minted when they are
purchased. For that, take a look at the
[MintedCrowdsale contract](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/crowdsale/emission/MintedCrowdsale.sol),
which overrides the simple `_deliverTokens` behavior of the base class to call
instead the `mint` function of an
[ERC20 Mintable token](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/token/ERC20/MintableToken.sol).

What if we want to do someting more interesting with the price of the tokens?
The base `Crowdsale` contract defines a constant rate between tokens and wei,
but if we override `_getTokenAmount`, we could do something like increasing
the price as the closing time of the crowdsale approaches. That's exactly what
the
[IncreasingPriceCrowdsale contract](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/crowdsale/price/IncreasingPriceCrowdsale.sol)
does.

To get started developing and deploying a crowdsale using the OpenZeppelin
framework, Gustavo Guimaraes published a nice
[guide where you will see in action a crowdsale that is timed **and** minted](https://blog.zeppelin.solutions/how-to-create-token-and-initial-coin-offering-contracts-using-truffle-openzeppelin-1b7a5dae99b6).

These are just a few examples. I invite you to explore the
[OpenZeppelin crowdsale contracts](https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/crowdsale)
to see all the new flavors that you can easily use to fund your cool idea. And
remember that if you want to help us adding new flavors or improving the
existing ones, you are welcome into
[our community](https://slack.openzeppelin.org/).

On the repo you will also find that these contracts are very well tested. And
as we have seen, the new architecture is clearer and safer, with each contract
explaining the functions that you can or can't override, and how to do it.
However, you should be extra careful when combining them. It's not the same to
have three contracts with one condition than to have one contract with three
conditions. The combination makes a bigger attack surface, so you need to have
a good idea of what you want to achieve, and know the implementation details of
the tools you are using.

Before you go ahead and deploy a complex crowdsale that combines some of our
contracts, I would like to spend some time going deep into how Solidity works
when you combine contracts through multiple inheritance, like Gustavo did in
his guide to make a contract that inherits from `TimedCrowdsale` **and** from
`MintedCrowdsale`.

Multiple inheritance is hard, and it can get very confusing if you abuse it.
Some languages don't support it at all; but it is becoming a very common
pattern on Solidity.

The problem, from the point of view of the programmer, is to understand the
order of the calls when a contract has multiple parents. Let's say we have a
base contract `A`, with a function named `f`:

```
contract A {
  function f() {
    somethingA();
  }
}
```

Then we have two contracts `B` and `C`, both inherit from `A` and override `f`:

```
contract B is A {
  function f() {
    somethingB();
    super.f();
  }
}

contract C is A {
  function f() {
    somethingC();
    super.f();
  }
}
```

And finaly we have a contract `D`, which inherits from `B` and `C`, and
overrides `f` too:

```
contract D is B, C {
  function f() {
    somethingD();
    super.f();
  }
}
```

What happens when you call `D.f`?

This is called the diamond problem, because we end up with a diamond-shaped
inheritance diagram:

[![Diamond inheritance problem](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Diamond_inheritance.svg/180px-Diamond_inheritance.svg.png)](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Diamond_inheritance.svg/180px-Diamond_inheritance.svg.png)

(the image is from wikipedia)

To solve it, Solidity uses C3 linearization, also called Method Resolution
Order (MRO). This means that it will linearize the inheritance graph. If `D`
is defined as:

```
contract D is B, C {}
```

then `D.f` will call:

```
somethingD();
somethingC();
somethingB();
somethingA();
```

When `D` inherits from `B, C`, the linearization results in D→ C→ B→ A. This
means that `super` on `D` calls `C`. And you might be a little surprised by the
fact that calling `super` on `C` will result on a call to `B` instead of `A`,
even though `C` doesn't inherit from `B`. Finally, `super` on `B` will call
`A`.

If `D` is instead defined as:

```
contract D is C, B {}
```

then `D.f` will call:

```
somethingD();
somethingB();
somethingC();
somethingA();
```

When `D` inherits from `C, B`, the linearization results in D→ B→ C→ A.

Notice here that the order in which you declare the parent contracts matters a
lot. If the inheritance graph is not too complex, it will be easy to see that
the order of calls will follow the order in which the parents were declared,
right to left. If your inheritance is more complicated than this and the
hierarchy is not very clear, you should probably stop using multiple
inheritance and look for an alternate solution.

I recommend you to read the wikipedia pages of
[Multiple inheritance](https://en.wikipedia.org/wiki/Multiple_inheritance) and
[C3 linearization](https://en.wikipedia.org/wiki/C3_linearization), and the
[Solidity docs about multiple inheritance](https://solidity.readthedocs.io/en/latest/contracts.html#multiple-inheritance-and-linearization).
You will find in there a complete explanation of the C3 algorithm, and an
example with a more complicated inheritance graph.

To better understand how this can impact your crowdsales, take a look at the
case that Philip Daian brilliantly explains on his blog post
[Solidity anti-patterns: Fun with inheritance DAG abuse](https://pdaian.com/blog/solidity-anti-patterns-fun-with-inheritance-dag-abuse/).
There he presents a Crowdsale contract that needs "to have a whitelist
pool of preferred investors able to buy in the pre-sale [...], along with a
hard cap of the number of [...] tokens that can be distributed." On his first
faulty implementation, he ends up with a crowdsale that checks:

```
((withinPeriod && nonZeroPurchase) && withinCap) || (whitelist[msg.sender] && !hasEnded())
```

Pay close attention to the resulting condition, and notice that if a
whitelisted investor buys tokens before the crowdsale has ended, she will be
able to bypass the hard cap, and buy as many tokens as she wants.

By just inverting the order on which the parents are defined, he fixes the
contract which will now check for:

```
(withinPeriod && nonZeroPurchase || (whitelist[msg.sender] && !hasEnded())) && withinCap
```

Now, if the purchase attempt goes above the cap, the transaction will be
reverted even if the sender is whitelisted.

There are some simple cases, where the order of the conditions is not
important. By now, you should have started to suspect that the contract above
became complicated because of the `||` (or) condition. Things are a lot easier
when all our conditions are merged with `&&` (and), because in that case the
order of the conditions doesn't alter the result.

Let's say that we have a crowdsale that should only allow whitelisted
investors to buy tokens while the sale is open and the cap has not been
reached. In this case, the condition to check would be:

```
hasStarted() && !hasEnded() && isInWhiteList(msg.sender) && isWithinCap(msg.value)
```

Our contract would be as simple as:

```
pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/WhitelistedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract WhitelistedTimedCappedCrowdsale is TimedCrowdsale, WhitelistedCrowdsale, CappedCrowdsale {

  function WhitelistedTimedCappedCrowdsale(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    uint256 _openingTime,
    uint256 _closingTime,
    uint256 _cap
  )
    public
    Crowdsale(_rate, _wallet, _token)
    TimedCrowdsale(_openingTime, _closingTime)
    CappedCrowdsale(_cap)
    {
    }

}
```

It doesn't matter how you order the parents, all the conditions will be
checked always. But, take this with a grain of salt. All the conditions will be
checked, but the order will be different. This can have different side-effects
on Solidity, as some paths will execute statements that other paths won't, and
it could lead an attacker to find a specific path that is vulnerable. Also, if
your parent contracts are not super clear, they might be hiding an `||`
condition in a few hard-to-read code statements.

It's very easy to think that the parent contracts will just be magically merged
into something that will make sense for our use case, or to make a mistake when
we linearize them in our mind. Every use case will be different, so our
framework can't save you from the work of organizing your contracts' hierarchy.
You must analyze the linearization of the inheritance graph to get a clear view
of the functions that will be called and their order, and always always add a
full suite of automated tests for your final crowdsale contract to make sure
that it enforces all the conditions.

To finish, I wanted to show you my repo where I will be doing
experiments with crowdsales and their tests:
[https://github.com/elopio/zeppelin-crowdsales](https://github.com/elopio/zeppelin-crowdsales)

Take a look at my
[PreSaleWithCapCrowdsale contract](https://github.com/elopio/zeppelin-crowdsales/blob/master/contracts/PreSaleWithCapCrowdsale.sol).
You will see that I preferred to be explicit about the conditions instead of
using `super`:

```
function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal {
  require(_beneficiary != address(0));
  require(_weiAmount != 0);
  require(block.timestamp >= openingTime || whitelist[_beneficiary]);
  require(block.timestamp <= closingTime);
  require(weiRaised.add(_weiAmount) <= cap);
}
```

I encourage you to join me on these experiments, to try different combinations
of crowdsales and to play switching the order of the inheritance graph. We will
learn more about the resulting code that Solidity compiles, we will improve our
mental picture of the execution stack, and we will practice writing tests
that fully cover all the possible paths. If you have questions, find
errors on the implementations in OpenZeppelin, or find an alternative
implementation that will make it easier to develop crowdsales on top of our
contracts, please
[let us know by sending a message to the slack channel](https://slack.openzeppelin.org/).
I am *elopio* in there.

Thanks a lot to [Ale](https://github.com/ajsantander) and
[Alejo](https://github.com/fiiiu), who worked on these new contracts and helped
me to understand them. <3
