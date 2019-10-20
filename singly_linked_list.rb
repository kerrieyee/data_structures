class SinglyLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def empty?
    head.nil?
  end

  def push_front(node)
    @tail = node
    node.next = head if head
    @head = node
  end

  def pop_front
    raise "No nodes to remove" if head.nil?
    old_head = head
    @head = head.next
    if head.nil?
      @tail = nil
    end
  end

  def push_back(node)
    if head.nil?
      @head = node
    else
      tail.next = node
    end
    @tail = node
  end

  def pop_back
    raise "No nodes to remove" if tail.nil?
    prev = find_before(tail)
    if prev
      prev.next = nil
      @tail = prev
    else
      @head = nil
      @tail = nil
    end
  end

  def node_exists?(node)
    return false if head.nil?
    current_node = head
    until current_node == node || current_node.next.nil?
      current_node = current_node.next
    end
    current_node == node
  end

  def find_before(node)
    raise "No nodes in the list" if head.nil?
    current_node = head
    previous_node = nil
    until current_node == node || current_node.next.nil?
      previous_node = current_node
      current_node = current_node.next
    end
    raise "Node doesn't exist" if current_node != node
    previous_node
  end

  def erase(node)
    raise "No nodes to remove" if head.nil?
    if node == head
      pop_front
    elsif node == tail
      pop_back
    else
      previous_node = find_before(node)
      previous_node.next = node.next
    end
  end

  def add_before(existing_node, new_node)
    raise "No nodes in the list" if head.nil?
    if existing_node == head
      push_front(new_node)
    else
      previous_node = find_before(existing_node)
      previous_node.next = new_node
      new_node.next = existing_node
    end
  end

  def add_after(existing_node, new_node)
    raise "No nodes in the list" if head.nil?
    if existing_node == tail
      push_back(new_node)
    else
      raise "Node does not exist" if !node_exists?(existing_node)
      new_node.next = existing_node.next
      existing_node.next = new_node
    end
  end

  def size
    return 0 if head.nil?
    return 1 if head.next.nil?
    count = 1
    current_node = @head
    until current_node.next.nil? do
      count += 1
      current_node = current_node.next
    end
    count
  end

  def reverse
    raise "No nodes in the list" if head.nil?
    return if @head.next.nil?
    curr_node = head
    until curr_node.next.nil? do
      next_node = curr_node.next
      curr_node.next = next_node.next
      push_front(next_node)
    end
    @tail = curr_node
  end

  def get_keys
    keys = [ @head.key ]
    current_node = @head
    until current_node.next.nil? do
      current_node = current_node.next
      keys << current_node.key
    end
    keys
  end

  def get_nth_node(n)
    raise "n must be a number greater than zero" unless n.is_a?(Integer) && n >= 0
    raise "No nodes in the list" if empty?
    curr_index = 0
    current_node = @head
    until curr_index == n do
      current_node = current_node.next
      curr_index += 1
    end
    current_node
  end

  def get_middle_node
    raise "No nodes in the list" if empty?
    fast = head
    slow = head
    while fast != nil && fast.next != nil do
      slow = slow.next
      fast = fast.next.next
    end

    "The middle element is [#{slow.key}]"
  end

  def get_middle_node_slow
    #inefficient_way
    raise "No nodes in the list" if empty?
    n = size/2
    get_nth_node(n)
    "The middle element is [#{n.key}]"
  end
end

class Node
  attr_reader :key
  attr_accessor :next
  def initialize(key, next_node)
    @key = key
    @next = next_node
  end
end

