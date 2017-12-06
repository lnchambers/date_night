class Node

  attr_reader   :score
  attr_accessor :left,
                :right

  def initialize(score = nil, movie)
    @score = score
    @movie = movie
    @left = nil
    @right = nil
  end

  def traverse(score, current_node)
    if score > @score && @right.nil?
      current_node = @right = Node.new(score)
    elsif score > @score
      @right.traverse(score)
    elsif score < @score && @left.nil?
      current_node = @left = Node.new(score)
    elsif score < @score
      @left.traverse(score)
    else
      puts "Good news! This movie is already in our system."
    end
    insert(score, current_node)
  end

  def insert(score, current_node)
    if score > current_node.score
      current_node.right = Node.new(score, movie)
    else score < current_node.score
      current_node.left = Node.new(score, movie)
    end
  end
end
