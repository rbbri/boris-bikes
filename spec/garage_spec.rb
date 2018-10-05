require 'garage'

describe 'Garage' do

  let(:broken_bike) { double(:bike, working?: false) }


  it "fixes broken bikes" do
    garage = Garage.new
    broken_bike = Bike.new
    broken_bike.report
    garage.bikes.concat([broken_bike])
    broken_bike.fix
    expect(broken_bike.working?).to eq true
  end


end
