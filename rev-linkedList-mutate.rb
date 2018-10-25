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

# This mutative recursion is extremely difficult- at least, for me- to visualize, and it will probably be
# super difficult for students to visualize too.  In order for me to begin to understand how this mutation
# works, I had to follow list, and previous at every recursive step:

# (12, (99, (37, nil)) ///// nil)
# ((99, (37, nil)) ///// (12, nil))
# ((37, nil) ///// (99, (12, nil)))
# (nill ///// (37, (99, (12, nil))

# after this iteration, node1 because the new head.

def reverse_list(list, previous=nil)
  if list
    next_node = list.next_node # next_node = nil
    list.next_node = previous # node = (37, (99, (12, nil)))
    # binding.pry
    reverse_list(next_node, list) 
  end
end

# creating values into linked list
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# display values of linked list starting at the beginning
print_values(node3)

puts "--------"

# feed our mutative function our entire list
reverse_list(node3)

# display reversed and mutated linked list
print_values(node1)
