
# Linked list creation
class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

# recursive function that prints all node values until next node is nil
def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

# The key to this particular exercise is the push function.  It changes @data after each call
# equal itself, and retains the value of the LAST call.  This is how the reverse is possible
# using this function.  It essentially reverses all next nodes to point in the opposite direction.
class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    return print "nil\n" if @data.nil?
    print "#{@data.value}\n"
    @data = @data.next_node
  end
end

# As stated above, it's super important to realize that each time a value is pushed onto the stack
# it's value is retained as the next node for the next value in @data.
def reverse_list(list)

  stack = Stack.new
  while list
    stack.push(list.value)
    list = list.next_node
  end

  return stack.data
end

# creating values into linked list
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# display values of linked list starting at the beginning
print_values(node3)

puts "--------"

# creating a new stack where links are reversed and placing new object into a variable.
revlist = reverse_list(node3)

# display reversed linked list
print_values(revlist)