# Queues

# Methods
Enqueue - adds key
Dequeue - removes and returns LEAST recently added key
Empty - are there any elements?

## Implementations
- Linked List w/head & tail
  - Enqueue is list.push_back
  - Dequeue is list.topFront and list.popFront
  - Empty is list.empty?
  - Pros
    - 0(1) for all queue methods
    - you can keep adding elements without having to worry about anything
  - Cons
    - every node takes up extra space because it holds the value and the pointer.
- Circular Array
  - have a read and write to keep track of where should insert and where least recently added element is
  - once you hit the end of the array, you start from 0 to find empty spaces
  - if you try to enqueue and there's only one space in the array left it throws an error
  - Pros
    - only takes as much space per element as the value
    - 0(1) for all queue methods
  - Cons
    - you need to know how many elements you'll have from the beginning.  Resizing an array is expensive
    - you'll end up with extra space allocated
