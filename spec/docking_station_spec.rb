# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  # let(:bike) { Bike.new }

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).arguments }

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'has a specified capacity' do
    subject = DockingStation.new(50)

    expect(subject.capacity).to eq 50
  end

  it 'releases a working bike' do
    subject.dock double(:bike)

    expect(subject.release_bike).to be_working
  end

  it 'does not release a broken bike' do
    double(:bike).report_broken
    subject.dock double(:bike)

    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no working bikes')
  end

  it 'has a bike' do
    subject.dock double(:bike)

    expect(subject.docked_bikes[0]).to eq double(:bike)
  end

  it 'doesnt release a bike if not available' do
    expect { subject.release_bike }.to raise_error(RuntimeError, 'there are no bikes')
  end

  it 'cant dock a bike if the station is full' do
    subject.capacity.times { subject.dock double(:bike) }

    expect { subject.dock double(:bike) }.to raise_error(RuntimeError, 'can not dock a bike')
  end

  it 'flags broken bikes when docked' do
    double(:bike).report_broken
    subject.dock double(:bike)

    expect(double(:bike).broken?).to eq true
  end
end
