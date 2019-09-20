# frozen_string_literal: true

require 'bike'

describe Bike do
  it { respond_to(:broken?) }
  it 'is working?' do
    expect(subject).to be_working
  end

  describe '#report_broken' do
    it 'reports a bike as broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
