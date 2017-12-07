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
    node = Node.new(99, "movie")

    score = node.score
    movie = node.movie

    assert_equal 99, score
    assert_equal "movie", movie
  end

  def test_node_accepts_different_score
    node = Node.new(2, "movie")

    score = node.score
    movie = node.movie

    assert_equal 2, score
    assert_equal "movie", movie
  end

  def test_node_accepts_different_movie
    node = Node.new(99, "movie")
    node2 = Node.new(99, "movie2")

    score = node.score
    movie = node.movie
    score2 = node2.score
    movie2 = node2.movie

    assert_equal 99, score
    assert_equal "movie", movie
    assert_equal 99, score2
    assert_equal "movie2", movie2
  end

  def test_node_differentiates_path
    node = Node.new(99, "movie")

    left = node.left
    right = node.right

    assert_nil left
    assert_nil right
  end
end
