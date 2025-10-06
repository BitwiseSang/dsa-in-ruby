require_relative '../../linked-list/lib/linked_list'
require_relative '../../linked-list/lib/node'

# Hashmap class
class HashMap
  attr_reader :capacity

  def initialize
    @capacity = 16
    @bucket = []
    @entries = 0
  end

  def resize_threshold
    (@capacity * 0.75).round
  end

  def grow?
    return true if @entries > resize_threshold

    false
  end

  def grow_bucket
    @capacity *= 2
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code % @capacity
  end

  def linked_list_entry(hash_code, value)
    unless @bucket[hash_code].instance_of?(LinkedList)
      current_value = @bucket[hash_code]
      @bucket[hash_code] = LinkedList.new(Node.new(current_value))
    end
    @bucket[hash_code].append(value)
  end

  def set(key, value)
    hash_code = hash(key)
    return IndexError if hash_code.negative? || hash_code > @capacity

    if @bucket[hash_code].nil?
      @bucket[hash_code] = value
    else
      linked_list_entry(hash_code, value)
    end
    @entries += 1
    grow_bucket if grow?
  end

  def get(key)
    hash_code = hash(key)
    @bucket[hash_code]
  end

  def has?(key)
    hash_code = hash(key)
    return true if @bucket[hash_code]

    false
  end

  def remove(key)
    hash_code = hash(key)
    return nil unless @bucket[hash_code]

    value = @bucket[hash_code]
    @bucket[hash_code] = nil
    value
  end

  def length
    @bucket.count
  end

  def clear
    @bucket.clear
  end

  def keys
    keys = []
    @bucket.each_with_index { |value, index| keys << index unless value.nil? }
    keys
  end

  def values
    @bucket.map { |key| key unless key.nil? }
  end

  def entries
    entries = []
    @bucket.each_with_index do |value, index|
      if value.instance_of?(LinkedList)
        value.each { |node| entries << [index, node.value] }
      else
        entries << [index, value] unless value.nil?
      end
    end
    entries
  end
end
