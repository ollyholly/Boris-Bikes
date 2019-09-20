# frozen_string_literal: true

require 'van'

describe Van do
  let(:station) { double :docking_station }
  let(:bike) { double :bike }

  describe '#collect_broken' do
    it 'collects broken bikes from a docking station' do
      bike = double(:bike, broken?: true)

      expect(subject.collect_broken(bike)).to include bike
    end
  end

  describe '#collect_working' do
    it 'collects working bikes from a garage' do
      bike = double(:bike, working?: true)

      expect(subject.collect_working(bike)).to include bike
    end
  end

  describe '#deliver_broken' do
    it 'delivers broken bikes to a docking station' do
      bike = double(:bike, broken?: true)
      subject.collect_broken(bike)

      expect(subject.deliver_broken).to eq bike
    end
  end

  describe '#deliver_working' do
    it 'delivers working bikes to a docking station' do
      bike = double(:bike, working?: true)
      subject.collect_working(bike)

      expect(subject.deliver_working).to eq bike
    end
  end
end
