require_relative '../../stacks/stack.rb'
require 'rspec'

#comment out the different specs depending on your implementation.

describe Stack do
  #if array implementation uncomment this
  # let (:stack) { Stack.new(10) }
  #if linked list implementation uncomment this
  let(:stack) { Stack.new }

  describe "#push" do
    it "adds the element to the stack" do
      expect {
        stack.push(5)
      }.to change{ stack.top }.from(nil).to(5)
    end

    #if array implementation uncomment this
    # it "raises a stack overflow error if not enough space in array" do
    #   expect{ Stack.new(1).push(5) }.to raise_error(SystemStackError, "Stack Overflow")
    # end
  end

  describe "#empty?" do
    it "returns true if nothing in the stack" do
      expect(stack.empty?).to eql(true)
    end

    it "returns false if something in the stack" do
      stack.push("5")
      expect(stack.empty?).to eql(false)
    end
  end

  describe "#top" do
    it "returns the most recent element added" do
      stack.push(1)
      stack.push(2)
      expect(stack.top).to eql(2)
    end

    it "returns nil if it doesn't exist" do
      expect(stack.top).to eql(nil)
    end
  end

  describe "#pop" do
    it "returns the popped value" do
      stack.push(1)
      expect(stack.pop).to eql(1)
    end

    it "removes the element from the stack if only one element" do
      stack.push(1)
      expect{
        stack.pop
      }.to change{ stack.empty? }.from(false).to(true)
    end

    it "removes the element from the stack" do
      stack.push(1)
      stack.push(2)
      expect{
        stack.pop
      }.to_not change{ stack.empty? }
      expect(stack.top).to eql(2)
    end
  end
end
