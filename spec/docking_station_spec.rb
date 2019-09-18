# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:has_bike) }

  it 'station is created with a default capacity' do
    expect(subject.capacity).to eq subject.capacity
  end

  it 'station is created with a specified capacity' do
    subject = DockingStation.new(50)
    expect(subject.capacity).to eq 50
  end

  it 'releases a working bike' do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_working
  end

  it 'has a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.has_bike).to eq(bike)
  end

  it 'not release bike if not available' do
    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no bikes')
  end
  it 'can not dock bike if the station is full' do
    subject.capacity.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error(RuntimeError, 'can not dock a bike')
  end
end
