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

  # def traverse(score)
  #   if score > @score && @right.nil?
  #     @right = Node.new(score)
  #   elsif score > @score
  #     @right.traverse(score)
  #   elsif score < @score && @left.nil?
  #     @left = Node.new(score)
  #   elsif score < @score
  #     @left.traverse(score)
  #   else
  #     puts "Good news! This movie is already in our system."
  #   end
  # end
end
