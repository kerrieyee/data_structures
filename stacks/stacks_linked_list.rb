class StackLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(value)
    n = Node.new(value)
    n.next = head.next if head
    @head = n
  end

  def top
    return nil if @head.nil?
    head.value
  end

  def pop
    old_value = head.value
    @head = head.next
    old_value
  end

  def empty?
    @head.nil?
  end
end

class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end
