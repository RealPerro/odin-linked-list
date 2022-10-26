class LinkedList
  def initialize(head)
    @head = Node.new(head)
  end

  def append(value)
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def to_s
    current = @head
    out_string = "( #{current.value.to_s} ) -> "
    while current.next_node != nil
      current = current.next_node
      out_string += "( #{current.value.to_s} ) -> "
    end
    tail = current.next_node.nil? ? "nil" : "Error: Las element should be nil."
    out_string += tail.to_s
  end

  def head
    @head.value
  end

  def tail
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.value
  end

  def at(index)
    current = @head
    current_idx = 0
    while current.next_node != nil
      return current.value if current_idx == index
      current = current.next_node
      current_idx += 1
    end
    return "Error: Index out of range"
  end

  def pop 
    current = @head
    previous = nil
    while current.next_node != nil
      previous = current
      current = current.next_node
    end
    previous.next_node = nil
    current.value
  end
end


class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


my_list = LinkedList.new(1)
my_list.append(2)
my_list.append(3)
my_list.append(4)
my_list.append(5)

my_list.prepend("a")
my_list.prepend("b")

p my_list.to_s
#p my_list.head
#p my_list.tail
#p my_list.at(0)
#p my_list.at(1)
#p my_list.at(100)
p my_list.pop
p "last element should have been popped"
p my_list.to_s

p my_list.pop
p "last element should have been popped"
p my_list.to_s

p my_list.pop
p "last element should have been popped"
p my_list.to_s

p my_list.pop
p "last element should have been popped"
p my_list.to_s
