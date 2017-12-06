require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/tree_interact"

class TreeInteractTest

  def test_it_exists
    tree_interact = TreeInteract.new

    assert_instance_of TreeInteract, tree_interact
  end
end
