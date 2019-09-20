# frozen_string_literal: true

require_relative 'bike'

class Garage
  attr_reader :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def receive_broken(bike)
    bikes << bike if bike.broken?
  end

  def receive_working(bike)
    bikes << bike if bike.working?
  end

  def release_working
    bikes.each { |bike| return bike if bike.working? }
  end
end
