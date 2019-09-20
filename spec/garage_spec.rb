# frozen_string_literal: true

require 'garage'

describe Garage do
  let(:station) { double :docking_station }
  let(:bike) { double :bike }

  describe '#receive_broken' do
    it 'receive broken bikes from a van' do
      bike = double(:bike, broken?: true)

      expect(subject.receive_broken(bike)).to include bike
    end
  end

  describe '#release_working' do
    it 'release working bikes to a van' do
      bike = double(:bike, working?: true)
      subject.receive_working(bike)

      expect(subject.release_working).to eq bike
    end
  end
end
