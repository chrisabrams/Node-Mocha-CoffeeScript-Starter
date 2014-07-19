

<!-- Start /Users/sebs/projects/coffee-fsm/src/machine.coffee -->

## Machine A state machine 
.h3 Example

```
 javascript
 s1 = new State
 s2 = new State
 t1 = new StringTransition 'Hello'
 t2 = new StringTransition 'world'
 machine = new Machine
 machine.addState s1
 machine.addState s2
 machine.addState done
```

A state machine

## addState()

Add a State to the state machine

## setInitialState()

Set the initial state for the state machine

## run()

Start the state machine and trigger the initial state
* started

###. Example:fff

```
 machine.on -> true
```

## stop Events
* stopped()

Stop this state machine

<!-- End /Users/sebs/projects/coffee-fsm/src/machine.coffee -->

