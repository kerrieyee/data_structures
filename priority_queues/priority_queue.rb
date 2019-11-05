class PriorityQueue
  attr_reader :heap, :max_size, :size

  def initialize(size)
    @size = 0
    @max_size = size
    @heap = Array.new(size)
  end

  def heap_sort(arr)
    build_max_heap(arr)
    (arr.length - 1).times do
      val = @heap[0]
      @heap[0] = @heap[size - 1]
      @heap[size - 1] = val
      @size -= 1
      sift_down(@heap[0], 0)
    end
  end

  def build_max_heap(arr)
    @heap = arr
    @size = arr.length
    @max_size = arr.length

    (size/2).downto(0) do |i|
      sift_down(arr[i], i)
    end
    @heap
  end

  def get_max
    @heap[0]
  end

  def insert(e)
    raise "Array full" if @size == @max_size
    @size += 1
    new_i = @size - 1
    @heap[new_i] = e
    sift_up(e, new_i)
  end

  def extract_max
    return if @heap.empty?
    val = @heap[0]
    @heap[0] = @heap[@size - 1]
    @heap[@size - 1] = nil
    @size -= 1
    sift_down(@heap[0], 0)
    val
  end

  def change_priority(i, new_priority)
    return unless @heap[i]
    old_p = @heap[i]
    @heap[i] = new_priority
    if new_priority > old_p
      sift_up(new_priority, i)
    else
      sift_down(new_priority, i)
    end
  end

  def remove(i)
    return unless @heap[i]
    val = 1.0/0  #positive Infinity
    change_priority(i, val)
    extract_max
  end

private

  def left_index(i)
    (2*i) + 1
  end

  def right_index(i)
    (2*i) + 2
  end

  def sift_up(e, i)
    child_i = i
    #need to take into account array starting with index 0
    parent_i = child_i.zero? ?  0 : (child_i-1)/2

    while parent_i != child_i && @heap[child_i] > @heap[parent_i] do
      parent_val = @heap[parent_i]
      if parent_val < e
        @heap[parent_i] = e
        @heap[child_i] = parent_val
      end
      child_i = parent_i
      parent_i = child_i.zero? ?  0 : (child_i-1)/2
    end
  end

  def sift_down(e, i)
    current_i = i
    l = left_index(i)
    r = right_index(i)

    if l < size && @heap[l] > @heap[current_i]
      current_i = l
    end

    if r < size && @heap[r] > @heap[current_i]
      current_i = r
    end

    if current_i != i
      val = @heap[i]
      @heap[i] = @heap[current_i]
      @heap[current_i] = val
      sift_down(e, current_i)
    end
  end
end
