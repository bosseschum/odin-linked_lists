class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    new_node.next_node = @head
    @head = new_node
  end

  def size
    size = 0
    current = @head
    until current.nil?
      current = current.next_node
      size += 1
    end
  end

  def head
    return nil if @head.nil?

    @head
  end

  def tail
    tail = @head
    tail = tail.next_node until tail.next_node.nil?
    tail
  end

  def at(index)
    current = @head
    index.times do
      current = current.next_node
    end
    return nil if current.nil?

    current
  end

  def pop
    return nil if @head.nil?

    old_head = @head
    @head = @head.next_node

    old_head
  end

  def contains?(value)
    current = @head
    until current.value == value
      current = current.next_node
      return false if current.nil?
    end

    true
  end

  def index(value)
    index = 0
    current = @head
    until current.value == value
      current = current.next_node
      index += 1
    end

    index
  end

  def to_s
    return '' if @head.nil?

    result = ''
    current = @head
    until current.nil?
      result += "( #{current.value} ) -> "
      current = current.next_node
    end

    result + 'nil'
  end

  def insert_at(index, *values)
    raise IndexError if index > size || index < 0

    values.each_with_index do |value, i|
      if index + i == 0
        prepend(value)
      else
        current = @head
        (index - 1).times { current = current.next_node }

        new_node = Node.new(value)
        new_node.next_node = current.next_node
        current.next_node = new_node
      end
    end
  end

  def remove_at(index)
    raise IndexError if index >= size || index < 0

    previous = nil
    current = @head
    index.times do
      previous = current
      current = current.next_node
    end

    previous.next_node = current.next_node
  end
end
