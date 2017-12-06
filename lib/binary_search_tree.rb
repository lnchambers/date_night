require "pry"
require_relative "node"

class BinarySearchTree < Node

  attr_reader :root

  def initialize(score = nil, movie)
    @root = Node.new(score, movie)
    @depth = 0
  end

  def insert(score, movie, current_node = @root)
    if @root.score.nil?
      @root = Node.new(score, movie)
    else current_node.traverse(score, current_node)
    end
  end

  def include?(score, node = @root)
    # this needs to take the BST and search for a given value
    # It will need to iterate through the BST using the traversal method
    # and find the instance where the entered value == value
    if score == node.score
      true
    elsif score > node.score
      include?(score, node.right)
    elsif score < node.score
      include?(score, node.left)
    else node.nil?
      false
    end
  end

  def depth_of(score, node = @root)
    # This method will count how many times it iterates through the traversal
    # method to get to a certain score. Similar to include? except with counting
    # depths.
    if score == node.score
      @depth
    elsif score > node.score
      @depth + 1
      depth_of(score, node.right)
    elsif score < node.score
      @depth + 1
      depth_of(score, node.left)
    else
      puts "That score is not included."
    end
  end

  def max(node = @root)
    # This method will return the highest rated score on the BST.
    # To do this, traverse as far right as possible.
    if node.right.nil?
      max = node
    else
      max(node.right)
    end
    max
  end

  def min(node = @root)
    # This method is similar to max, but traverse as far left as possible
    if node.left.nil?
      min = node
    else
      min(node.left)
    end
    min
  end

  def sort
  #   Traverse the tree and pull every value. Use those values to build an
  #   array of hashes from lowest to highest.
  end

  def load(movies)
    # Load a .txt file with one movie/score per line and load it onto the BST
    insert(load'movies.txt')
  end

  def health(depth)
    # Traverse the tree to a specific depth to return
    # Score of the node
    # Total number of child nodes including the current node
    # Percentage of all the nodes that are this node or it’s children
    # in a nested array
  end

# Below here are extensions

  def leaves
  end

  def height
  end

# Priority extension -->>

  def delete(score)
  end
end
