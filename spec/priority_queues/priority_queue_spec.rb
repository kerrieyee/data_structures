require_relative '../../priority_queues/priority_queue'
require 'rspec'

describe PriorityQueue do
  let(:pq) { PriorityQueue.new(size=10) }

  describe "#initialize" do
    it "sets the max_size" do
      expect(pq.max_size).to eql(10)
    end

    it "sets the size" do
      expect(pq.size).to eql(0)
    end

    it "creates the heap of the correct size" do
      expect(pq.heap.length).to eql(10)
    end
  end

  describe "#insert" do

    context 'heap hits max size' do
      it "raises an error if the array hits max size" do
        pq = PriorityQueue.new(size = 1)
        pq.insert(10)
        expect{ pq.insert(10) }.to raise_error(RuntimeError)
      end
    end

    context 'empty heap' do
      it 'inserts an element into the heap' do
        pq.insert(10)
        expect(pq.heap[0]).to eql(10)
        expect(pq.size).to eql(1)
      end
    end

    context 'many elements in heap' do
      it 'sifts the element to the correct place' do
        pq.insert(42)
        pq.insert(29)
        pq.insert(18)
        pq.insert(14)
        pq.insert(7)
        pq.insert(18)
        pq.insert(12)
        pq.insert(11)
        expect {
          pq.insert(30)
        }.to change{ pq.heap }.from([42, 29, 18, 14, 7, 18, 12, 11, nil, nil]).to([42, 30, 18, 29, 7, 18, 12, 11, 14, nil])
      end
    end
  end

  describe "#extract_max" do
    context "queue empty" do
      it "should do nothing?" do
        expect{
          pq.extract_max
        }.to_not change{ pq.heap.length }
      end

    end

    context "queue has 1 element" do
      it "empties the queue" do
        pq.insert(42)
        expect{
          pq.extract_max
        }.to change{ pq.size }.from(1).to(0)
      end

      it "returns the correct value" do
        pq.insert(42)
        expect(pq.extract_max).to eql(42)
      end
    end

    context "queue has many elements" do
      before do
        pq.insert(42)
        pq.insert(30)
        pq.insert(18)
        pq.insert(29)
        pq.insert(7)
        pq.insert(18)
        pq.insert(12)
        pq.insert(11)
        pq.insert(14)
      end

      it "returns the correct value" do
        expect(pq.extract_max).to eql(42)
      end

      it "removes the max element from the heap" do
        pq.extract_max
        expect(pq.heap.index(42)).to eql(nil)
      end

      it "the heap should be reorganized in the right order" do
        pq.extract_max
        expect(pq.heap).to eql([30, 29, 18, 14, 7, 18, 12, 11, nil, nil])
      end
    end
  end

  describe "#get_max" do
    it "returns nil if nothing in the heap" do
      expect(pq.get_max).to eql(nil)
    end

    it "returns the root if elements in the heap" do
      pq.insert(42)
      pq.insert(30)
      pq.insert(18)
      pq.insert(29)
      expect(pq.get_max).to eql(42)
    end
  end

  describe "#change_priority" do
    it "does nothing if the queue is empty" do
      pq.change_priority(10, 12)
      expect(pq.size).to eql(0)
    end

    it "updates the priority of the element if only 1 element in heap" do
      pq.insert(42)
      pq.change_priority(0, 12)
      expect(pq.get_max).to eql(12)
    end

    context "many elements in heap" do
      let(:pq) { PriorityQueue.new(size = 5) }
      before do
        pq.insert(42)
        pq.insert(30)
        pq.insert(18)
        pq.insert(29)
      end

      it "updates the priority" do
        expect{
          pq.change_priority(3, 28)
        }.to change{ pq.heap[3] }.from(29).to(28)
      end

      it "moves up element to the correct spot" do
        expect{
          pq.change_priority(3, 50)
        }.to change{ pq.heap }.from([42, 30, 18, 29, nil]).to([50, 42, 18, 30, nil])
      end

      it "moves down element to the correct spot" do
        expect{
          pq.change_priority(3, 50)
        }.to change{ pq.heap }.from([42, 30, 18, 29, nil]).to([50, 42, 18, 30, nil])
      end
    end
  end

  describe "#remove" do
    it "does nothing if the element doesn't exist" do
      expect {
        pq.remove(0)
      }.to_not change{ pq.heap }
    end
    context "1 item in heap" do
      it "returns the priority that is removed" do
        pq.insert(5)
        pq.remove(0)
        expect(pq.size).to eql(0)
      end
    end

    context "many items in the heap" do
      before do
        pq.insert(42)
        pq.insert(30)
        pq.insert(18)
        pq.insert(29)
        pq.insert(7)
        pq.insert(18)
        pq.insert(12)
        pq.insert(11)
        pq.insert(14)
      end

      it "reorders the elements properly" do
        expect{
          pq.remove(3)
        }.to change{ pq.heap }.from([42, 30, 18, 29, 7, 18, 12, 11, 14, nil]).to([42, 30, 18, 14, 7, 18, 12, 11, nil, nil])
      end
    end
  end
end
