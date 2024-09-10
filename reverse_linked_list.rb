class Node
  def initialize(val=0, next=None):
          @val = val
          @next = next
  end
end


def reverse_link_list(root)
  return if root.nil?
  # a placeholder for the reversed list
  dummy = Node.new
  current = root

  while !current.nil?
    # save the next node
    temp = current.next
    # reverse the link so that the current_node.next points to the node before it
    current.next = dummy.next
    dummy.next = current
    # move to the next node in the list
    current = temp
  end
  # dummy now points to head of list
  return dummy.next
end