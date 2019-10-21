class DoublyLinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def push_front(node)
    if head.nil?
      @head = node
      @tail = node
    else
      head.previous = node
      node.next = head
      @head = node
    end
  end

  def add_before(existing_node, new_node)
    raise "No nodes in the list" if head.nil?
    if head == existing_node
      push_front(new_node)
    else
      previous_node = existing_node.previous
      existing_node.previous = new_node
      new_node.next = existing_node
      new_node.previous = previous_node
      previous_node.next = new_node
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

  def delete(node)
    raise "No nodes in the list" if head.nil?
    if node == head
      @head = node.next
    end

    if node == tail
      @tail = node.previous
    end

    if !node.next.nil?
      node.next.previous = node.previous
    end

    if !node.previous.nil?
      node.previous.next = node.next
    end
  end

  # private

  # def find(node)
  #   raise "No nodes in the list" if head.nil?
  #   current_node = head
  #   until current_node == node || current_node.next.nil?
  #     current_node = current_node.next
  #   end
  #   raise "Node doesn't exist" if current_node != node
  #   current_node
  # end
end


class Node
  attr_reader :key
  attr_accessor :next, :previous
  def initialize(key, next_node = nil, previous_node = nil)
    @key = key
    @next = next_node
    @previous = previous_node
  end
end
