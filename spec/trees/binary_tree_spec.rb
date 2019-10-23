require_relative '../../trees/binary_tree'
require 'rspec'

describe BinaryTree do
  let(:tree) { BinaryTree.new }

  describe "#insert" do
    context "tree is empty" do
      it "adds the root if root is empty" do
        tree.insert('Les')
        expect(tree.root.key).to eql('Les')
      end
    end

    context "tree is not empty" do
      it "places the key in order" do
        generate_tree
        expect(tree.root.right.key).to eql('Sam')
        expect(tree.root.left.key).to eql('Cathy')
        expect(tree.root.left.left.key).to eql('Alex')
        expect(tree.root.left.right.key).to eql('Frank')
        expect(tree.root.right.right.key).to eql('Violet')
        expect(tree.root.right.left.key).to eql('Nancy')
      end
    end
  end

  describe "#in_order_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.in_order_traversal).to eql(nil)
    end

    it "prints tree out in order" do
      generate_tree
      expect { tree.in_order_traversal }.to output("\"Alex\"\n\"Cathy\"\n\"Frank\"\n\"Les\"\n\"Nancy\"\n\"Sam\"\n\"Violet\"\n").to_stdout
    end
  end

  describe "#pre_order_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.pre_order_traversal).to eql(nil)
    end

    it "prints tree out in pre order order" do
      generate_tree
      expect { tree.pre_order_traversal }.to output("\"Les\"\n\"Cathy\"\n\"Alex\"\n\"Frank\"\n\"Sam\"\n\"Nancy\"\n\"Violet\"\n").to_stdout
    end
  end

  describe "#post_order_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.post_order_traversal).to eql(nil)
    end

    it "prints tree out in post order order" do
      generate_tree
      expect { tree.post_order_traversal }.to output("\"Alex\"\n\"Frank\"\n\"Cathy\"\n\"Nancy\"\n\"Violet\"\n\"Sam\"\n\"Les\"\n").to_stdout
    end
  end

  describe "#breadth_first_level_traversal" do
    it "returns nothing if there's nothing in the tree" do
      expect(tree.breadth_first_level_traversal).to eql(nil)
    end

    it "prints tree out in post order order" do
      generate_tree
      expect { tree.breadth_first_level_traversal }.to output("\"Les\"\n\"Cathy\"\n\"Sam\"\n\"Alex\"\n\"Frank\"\n\"Nancy\"\n\"Violet\"\n").to_stdout
    end
  end

  def generate_tree
    #creates tree that looks like this
    #            Les
    #       /          \
    #   Cathy         Sam
    #   /    \        /   \
    # Alex   Frank   Nancy  Violet
    tree.insert('Les')
    tree.insert('Cathy')
    tree.insert('Sam')
    tree.insert('Alex')
    tree.insert('Frank')
    tree.insert('Nancy')
    tree.insert('Violet')
  end
end
