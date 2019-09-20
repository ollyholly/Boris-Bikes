# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'has a specified capacity' do
    subject = DockingStation.new(50)

    expect(subject.capacity).to eq 50
  end

  it 'releases a working bike' do
    bike = double(:bike, working?: true)
    subject.dock(bike)

    expect(subject.release_bike).to be bike
  end

  it 'does not release a broken bike' do
    # allow(bike).to receive(:working?).and_return(true)
    bike = double(:bike, working?: false)
    allow(bike).to receive(:report_broken)

    bike.report_broken
    subject.dock(bike)

    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no working bikes')
  end

  it 'has a bike' do
    subject.dock(bike)

    expect(subject.docked_bikes[0]).to eq bike
  end

  it 'doesnt release a bike if not available' do
    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no bikes')
  end

  it 'cant dock a bike if the station is full' do
    subject.capacity.times { subject.dock(bike) }

    expect { subject.dock(bike) }.to raise_error(RuntimeError, 'can not dock a bike')
  end

  it 'flags broken bikes when docked' do
    bike = double(:bike, broken?: true)
    allow(bike).to receive(:report_broken)
    bike.report_broken
    subject.dock(bike)

    expect(bike).to be_broken
  end
end
