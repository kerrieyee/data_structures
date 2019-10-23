
# Trees

## Generic Trees or n-ary Trees
- Node Properties
  - Key
  - Children - list of children nodes

## Binary Tree
- Binary trees are special cases of tree where every node has at most two children.
- Node Properties
  - Key
  - Left
  - Right
- Types of Binary Tree
  - A degenerate (or pathological) tree: A Tree where every internal node has one child. Such trees are performance-wise same as linked list.
  - Binary Search Tree
    - Properties
      - no duplicate values, each value is unique
      - the left subtree of a node only contains values less than itself
      - the right subtree of a node only contain values greater than itself

## Methods
- add_node - mostly to generate trees to traverse
- Depth First Search
  - In order traversal - best for binary tree
  - Pre order traversal - can be used for trees with more than 2 children
  - Post order traversal - can be used for trees with more than 2 children
- Breadth First Search

