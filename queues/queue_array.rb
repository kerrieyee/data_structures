class QueueArray
  attr_reader :read, :write, :num_elements, :arr
  def initialize(size)
    @read = 0
    @write = 0
    @num_elements = 0
    @arr = Array.new(size)
  end

  def enqueue(key)
    raise SystemStackError.new("Stack Overflow") if arr.length - 1 == num_elements
    arr[write] = key
    if write == arr.length - 1
      @write = 0
    else
      @write += 1
    end
    @num_elements += 1
  end

  def dequeue
    val = arr[read]
    arr[read] = nil
    if read == arr.length - 1
      @read = 0
    else
      @read += 1
    end
    @num_elements -= 1

    val
  end

  def empty?
    num_elements.zero?
  end
end
