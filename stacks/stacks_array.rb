class StackArray
  attr_reader :num_elements, :arr
  def initialize(size)
    @size = size
    @arr = Array.new(size)
    @num_elements = 0
  end

  def push(value)
    raise SystemStackError.new("Stack Overflow") if @size - 1 == num_elements
    arr[num_elements] = value
    @num_elements += 1
  end

  def top
    arr[num_elements - 1]
  end

  def pop
    old_top = top
    arr[num_elements - 1] = nil
    @num_elements -= 1
    old_top
  end

  def empty?
    p num_elements
    num_elements.zero?
  end
end
