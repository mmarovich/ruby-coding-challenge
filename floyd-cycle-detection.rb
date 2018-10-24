class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end
 
def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end


# The signal of an infinite loop is that even though the linked list is still chained together infinitely, it's
# length is not infinite.  So in order to detect the loop, we can compare how the chain looks at different points,
# and if the chain looks the same at 2 locations, it's most certainly a loop.

def infinite_loop?(list)
  tortoise = list.next_node
  hare = list.next_node

  until hare.nil?
    hare = hare.next_node
    return false if hare.nil?

    # the hare moves forward twice as fast as the tortoise, and each time they move, they are compared.
    # if- at any point- they are the same, we return true, otherwise, we will return false.
    hare = hare.next_node
    tortoise = tortoise.next_node
    return true if hare == tortoise
  end

  return false
end
 
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

# returns false
puts infinite_loop?(node3)

# this next line is what mutates our chain into an infinite loop.
node1.next_node = node3

# returns true
puts infinite_loop?(node3)