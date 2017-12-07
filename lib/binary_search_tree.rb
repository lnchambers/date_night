require "pry"
require_relative "node"

class BinarySearchTree

  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(score, movie)
    if @root.nil?
      @root = Node.new(score, movie)
    else
      @root.insert(score, movie)
    end
  end

  def include?(score, current_node = @root)
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
    if current_node.nil?
      maximum = "There is no tree"
    elsif current_node.right.nil?
      [current_node.movie => current_node.score]
    else
      max(current_node.right)
    end
  end

  def min(current_node = @root)
    if current_node.nil?
      minimum = "There is no tree"
    elsif current_node.left.nil?
      [current_node.movie => current_node.score]
    else
      min(current_node.left)
    end
  end

  def sort(sorted = [], current_node = @root)
    if current_node.left.nil?
      sorted << {current_node.score => current_node.movie}
      current_node = current_node.right
      set_node = current_node
    else
      set_node = current_node.left
      while !set_node.nil? && set_node.right != current_node do
        set_node.right = current_node
        current_node = current_node.right

        if set_node.right.nil?
          set_node.right = current_node
          sorted << [current_node.score => current_node.movie]
          current_node = current_node.left
        else
          current_node.nil?
          return sorted
        end
      end
    end

  end

  def load(movies)
    File.open(movies).each do |line|
      line.split(",")
      score = line.split(",")[0].to_i
      movie = line.split(",")[1]
      insert(score, movie)
    end
  end

  def health(depth)

  end

  def leaves
  end

  def height
  end

  def delete(score)
  end
end
