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
    while current
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

  def size
    current = @head
    current_idx = 0
    while current
      current = current.next_node
      current_idx += 1
    end
    return current_idx
  end

  def contains?(value)
    current = @head
    current_idx = 0
    while current
      return true if current.value == value
      current = current.next_node
    end
    return false
  end

  def find(value)
    current = @head
    current_idx = 0
    while current
      return current_idx if current.value == value
      current = current.next_node
      current_idx +=1
    end
    return false
  end

  def insert_at(value, index)
    return prepend(value) if index == 0

    current = @head
    current_idx = 0
    previous = nil
    new_node = Node.new(value)

    while current
      if current_idx == index
        previous.next_node = new_node
        new_node.next_node = current
      end
      previous = current
      current = current.next_node
      current_idx += 1
    end

    return "Error: Index out of range"
  end

  def remove_at(index)
    if index == 0
      current = @head
      @head = @head.next_node
      return current
    end
    
    current = @head
    current_idx = 0
    previous = nil
    while current
      if current_idx == index
        previous.next_node = current.next_node
      end
      previous = current
      current = current.next_node
      current_idx += 1
    end
    return "Error: Index out of range"
  end

end


class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

p "testing create (1)"
my_list = LinkedList.new(1)
p my_list.to_s
#p my_list.size

p "testing append"
my_list.append(2)
my_list.append(3)
my_list.append(4)
my_list.append(5)
p my_list.to_s
#p my_list.size

p "testing prepend"
my_list.prepend("a")
my_list.prepend("b")
p my_list.to_s
#p my_list.size

p my_list.head
p my_list.tail

p "testing at"
p my_list.at(0)
p my_list.at(1)
p my_list.at(2)
p my_list.at(3)
p my_list.at(4)
p my_list.at(5)
p my_list.at(6)

p "testing pop"
p my_list.pop
p "last element should have been popped"
p my_list.to_s
p my_list.size

p my_list.pop
p "last element should have been popped"
p my_list.to_s
p my_list.size

p my_list.pop
p "last element should have been popped"
p my_list.to_s
p my_list.size

p my_list.pop
p "last element should have been popped"
p my_list.to_s
p my_list.size

p"testing contains"
p my_list.contains?("aa")
p my_list.contains?("a")
p my_list.contains?(2)
p my_list.contains?(1)

p "testing find"
p my_list.find("b")
p my_list.find("a")
p my_list.find(1)
p my_list.find(nil)
p my_list.find("xxxx")

p "testing insert at"
my_list.insert_at(9, 0)
p my_list.to_s
my_list.insert_at("x", 2)
p my_list.to_s
my_list.insert_at("zzz", 3)
p my_list.to_s

p "testing remove at"
my_list.remove_at(3)
p my_list.to_s

my_list.remove_at(0)
p my_list.to_s

my_list.remove_at(3)
p my_list.to_s