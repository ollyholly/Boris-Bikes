# frozen_string_literal: true

require 'bike'

describe Bike do
  it { respond_to(:working?) }
  it 'is working?' do
    bike = Bike.new
    expect(bike).to be_working
  end

  describe '#broken' do
    it 'exists' do
      expect(Bike.new).to respond_to(:broken?)
    end
    it 'can be not working' do
      subject.report_broken
      expect(subject.working?).to eq false
    end
  end

  describe '#report_broken' do
    it 'reports a bike as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
