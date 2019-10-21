# Linked Lists

## Basic Methods
| Method               | definition           |
|----------------------|----------------------|
| PushFront(Key)       | add to front         |
| TopFront             | return front item    |
| PopFront             | remove front item    |
| PushBack(Key)        | add to back          |
| TopBack              | return back item     |
| PopBack              | remove back item     |
| Find(Key)            | is key in list?      |
| Erase(Key)           | remove key from list |
| Empty()              | empty list?          |
| AddBefore(Node, Key) | adds key before node |
| AddAfter(Node, Key)  | adds key after node  |

## Differences between differnt types of linked lists

|                      | singly linked  w/no tail | singly linked  w/ tail | doubly linked |
|----------------------|--------------------------|------------------------|---------------|
| PushFront(Key)       | O(1)                     | O(1)                   | O(1)          |
| TopFront             | O(1)                     | O(1)                   | O(1)          |
| PopFront             | O(1)                     | O(1)                   | O(1)          |
| PushBack(Key)        | O(n)                     | O(1)                   | O(1)          |
| TopBack              | O(n)                     | O(1)                   | O(1)          |
| PopBack              | O(n)                     | O(n)                   | O(1)          |
| Find(Key)            | O(n)                     | O(n)                   | O(n)          |
| Erase(Key)           | O(n)                     | O(n)                   | O(n)          |
| Empty()              | O(1)                     | O(1)                   | O(1)          |
| AddBefore(Node, Key) | O(n)                     | O(n)                   | O(1)          |
| AddAfter(Node, Key)  | O(1)                     | O(1)                   | O(1)          |
