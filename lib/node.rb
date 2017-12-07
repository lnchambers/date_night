class Node

  attr_reader   :score,
                :movie
  attr_accessor :left,
                :right

  def initialize(score = nil, movie)
    @score = score
    @movie = movie
    @left = nil
    @right = nil
    @depth = 0
  end

  def insert(score, movie)
    if score < @score && @left.nil?
      @left = Node.new(score, movie)
    elsif score < @score && @left
      @left.insert(score, movie)
    elsif score > @score && @right.nil?
      @right = Node.new(score, movie)
    else
      @right.insert(score, movie)
    end
  end
end
