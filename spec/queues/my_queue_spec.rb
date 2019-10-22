require_relative '../../queues/my_queue'
require 'rspec'

#Queue is a class in rails so you can't name it queue
describe MyQueue do
  #if array implementation uncomment this and comment line below
  let(:queue) { MyQueue.new }
  #if array implementation uncomment this and comment the line above
  # let(:queue) { MyQueue.new(5) }

  describe "#enqueue" do
    it "adds an element to the queue" do
      queue.enqueue(5)
      expect(queue.empty?).to eql(false)
    end

    # if array implementation uncomment this
    # it "raises a stack overflow error if not enough space in array" do
    #   expect{ MyQueue.new(1).enqueue(5) }.to raise_error(SystemStackError, "Stack Overflow")
    # end
  end

  describe "#dequeue" do
    before { queue.enqueue(5) }

    it "removes an element from the queue" do
      expect{
        queue.dequeue
      }.to change{ queue.empty? }.from(false).to(true)
    end

    it "returns the removed element" do
      queue.enqueue(4)
      queue.enqueue(3)
      queue.dequeue
      queue.enqueue(2)
      queue.enqueue(1)
      expect(queue.dequeue).to eql(4)
    end
  end

  describe "#empty?" do
    it "returns true if no elements exist" do
      expect(queue.empty?).to eql(true)
    end

    it "returns false if elements exist" do
      queue.enqueue(5)
      expect(queue.empty?).to eql(false)
    end
  end
end
