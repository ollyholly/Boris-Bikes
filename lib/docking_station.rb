# frozen_string_literal: true

require_relative 'bike'
class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @collection = []
    @capacity = capacity
  end

  def release_bike
    raise 'there are no bikes' if empty?

    collection.pop
  end

  def dock(bike)
    raise 'can not dock a bike' if full?

    collection << bike
  end

  def has_bike
    collection[0]
  end

  private

  attr_reader :collection

  def full?
    collection.length >= capacity
  end

  def empty?
    collection.empty?
  end
end
