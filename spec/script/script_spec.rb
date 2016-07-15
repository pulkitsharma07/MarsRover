require_relative '../spec_helper.rb'

describe 'Rover' do
  before do
    MarsRover.bounds([10, 10])
  end

  context 'should stay in bounds' do
    before(:each) do
      @rover = MarsRover::Rover.new(5, 5, 'W')
    end

    it 'Does not go to negative coordinates on X axis' do
      @rover.command_seq(('M' * 10).split(''))

      expect(@rover.x).to  eql(0)
      expect(@rover.y).to  eql(5)
    end

    it 'Does not go to negative coordinates on Y axis' do
      @rover.command('L')

      @rover.command_seq(('M' * 10).split(''))

      expect(@rover.x).to  eql(5)
      expect(@rover.y).to  eql(0)
    end

    it 'Does not go out of region on the X axis' do
      @rover.command('L')
      @rover.command('L')

      @rover.command_seq(('M' * 10).split(''))

      expect(@rover.x).to  eql(10)
      expect(@rover.y).to  eql(5)
    end

    it 'Does not go out of region on the Y axis' do
      @rover.command('R')

      @rover.command_seq(('M' * 10).split(''))

      expect(@rover.x).to  eql(5)
      expect(@rover.y).to  eql(10)
    end

    it 'Stays inside no matter what' do
      100.times do
        1000.times do
          @rover.command('LRM'[rand(0..2)])
        end

        expect(@rover.x).to be >= 0
        expect(@rover.x).to be <= 10

        expect(@rover.y).to be >= 0
        expect(@rover.y).to be <= 10
      end
    end
  end
end
