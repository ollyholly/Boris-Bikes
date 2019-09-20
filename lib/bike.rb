# frozen_string_literal: true

class Bike
  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
    !@broken
  end

  def repair
    @broken = false
  end
end
