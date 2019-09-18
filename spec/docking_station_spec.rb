# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:has_bike) }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'has a bike' do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    expect(station.has_bike).to eq(bike)
  end
end
