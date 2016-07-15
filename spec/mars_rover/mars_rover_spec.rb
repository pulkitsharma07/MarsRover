require_relative '../spec_helper.rb'

describe 'MarsRover' do
  describe '.bounds' do
    it 'should set the bounds on the region' do
      MarsRover.bounds([10, 20])
      expect(MarsRover::GRID_MAX).to eql([10, 20])
    end
  end
end
