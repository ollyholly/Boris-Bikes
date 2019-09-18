# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:has_bike) }

  it 'releases a working bike' do
    docking_station = DockingStation.new
    docking_station.dock(Bike.new)
    expect(docking_station.release_bike).to be_working
  end

  it 'has a bike' do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    expect(station.has_bike).to eq(bike)
  end

  it 'not release bike if not available' do
    expect { DockingStation.new.release_bike }.to raise_error(RuntimeError, 'there are no bikes')
  end
  it 'can not dock bike if there is a bike' do
    bike1 = Bike.new
    bike2 = Bike.new
    station = DockingStation.new
    station.dock(bike1)

    expect { station.dock(bike2) }.to raise_error(RuntimeError, 'can not dock a bike')
  end
end
