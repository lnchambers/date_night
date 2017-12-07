require "pry"
require_relative "node"

class BinarySearchTree

  attr_reader :root

  def initialize
    @root = nil
    @size = 0
  end

  def insert(score, movie)
    if @root.nil?
      @root = Node.new(score, movie)
    else
      insert_traverse(score, movie, @root)
    end
  end

  def insert_traverse(score, movie, current_node)
    if current_node.score > score
      insert_left(score, movie, current_node)
    else
      insert_right(score, movie, current_node)
    end
  end

  def insert_left(score, movie, current_node)
    if current_node.left.nil?
      current_node.left = Node.new(score, movie)
      @size += 1
    else
      insert_traverse(score, movie, current_node.left)
    end
  end

  def insert_right(score, movie, current_node)
    if current_node.right.nil?
      current_node.right = Node.new(score, movie)
      @size += 1
    else
      insert_traverse(score, movie, current_node.right)
    end
  end

  # I need to check the right position if its nil
  # I need to check the left position if its nil

  def include?(score, current_node = @root)
    # this needs to take the BST and search for a given value
    # It will need to iterate through the BST using the traversal method
    # and find the instance where the entered value == value
    if current_node.nil?
      false
    elsif score == current_node.score
      true
    else
      include_traverse(score, current_node)
    end
  end

  def include_traverse(score, current_node)
    if score > current_node.score
      include?(score, current_node.right)
    else
      include?(score, current_node.left)
    end
  end

  def depth_of(score, depth = 0, current_node = @root)
    # This method will count how many times it iterates through the traversal
    # method to get to a certain score. Similar to include? except with counting
    # depths.
    if current_node.nil?
      depth = "Score not included"
    elsif score == current_node.score
      depth
    else
      depth_of_traverse(score, depth, current_node)
    end
  end

  def depth_of_traverse(score, depth, current_node)
    if score > current_node.score
      depth += 1
      depth_of(score, depth, current_node.right)
    else
      depth += 1
      depth_of(score, depth, current_node.left)
    end
  end

  def max(current_node = @root)
    # This method will return the highest rated score on the BST.
    # To do this, traverse as far right as possible.
    if current_node.nil?
      maximum = "There is no tree"
    elsif current_node.right.nil?
      [current_node.score => current_node.movie]
    else
      max(current_node.right)
    end
  end

  def min(current_node = @root)
    # This method is similar to max, but traverse as far left as possible
    if current_node.nil?
      minimum = "There is no tree"
    elsif current_node.left.nil?
      [current_node.score => current_node.movie]
    else
      min(current_node.left)
    end
  end

  def sort(sorted = [], current_node = @root)
    # Traverse the tree and pull every value. Use those values to build an
    # array of hashes from lowest to highest.
    if current_node.left.nil?
      sorted.push([current_node.score => current_node.movie])
      current_node = current_node.right
    else
      set_node = current_node
      while !set_node.nil? && set_node.right != current_node
        set_node = set_node.right

        if set_node.right.nil?
          set_node.right = current_node
          current_node = current_node.left
        else
          set_node.right = nil
          sorted.push([current_node.score => current_node.movie])
          current_node = current_node.right
        end
      end
    end
  end

  # def sort_traverse(sorted, current_node)
  #   if current_node.right.nil? && current_node.left.nil?
  #     sort(sorted, current_node)
  #   elsif current_node.left
  #     sort_traverse(sorted, current_node.left)
  #   elsif current_node.score.nil?
  #     sorted << [current_node.score => current_node.movie]
  #   else
  #     current_node.right
  #     sort_traverse(sorted, current_node.right)
  #   end
  # end

  def load(movies)
    File.open(movies).each do |line|
      line.split(",")
      score = line.split(",")[0].to_i
      movie = line.split(",")[1]
      insert(score, movie)
    end
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
