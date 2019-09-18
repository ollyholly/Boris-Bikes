# frozen_string_literal: true

require_relative 'bike'
class DockingStation
  attr_accessor :bike

  def release_bike
    if @bike.nil?
      raise 'there are no bikes'
    else
      @bike
    end
  end

  def dock(bike)
    if @bike
      raise 'can not dock a bike'
    else
      @bike = bike
    end
  end

  def has_bike
    @bike
  end
end
