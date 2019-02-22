# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: 
# {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }

class Tree
  attr_accessor :node_name,:childern
  def initialize(tree)
    @node_name = tree.keys
    @childern =  Array.new
    tree.each_value { |val| childern.push(val) }
  end
  def visit_all(&block)
    visit &block
    childern.each {|c| Tree.new(c).visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new(
  { 
    :grandpa => { 
      :dad => {:child_1 => {}, :child_2 => {} }, 
      :uncle => {:child_3 => {}, :child_4 => {} } 
    } 
  }
)

puts 'visit'
ruby_tree.visit {|node| puts node.node_name}

puts 'visit_all'
ruby_tree.visit_all {|node| puts node.node_name}
