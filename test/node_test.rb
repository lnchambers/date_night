require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/node"

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new("score")

    assert_instance_of Node, node
  end

  def test_node_accepts_score
    node = Node.new(99)

    data = node.data

    assert_equal 99, data
  end

  def test_node_accepts_different_score
    node = Node.new(2)

    data = node.data

    assert_equal 2, data
  end

  def test_node_differentiates_path
    node = Node.new(99)

    left = node.left
    right = node.right

    assert_nil left
    assert_nil right
  end
end
