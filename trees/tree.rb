class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def add_node(parent_node, new_node)
    #inserting at top
    if parent_node.nil?
      return @root = new_node if root.nil?
      new_node.children << @root
      @root = new_node
    else
      parent_node.children << new_node
    end
  end

  def pre_order_traversal(start = root.dup)
    return if start.nil?
    p start.key
    start.children.each do | child |
      pre_order_traversal(child)
    end
  end

  def post_order_traversal(start = root.dup)
    return if start.nil?
    start.children.each do | child |
      post_order_traversal(child)
    end
    p start.key
  end

  def breadth_first_level_traversal
    return if root.nil?
    queue = [root]
    while !queue.empty? do
      n = queue.shift
      p n.key
      n.children.each do |c|
        queue << c
      end
    end
  end
end

class TreeNode
  attr_reader :key
  attr_accessor :children

  def initialize(key)
    @key = key
    @children = []
  end
end

