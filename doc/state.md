

<!-- Start /Users/sebs/projects/coffee-fsm/src/state.coffee -->

## State 
h3 Example:

    state = new State
    state.addTransition new Transition

A State

## getStream()

Returns a bacon strea

### Return:

* **BaconStream** Stream of events

## isFinal()

Check if it this is a final state

### Return:

* **Boolean** final Is this final

## isInitial()

Check if this is a initial state

### Return:

* **Boolean** final Is this final

## enter()

Enter this state

Events
* enter fired when the state is entered

## enter()

Exit the State

Events
* exit fired when the state is exited

### Return:

* **Boolean** final Is this final

## addTransition()

Add a transition

.h3 Events
* transition_add fired when the transition is addeed

### Return:

* **Boolean** 

## FinalState 
h3 Example:

    state = new FinalState

A final state. This is the end of a fsm process
It can not transition to another state

## enter()

Exit the state
This methdod throws an exception. A final State is
final and does not need to be exited aka transitioned
to another state

## InitialState 
.h3 Example:

    state = new InitialState
    state.addTransition new Tansition

A initial state. This is the end of a fsm process

## enter()

Enter the state
This methdod throws an exception. A initial State is
initial and does not need to be entered aka transitioned
to

<!-- End /Users/sebs/projects/coffee-fsm/src/state.coffee -->

