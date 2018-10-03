require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :report }

  it 'allows a user to report a broken bike' do
    broken_bike = Bike.new
    broken_bike.report
    expect(broken_bike.working?).to eq false
  end

end
