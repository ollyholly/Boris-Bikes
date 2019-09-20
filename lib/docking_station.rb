# frozen_string_literal: true

require_relative 'bike'
class DockingStation
  attr_reader :capacity
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'there are no bikes' if empty?

    docked_bikes.each { |bike| return bike unless bike.broken? }
    raise 'there are no working bikes'
  end

  def dock(bike)
    raise 'can not dock a bike' if full?

    docked_bikes << bike
  end

  private

  def full?
    docked_bikes.length >= capacity
  end

  def empty?
    docked_bikes.empty?
  end
end
