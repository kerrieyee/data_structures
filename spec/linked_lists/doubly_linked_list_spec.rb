require_relative '../../linked_lists/doubly_linked_list'
require 'rspec'

describe DoublyLinkedList do
  let(:dll) { DoublyLinkedList.new }
  let(:node_0) { Node.new(5) }
  let(:node_1) { Node.new(10) }
  let(:node_2) { Node.new(20) }
  let(:node_3) { Node.new(30) }

  describe "#push_front" do
    context "no items in list" do
      before { dll.push_front(node_0) }

      it "sets the head and tail to the new node" do
        expect(dll.head).to eql(node_0)
        expect(dll.tail).to eql(node_0)
      end

      it "next and previous should remain nil" do
        expect(dll.head.previous).to be_nil
        expect(dll.head.next).to be_nil
      end
    end

    context "one item already in list" do
      before { dll.push_front(node_1) }

      it "sets the head to the new node" do
        expect {
          dll.push_front(node_0)
        }.to change{ dll.head }.from(node_1).to(node_0)
      end

      it "doesn't update the tail" do
        expect {
          dll.push_front(node_0)
        }.to_not change{ dll.tail }
      end

      it "the next should be updated to the correct node" do
        expect {
          dll.push_front(node_0)
        }.to change{ dll.head.next }.from(nil).to(node_1)
      end

      it "updates the tail.previous" do
        expect {
          dll.push_front(node_0)
        }.to change{ dll.tail.previous }.from(nil).to(node_0)
      end
    end

    context "multiple items in list" do
      before do
        dll.push_front(node_2)
        dll.push_front(node_1)
        dll.push_front(node_0)
      end

      it "changes the previous of the original head node" do
        expect(dll.head.next.previous).to eql(node_0)
      end
    end
  end

  describe "#add_before" do
    let(:dll_multi) {
      dll.push_front(node_2)
      dll.push_front(node_1)
      dll.push_front(node_0)
      dll
    }

    it "raises an error if list is empty" do
      expect{ dll.add_before(node_0, node_1) }.to raise_error(RuntimeError)
    end

    it "updates the head if necessary" do
      expect {
        dll_multi.add_before(node_0, node_3)
      }.to change{ dll_multi.head }.from(node_0).to(node_3)
    end

    it "updates the next of the previous node" do
      expect {
        dll_multi.add_before(node_1, node_3)
      }.to change{ dll_multi.head.next }.from(node_1).to(node_3)
    end

    it "updates the previous of the existing node" do
      dll_multi.add_before(node_1, node_3)
      expect(dll_multi.head.next.next.previous).to eql(node_3)
    end

    it "updates the previous and the next of the new node" do
      dll_multi.add_before(node_1, node_3)
      new_node = dll_multi.head.next
      expect(new_node.next).to eql(node_1)
      expect(new_node.previous).to eql(node_0)
    end
  end

  describe "#delete" do
    it "raises an error if list is empty" do
      expect{ dll.delete(node_0) }.to raise_error(RuntimeError, "No nodes in the list")
    end

    # This causes O(1) to find if exists not sure if it's a requirement or not
    # it "raises an error if node doesn't exist in list" do
    #   dll.push_front(node_0)
    #   expect{ dll.delete(node_1) }.to raise_error(RuntimeError, "Node doesn't exist")
    # end

    context "only 1 node in list" do
      before { dll.push_front(node_0) }
      it "updates the head" do
        expect{
          dll.delete(node_0)
        }.to change{ dll.head }.from(node_0).to(nil)
      end

      it "updates the tail" do
        expect{
          dll.delete(node_0)
        }.to change{ dll.tail }.from(node_0).to(nil)
      end
    end

    context "multiple nodes in list" do
      before do
        dll.push_front(node_2)
        dll.push_front(node_1)
        dll.push_front(node_0)
      end

      it "updates the next of the previous node" do
        expect{
          dll.delete(node_1)
        }.to change{ dll.head.next }.from(node_1).to(node_2)
      end

      it "updates the previous of the following node" do
        expect{
          dll.delete(node_1)
        }.to change{ dll.tail.previous }.from(node_1).to(node_0)
      end

      it "updates the head if first node" do
        expect{
          dll.delete(node_0)
        }.to change{ dll.head }.from(node_0).to(node_1)
      end

      it "updates the tail if last node" do
        expect{
          dll.delete(node_2)
        }.to change{ dll.tail }.from(node_2).to(node_1)
      end
    end
  end

  describe "#size" do
    it "returns zero if no nodes in list" do
      expect(dll.size).to eql(0)
    end

    it "returns 1 if only 1 node in the list" do
      dll.push_front(node_0)
      expect(dll.size).to eql(1)
    end

    it "returns the correct count if more than 1 node in the list" do
      [node_1, node_2, node_3].each { |n| dll.push_front(n) }
      expect(dll.size).to eql(3)
    end
  end

  # def keys(dll)
  #   keys = [ dll.head.key ]
  #   current_node = dll.head
  #   until current_node.next.nil? do
  #     current_node = current_node.next
  #     keys << current_node.key
  #   end
  #   keys
  # end
end
