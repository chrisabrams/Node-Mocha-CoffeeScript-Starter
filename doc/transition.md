

<!-- Start /Users/sebs/projects/coffee-fsm/src/transition.coffee -->

## Transition 
h3 Example:

    transition = new Transition

A Transition from one state to another

## setTargetState(targetstate, evl)

Set a target state. It will be returned upon transition or sent via a event

### Params: 

* **Object** *targetstate* State to transition to
* **Function** *evl* Method to be eval'ed to check if transition is ok

## trigger(cb)

Evaluate if a state change is possible

### Params: 

* **Function** *cb* callback

### Return:

* **Boolean** evaled result of cb or false if no cb was given

the base class just evaluates the given function

## StringTransition

A transition that checks a given string against an internal one

## StringTransition(string)

Constructor

### Params: 

* **String** *string* to check

## trigger(param)

Evaluate the given param with the internal string

### Params: 

* **String** *param* string to check

<!-- End /Users/sebs/projects/coffee-fsm/src/transition.coffee -->

