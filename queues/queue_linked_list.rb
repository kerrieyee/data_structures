require_relative '../linked_lists/singly_linked_list'

class QueueLinkedList
  def initialize
    @list = SinglyLinkedList.new
  end

  def enqueue(key)
    @list.push_back(Node.new(key))
  end

  def dequeue
    val = @list.head.key
    @list.pop_front
    val
  end

  def empty?
    @list.empty?
  end
end
