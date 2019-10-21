require_relative '../../linked_lists/singly_linked_list'
require 'rspec'

describe SinglyLinkedList do
  let(:sll) { SinglyLinkedList.new }
  let(:node) { Node.new(5) }
  let(:node_1) { Node.new(10) }
  let(:node_2) { Node.new(20) }
  let(:node_3) { Node.new(30) }

  describe "#empty?" do
    it "returns true if list is empty" do
      expect(sll.empty?).to be(true)
    end

    it "returns false if list has a node" do
      sll.push_front(node)
      expect(sll.empty?).to be(false)
    end
  end

  describe "#push_front" do
    before do
      sll.push_front(node)
    end

    it "adds a node to the front of the list" do
      expect{
        sll.push_front(node_1)
      }.to change{ sll.head.key }.from(node.key).to(node_1.key)
    end

    it "updates the next pointer on the node to be added" do
      expect{
        sll.push_front(node_1)
      }.to change{ sll.head.next }.from(nil).to(node)
    end

    it "updates the tail if there were no nodes in the list" do
      sll.push_front(node)
      expect(sll.head).to_not be_nil
      expect(sll.head).to eql(sll.tail)
    end
  end

  describe "#pop_front" do
    context "if no nodes in linked list" do
      it "raises an error if the list is empty" do
        expect{ sll.pop_front }.to raise_error(RuntimeError)
      end
    end

    context "if only one item in linked list" do
      it "sets head and tail to nil" do
        sll.push_front(node)
        expect(sll.tail).to eql(node)
        expect{
          sll.pop_front
        }.to change{sll.head}.from(node).to(nil)
        expect(sll.tail).to eql(nil)
      end
    end

    it "reallocates the head to point to the next node" do
      sll.push_front(node_1)
      sll.push_front(node)
      expect{
        sll.pop_front
      }.to change{ sll.head }.from(node).to(node.next)
    end
  end

  describe "#push_back" do
    before do
      sll.push_back(node)
    end

    it "adds a node to the back of the list" do
      expect{
        sll.push_back(node_1)
      }.to change{ sll.tail }.from(node).to(node_1)
    end

    it "updates the next pointer on the previous node" do
      expect{
        sll.push_back(node_1)
      }.to change{ sll.head.next }.from(nil).to(node_1)
    end

    it "updates the head if there were no nodes in the list" do
      sll.push_back(node)
      expect(sll.tail).to_not be_nil
      expect(sll.tail).to eql(sll.head)
    end
  end

  describe "#pop_back" do
    context "if no nodes in linked list" do
      it "raises an error if the list is empty" do
        expect{ sll.pop_back }.to raise_error(RuntimeError)
      end
    end

    context "if only one item in linked list" do
      it "sets head and tail to nil" do
        sll.push_front(node)
        expect(sll.tail).to eql(node)
        expect{
          sll.pop_back
        }.to change{sll.tail}.from(node).to(nil)
        expect(sll.head).to eql(nil)
      end
    end

    it "reallocates the tail to point to the next node" do
      sll.push_back(node)
      sll.push_back(node_1)
      expect{
        sll.pop_back
      }.to change{ sll.tail }.from(node_1).to(node)
    end
  end

  describe "#node_exists?" do
    context "if no nodes in linked list" do
      it "returns false" do
        expect(sll.node_exists?(node)).to eql(false)
      end
    end

    context "if there is only one node in the list" do
      before do
        sll.push_back(node)
      end

      it "returns false if the node does not exist" do
        expect(sll.node_exists?(node_1)).to eql(false)
      end

      it "returns true if the node exists" do
        expect(sll.node_exists?(node)).to eql(true)
      end
    end

    context "if there is more than one node in the list" do
      before do
        [node_1, node_2, node_3].each { |n| sll.push_front(n) }
      end

      it "returns false if the node does not exist" do
        expect(sll.node_exists?(node)).to eql(false)
      end

      it "returns true if the node exists" do
        sll.push_back(node)
        expect(sll.node_exists?(node)).to eql(true)
      end
    end
  end

  describe "#find_before" do
    context "if there are no nodes in linked list" do
      it "raises an error" do
        expect{ sll.find_before(node) }.to raise_error(RuntimeError)
      end
    end

    context "if node doesn't exist in linked list" do
      it "raises an error" do
        expect{ sll.find_before(node) }.to raise_error(RuntimeError)
      end
    end


    context "if there is more than one node in linked list" do
      before do
        [node_1, node_2, node_3].each { |n| sll.push_back(n) }
      end

      it "returns nil if the node is the head" do
        expect(sll.find_before(node_1)).to eql(nil)
      end

      it "returns the previous node" do
        expect(sll.find_before(node_2)).to eql(node_1)
      end
    end

    context "if only one node in linked list" do
      it "returns nil" do
        sll.push_back(node_1)
        expect(sll.find_before(node_1)).to eql(nil)
      end
    end
  end

  describe "#erase" do

    context "if there are no nodes in linked list" do
      it "raises an error" do
        expect{ sll.erase(node) }.to raise_error(RuntimeError)
      end
    end

    context "if node doesn't exist in linked list" do
      it "raises an error" do
        expect{ sll.erase(node) }.to raise_error(RuntimeError)
      end
    end

    context "if there is more than one node in linked list" do
      before do
        [node_1, node_2, node_3].each { |n| sll.push_back(n) }
      end

      context "node to erase is the head" do
        it "sets the head pointer correctly" do
          expect{
            sll.erase(node_1)
          }.to change{ sll.head }.from(node_1).to(node_2)
        end
      end
      context "node to erase is the tail" do
        it "sets the tail pointer correctly" do
          expect{
            sll.erase(node_3)
          }.to change{ sll.tail }.from(node_3).to(node_2)
        end
      end
      context "node is in the middle of the list" do
        it "should reset the next of the previous node properly" do
          expect{
            sll.erase(node_2)
          }.to change{ sll.head.next }.from(node_2).to(node_3)
        end
      end
    end

    context "if only one node in linked list" do
      it "should reset the head and tail to nil" do
        sll.push_front(node)
        expect(sll.tail).to eql(node)
        expect{
          sll.erase(node)
        }.to change{ sll.head }.from(node).to(nil)
        expect(sll.tail).to eql(nil)
      end
    end
  end

  describe "#add_before" do
    context "if no nodes in linked list" do
      it "raises an error" do
        expect{ sll.add_before(node, node_1) }.to raise_error(RuntimeError)
      end
    end

    context "if node doesn't exist in linked list" do
      it "raises an error" do
        sll.push_front(node_1)
        expect{ sll.add_before(node, node_2) }.to raise_error(RuntimeError)
      end
    end

    context "if there is more than one node in linked list" do
      before do
        [node_1, node_2].each { |n| sll.push_back(n) }
      end

      it "updates the previous node and added node properly" do
        sll.add_before(node_2, node)
        expect(sll.head.next).to eql(node)
        expect(sll.head.next.next).to eql(node_2)
      end
    end

    context "if only one node in linked list" do
      it "updates the head of the list" do
        sll.push_back(node_1)
        expect{
          sll.add_before(node_1, node)
        }.to change{ sll.head }.from(node_1).to(node)
      end
    end
  end

  describe "#add_after" do

    context "if no nodes in linked list" do
      it "raises an error" do
        expect{ sll.add_after(node, node_1) }.to raise_error(RuntimeError)
      end
    end

    context "if node doesn't exist in linked list" do
      it "raises an error" do
        sll.push_front(node_1)
        expect{ sll.add_after(node, node_2) }.to raise_error(RuntimeError)
      end
    end

    context "if there is more than one node in linked list" do
      before do
        sll.push_back(node_1)
        sll.push_back(node_2)
      end

      it "updates the previous node and added node properly" do
        sll.add_after(node_1, node)
        expect(sll.head.next).to eql(node)
        expect(sll.head.next.next).to eql(node_2)
      end
    end

    context "if only one node in linked list" do
      it "updates the tail of the list" do
        sll.push_back(node_1)
        expect{
          sll.add_after(node_1, node)
        }.to change{ sll.tail }.from(node_1).to(node)
      end
    end
  end

  describe "#size" do
    it "returns zero if no nodes in list" do
      expect(sll.size).to eql(0)
    end

    it "returns 1 if only 1 node in the list" do
      sll.push_back(node)
      expect(sll.size).to eql(1)
    end

    it "returns the correct count if more than 1 node in the list" do
      [node_1, node_2, node_3].each { |n| sll.push_front(n) }
      expect(sll.size).to eql(3)
    end
  end

  describe "#reverse" do
    it "raises an error if list is empty" do
      expect{ sll.reverse }.to raise_error(RuntimeError)
    end

    it "does nothing if only 1 node in list" do
      sll.push_back(node)
      expect{
        sll.reverse
      }.to_not change{sll}
    end

    it "reverses the list if more than 1 node" do
      [node, node_1, node_2, node_3].each { |n| sll.push_back(n) }
      expect(sll.head).to eql(node)
      expect(sll.tail).to eql(node_3)
      sll.reverse
      expect(sll.head).to eql(node_3)
      expect(sll.tail).to eql(node)
      expect(sll.head.next).to eql(node_2)
    end
  end

  describe "#get_nth_node" do
    it "raises an error if list is empty" do
      expect{ sll.get_nth_node(0) }.to raise_error(RuntimeError)
    end

    it "raises an error if arguments are improper" do
      expect{ sll.get_nth_node("hi") }.to raise_error(RuntimeError)
    end

    it "returns the correct node" do
      [node, node_1, node_2, node_3].each { |n| sll.push_back(n) }
      expect(sll.get_nth_node(2)).to eql(node_2)
      expect(sll.get_nth_node(0)).to eql(node)
      expect(sll.get_nth_node(3)).to eql(node_3)
    end
  end

  describe "#get_middle_node" do
    #https://www.geeksforgeeks.org/write-a-c-function-to-print-the-middle-of-the-linked-list/
    it "raises an error if list is empty" do
      expect{ sll.get_middle_node }.to raise_error(RuntimeError)
    end

    it "returns the only node if only 1 node" do
      sll.push_back(node)
      expect(sll.get_middle_node).to eql("The middle element is [#{node.key}]")
    end

    it "returns the middle node key if odd number of nodes" do
      [node_1, node_2, node_3].each { |n| sll.push_back(n) }
      expect(sll.get_middle_node).to eql("The middle element is [#{node_2.key}]")
    end

    it "returns the middle node key if even number of nodes" do
      [node, node_1, node_2, node_3].each { |n| sll.push_back(n) }
      expect(sll.get_middle_node).to eql("The middle element is [#{node_2.key}]")
    end
  end
end
