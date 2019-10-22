class StackLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(key)
    n = Node.new(key)
    n.next = head.next if head
    @head = n
  end

  def top
    return nil if @head.nil?
    head.key
  end

  def pop
    old_key = head.key
    @head = head.next
    old_key
  end

  def empty?
    @head.nil?
  end
end

class Node
  attr_reader :key
  attr_accessor :next

  def initialize(key)
    @key = key
    @next = nil
  end
end
