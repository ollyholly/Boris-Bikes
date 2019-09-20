# frozen_string_literal: true

require_relative 'bike'

class Van
  attr_reader :capacity
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def collect_broken(bike)
    bikes << bike if bike.broken?
  end

  def collect_working(bike)
    bikes << bike if bike.working?
  end

  def deliver_broken
    bikes.pop
  end

  def deliver_working
    bikes.each { |bike| return bike if bike.working? }
  end
end
