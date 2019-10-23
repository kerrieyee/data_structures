require_relative '../../trees/tree'
require 'rspec'

describe Tree do
  let(:tree) { Tree.new }
  let(:node1) { TreeNode.new('Les') }
  let(:node2) { TreeNode.new('Cathy') }
  let(:node3) { TreeNode.new('Alex') }
  let(:node4) { TreeNode.new('Frank') }
  let(:node5) { TreeNode.new('Sam') }
  let(:node6) { TreeNode.new('Nancy') }
  let(:node7) { TreeNode.new('Tom') }
  let(:node8) { TreeNode.new('Tony') }
  let(:node9) { TreeNode.new('Wendy') }

  describe "#add_node" do
    context "tree is empty" do
      it "adds the root if root is empty" do
        expect{
          tree.add_node(nil, node1)
        }.to change{ tree.root }.from(nil).to(node1)
      end
    end

    context "tree is not empty" do
      before { tree.add_node(nil, node1) }

      it "udpates the root if inserting at root" do
        expect{
          tree.add_node(nil, node2)
        }.to change{ tree.root }.from(node1).to(node2)
        expect(node2.children[0]).to eql(node1)
      end

      it "updates children of the parent ndoe" do
        generate_tree
        expect(node1.children).to include(node2, node3, node4)
      end
    end
  end

  describe "#pre_order_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.pre_order_traversal).to eql(nil)
    end

    it "prints tree out in pre order order" do
      generate_tree
      expect { tree.pre_order_traversal }.to output("\"Les\"\n\"Cathy\"\n\"Sam\"\n\"Nancy\"\n\"Alex\"\n\"Tom\"\n\"Frank\"\n\"Tony\"\n\"Wendy\"\n").to_stdout
    end
  end

  describe "#post_order_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.post_order_traversal).to eql(nil)
    end

    it "prints tree out in post order order" do
      generate_tree
      expect { tree.post_order_traversal }.to output("\"Sam\"\n\"Nancy\"\n\"Cathy\"\n\"Tom\"\n\"Alex\"\n\"Tony\"\n\"Wendy\"\n\"Frank\"\n\"Les\"\n").to_stdout
    end
  end

  describe "#breadth_first_level_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.breadth_first_level_traversal).to eql(nil)
    end

    it "prints tree out in breadth first order" do
      generate_tree
      expect { tree.breadth_first_level_traversal }.to output("\"Les\"\n\"Cathy\"\n\"Alex\"\n\"Frank\"\n\"Sam\"\n\"Nancy\"\n\"Tom\"\n\"Tony\"\n\"Wendy\"\n").to_stdout
    end
  end

  def generate_tree
    #creates tree that looks like this
    #              Les
    #       /       |     \
    #   Cathy     Alex    Frank
    #   /    \      |     /   \
    # Sam   Nancy  Tom  Tony  Wendy
    tree.add_node(nil, node1) if tree.root.nil?
    tree.add_node(node1, node2)
    tree.add_node(node1, node3)
    tree.add_node(node1, node4)
    tree.add_node(node2, node5)
    tree.add_node(node2, node6)
    tree.add_node(node3, node7)
    tree.add_node(node4, node8)
    tree.add_node(node4, node9)
  end
end
