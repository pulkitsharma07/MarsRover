require_relative '../spec_helper.rb'

describe 'Rover' do
  describe '#initialize' do

    it 'should initialize to correct values' do
      rover = MarsRover::Rover.new(4, 10, 'N')

      expect(rover.x).to eql(4)
      expect(rover.y).to eql(10)
      expect(rover.direction).to eql('N')
    end

    it 'should handle invalid values' do
      rover = MarsRover::Rover.new('s', 'dsd', 2)

      expect(rover.x).to eql(0)
      expect(rover.y).to eql(0)
      expect(rover.direction).to eql('N')
    end
  end

end
