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

    if node == head || node == tail
      if node == head
        @head = node.next
        @head.previous = nil if head
      end

      if node == tail
        @tail = tail.previous
        @tail.next = nil if tail
      end
    else
      prev_node = node.previous
      next_node = node.next
      prev_node.next = next_node
      next_node.previous = prev_node
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
