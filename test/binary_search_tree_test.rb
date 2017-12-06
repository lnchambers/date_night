require "minitest/autorun"
require "minitest/pride"
require "pry"
require_relative "../lib/binary_search_tree.rb"

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    binary_search_tree = BinarySearchTree.new(nil, "")

    assert_instance_of BinarySearchTree, binary_search_tree
  end

  def test_insert
    binary = BinarySearchTree.new(nil, "")

    insert = binary.insert(99, "Cloud Atlas")

    assert_equal 99, insert.score
  end

  def test_insert_four
    binary = BinarySearchTree.new(nil, "")

    insert1 = binary.insert(99, "Cloud Atlas")
    insert2 = binary.insert(2, "any Nicholas Cage movie")
    insert3 = binary.insert(50, "Matt Damon!!!")
    insert4 = binary.insert(98, "A Muppets Christmas Carol")

    assert_equal 99, insert1.score
    assert_equal 2,  insert2.score
    assert_equal 50, insert3.score
    assert_equal 98, insert4.score
  end

  def test_include_true_or_false
    binary = BinarySearchTree.new(nil, "Matt Damon!!!")

    binary.insert(50, "Matt Damon!!!")
    binary.insert(43, "Not Matt Damon!!!")
    binary.insert(99, "Cloud Atlas")
    binary.insert(51, "Matt Damon as Jason Bourne!!!")

    assert binary.include?(50)
    refute binary.include?(98)
  end

  def test_depth_of
    skip
    binary = BinarySearchTree.new(52, "Matt Damon's Puppy!!!!")

    assert_nil binary.depth_of(45)

    binary.insert(50, "Matt Damon!!!")
    binary.insert(43, "Not Matt Damon!!!")
    binary.insert(99, "Cloud Atlas")
    binary.insert(51, "Matt Damon as Jason Bourne!!!")

    assert_equal 0, binary.depth_of(52)
    assert_equal 1, binary.depth_of(50)
    assert_equal 1, binary.depth_of(43)
    assert_equal 2, binary.depth_of(99)
    assert_equal 2, binary.depth_of(51)
  end

  def test_max
    skip
    max = BinarySearchTree.new(nil, "")

    assert_nil max

    tree.insert(99, "Cloud Atlas")
    tree.insert(98, "Peter Pan")
    tree.insert(1, "Any Nicholas Cage Movie")
    tree.insert(35, "Seagulls; Stop It Now")

    assert_equal [99 => "Cloud Atlas"], max

  end

  def test_min
    skip
    min = BinarySearchTree.new

    assert_nil min

    insert(99, "Cloud Atlas")
    insert(98, "Peter Pan")
    insert(1, "Any Nicholas Cage Movie")
    insert(35, "Seagulls; Stop It Now")

    assert_equal [1 => "Any Nicholas Cage Movie"], min
  end

  def test_sort
    skip
    sort = BinarySearchTree.new(nil, "")
  end

  def test_load
    skip
    binary = BinarySearchTree.new(nil, "")

    load = binary.load('movies.txt')
    includes = binary.include?(24)

    assert_equal true, includes

    includes = binary.include?(0)

    assert_equal true, includes
  end

  def test_health
    skip
    health = BinarySearchTree.new(nil, "")
  end

# Below here are extensions

  def test_leaves
    skip
    leaves = BinarySearchTree.new(nil, "")
  end

  def test_height
    skip
    height = BinarySearchTree.new(nil, "")
  end

  def test_delete
    skip
    binary = BinarySearchTree.new(nil, "")

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
