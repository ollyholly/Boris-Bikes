require "bike"

describe Bike do
  it { respond_to(:working?) }
  # it 'is working?'
  #   bike = Bike.new
  #   expect(bike.working?).to eq true
  # end
  it 'is working?'
    bike = Bike.new
    expect(bike).to be_working
  end
  
end