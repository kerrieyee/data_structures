class BinaryTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(key)
    #inserting at top
    return if key.nil?
    new_node = BinaryTreeNode.new(key)
    return @root = new_node if root.nil?

    parent_node = find_parent(root, new_node)

    if new_node.key < parent_node.key
      parent_node.left = new_node
    else
      parent_node.right = new_node
    end
  end

  def in_order_traversal(start = root.dup)
    return if start.nil?
    in_order_traversal(start.left) if start.left
    p start.key
    in_order_traversal(start.right) if start.right
  end

  def pre_order_traversal(start = root.dup)
    return if start.nil?
    p start.key
    pre_order_traversal(start.left) if start.left
    pre_order_traversal(start.right) if start.right
  end

  def post_order_traversal(start = root.dup)
    return if start.nil?
    post_order_traversal(start.left) if start.left
    post_order_traversal(start.right) if start.right
    p start.key
  end

  def breadth_first_level_traversal
    return if root.nil?
    queue = [root]
    while !queue.empty? do
      n = queue.shift
      p n.key
      queue << n.left if n.left
      queue << n.right if n.right
    end
  end

  private

  def find_parent(node, new_node, direction = 'center')
    return node if node.nil?

    if new_node.key < node.key
      return node unless node.left
      find_parent(node.left, new_node, 'left')
    else
      return node unless node.right
      find_parent(node.right, new_node, 'right')
    end
  end
end

class BinaryTreeNode
  attr_reader :key
  attr_accessor :left, :right

  def initialize(key)
    @key = key
    @right = nil
    @left = nil
  end
end

