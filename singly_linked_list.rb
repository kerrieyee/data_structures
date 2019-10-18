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
end

class Node
  attr_reader :key
  attr_accessor :next
  def initialize(key, next_node)
    @key = key
    @next = next_node
  end
end

