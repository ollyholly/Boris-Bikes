# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).arguments }
  it { is_expected.to respond_to(:has_bike) }

  it 'station has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'station has a specified capacity' do
    subject = DockingStation.new(50)

    expect(subject.capacity).to eq 50
  end

  it 'releases a working bike' do
    subject.dock(Bike.new)

    expect(subject.release_bike).to be_working
  end

  it 'doesnt release a broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)

    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no working bikes')
  end

  it 'has a bike' do
    bike = Bike.new
    subject.dock(bike)

    expect(subject.has_bike).to eq bike
  end

  it 'doesnt release a bike if not available' do
    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no bikes')
  end

  it 'cant dock a bike if the station is full' do
    subject.capacity.times { subject.dock(Bike.new) }

    expect { subject.dock(Bike.new) }.to raise_error(RuntimeError, 'can not dock a bike')
  end

  it 'flags broken bikes when docked' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    
    expect(bike.working?).to eq false
  end
end
