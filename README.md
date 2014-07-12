# A simple finite state machine
Attempt to implement a finite state machine for node in coffeescript

[![Build Status](https://travis-ci.org/sebs/coffee-fsm.svg)](https://travis-ci.org/sebs/coffee-fsm)

## Example

```coffeescript
s1 = new State
s2 = new State
t1 = new StringTransition 'Hello'
t2 = new StringTransition 'world'
machine = new Machine
machine.addState s1
machine.addState s2
machine.addState done
```

# Installation, Development and Testing

# Installation
You will need Node.js and CoffeeScript to begin. Then:

```shell
npm install
```
## Run Tests
```shell
npm test
```
Used for testing:

* Node.js
* Mocha
* Chai
* Expect.js.

## Lint

Lint the tests
```shell
gulp lint-test
```

Lint the source
```shell
gulp lint-test
```
## Generate API docs

Api docs as markdown files
```shell
gulp doc
```

