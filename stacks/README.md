# Stacks

##Call outs
- you can implement via linked list or array.  The specs are slightly different for the array specs.  Please read the comments in the spec/stack_spec.rb file

## Basic Methods
- Push - add key
- Top - fetch last added key
- Pop - remove last added key
- Empty - if stack is empty

## Implementations
- Linked List w/head & no tail
  - Pros
    - 0(1) for all stack methods
    - you can keep adding elements without having to worry about anything
  - Cons
    - every node takes up extra space because it holds the value and the pointer.
- Array
  - Pros
    - only takes as much space per element as the value
    - 0(1) for all stack methods
  - Cons
    - you need to know how many elements you'll have from the beginning.  Resizing an array is expensive
    - you'll end up with extra space allocated
