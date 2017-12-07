require "minitest/autorun"
require "minitest/pride"
require "pry"
require_relative "../lib/binary_search_tree.rb"

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    binary_search_tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, binary_search_tree
  end

  def test_insert
    binary = BinarySearchTree.new

    insert = binary.insert(99, "Cloud Atlas")

    assert_equal 99, insert.score
  end

  def test_insert_five
    binary = BinarySearchTree.new

    binary.insert(99, "Cloud Atlas")
    binary.insert(2, "any Nicholas Cage movie")
    binary.insert(50, "Matt Damon!!!")
    binary.insert(98, "A Muppets Christmas Carol")
    binary.insert(74, "Home Alone")

    assert_equal 99, binary.root.score
    assert_equal 2,  binary.root.left.score
    assert_equal 50, binary.root.left.right.score
    assert_equal 98, binary.root.left.right.right.score
    assert_equal 74, binary.root.left.right.right.left.score
  end

  def test_include_true_or_false
    binary = BinarySearchTree.new

    binary.insert(50, "Matt Damon!!!")
    binary.insert(43, "Not Matt Damon!!!")
    binary.insert(99, "Cloud Atlas")
    binary.insert(51, "Matt Damon as Jason Bourne!!!")

    assert binary.include?(50)
    assert binary.include?(43)
    assert binary.include?(51)
    assert binary.include?(99)
    refute binary.include?(33)
  end

  def test_depth_of
    binary = BinarySearchTree.new

    assert_equal "Score not included", binary.depth_of(45)

    binary.insert(50, "Matt Damon!!!")
    binary.insert(43, "Not Matt Damon!!!")
    binary.insert(99, "Cloud Atlas")
    binary.insert(51, "Matt Damon as Jason Bourne!!!")

    assert_equal 0, binary.depth_of(50)
    assert_equal 1, binary.depth_of(43)
    assert_equal 1, binary.depth_of(99)
    assert_equal 2, binary.depth_of(51)
  end

  def test_max
    binary = BinarySearchTree.new

    binary.insert(35, "Cloud Atlas")
    binary.insert(61, "Peter Pan")
    binary.insert(1, "Any Nicholas Cage Movie")
    binary.insert(54, "Seagulls; Stop It Now")

    assert_equal [61 => "Peter Pan"], binary.max

  end

  def test_min
    binary = BinarySearchTree.new

    binary.insert(35, "Cloud Atlas")
    binary.insert(61, "Peter Pan")
    binary.insert(1, "Any Nicholas Cage Movie")
    binary.insert(54, "Seagulls; Stop It Now")

    assert_equal [1 => "Any Nicholas Cage Movie"], binary.min
  end

  def test_sort
    binary = BinarySearchTree.new

    binary.insert(50, "Cloud Atlas")
    binary.insert(61, "Peter Pan")
    binary.insert(35, "Any Nicholas Cage Movie")
    binary.insert(27, "Nightmare")
    binary.insert(72, "Spiderman")

    assert_equal [{27 => "Nightmare"},
      {35 => "Any Nicholas Cage Movie"},
      {50 => "Cloud Atlas"},
      {61 => "Peter Pan"},
      {72 => "Spiderman"}], binary.sort
  end

  def test_load
    binary = BinarySearchTree.new

    binary.load('./lib/movies.txt')

    assert binary.include?(0)
    assert binary.include?(25)
    assert binary.include?(100)
  end

  def test_health
    skip
    health = BinarySearchTree.new
  end

# Below here are extensions

  def test_leaves
    skip
    leaves = BinarySearchTree.new
  end

  def test_height
    skip
    height = BinarySearchTree.new
  end

  def test_delete
    skip
    binary = BinarySearchTree.new

    insert = binary.insert(1, "Any Nicholas Cage Movie")
    insert2 = binary.insert(99, "Cloud Atlas")
    insert3 = binary.insert(98, "Muppets Christmas Carol")
    insert4 = binary.insert(100, "Matt Damon")
    includes = binary.includes?(1)
    includes2 = binary.includes?(99)
    includes3 = binary.includes?(98)
    includes4 = binary.includes?(100)

    assert includes
    assert includes2
    assert includes3
    assert includes4

    binary.delete(1)

    refute includes
    assert includes2
    assert includes3
    assert includes4
  end
end
