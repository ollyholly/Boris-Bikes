require 'docking_station'

describe DockingStation do
    bike = Bike.new
    it { respond_to(:release_bike) }
    it 'is a bike' do
        expect(bike).to be_instance_of Bike
    end
end