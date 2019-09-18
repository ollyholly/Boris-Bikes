# frozen_string_literal: true

require_relative 'bike'
class DockingStation
  attr_accessor :collection
  DEFAULT_CAPACITY = 20
  

  def initialize
    @collection = []
  end

  def release_bike
    raise 'there are no bikes' if empty?

    @collection.pop
  end

  def dock(bike)
    raise 'can not dock a bike' if full?

    @collection << bike
  end

  def has_bike
    @collection[0]
  end

  private
  
  def full?
    @collection.length >= DEFAULT_CAPACITY
  end

  def empty?
    @collection.length == 0
  end
end
