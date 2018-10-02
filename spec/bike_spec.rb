require 'bike'

describe Bike do
  describe 'it should respond to the working? method' do
    it { expect(Bike.new).to respond_to(:working?) }
  end
end
