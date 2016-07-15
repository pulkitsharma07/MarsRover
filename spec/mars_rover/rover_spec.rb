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

  describe '#print_pos' do
    it 'should print the position' do
      rover = MarsRover::Rover.new(2, 3, 'E')
      expect { rover.print_pos }.to output("2 3 E\n").to_stdout
    end
  end

  describe '#keep_in_bounds' do
    before(:each) do
      MarsRover.bounds([10, 10])
    end

    context 'takes the Rover inside bounds' do
      it ' for values larger than the bounds' do
        @rover = MarsRover::Rover.new(5, 21, 'N')
        @rover.send(:keep_in_bounds)

        expect(@rover.x).to eql(5)
        expect(@rover.y).to eql(10)
      end

      it ' for values smaller than the bounds' do
        @rover = MarsRover::Rover.new(-15, 21, 'N')
        @rover.send(:keep_in_bounds)

        expect(@rover.x).to eql(0)
        expect(@rover.y).to eql(10)
      end
    end
  end

  describe '#command' do
    context 'rotations' do
      it 'should go from N to E on turning Right' do
        rover = MarsRover::Rover.new(0, 0, 'N')

        rover.command('R')
        expect(rover.direction).to eql('E')
      end

      it 'should go from E to S on turning Right' do
        rover = MarsRover::Rover.new(0, 0, 'E')

        rover.command('R')
        expect(rover.direction).to eql('S')
      end

      it 'should go from S to W on turning Right' do
        rover = MarsRover::Rover.new(0, 0, 'S')

        rover.command('R')
        expect(rover.direction).to eql('W')
      end

      it 'should go from W to N on turning Right' do
        rover = MarsRover::Rover.new(0, 0, 'W')

        rover.command('R')
        expect(rover.direction).to eql('N')
      end

      it 'should go from N to E on turning Right' do
        rover = MarsRover::Rover.new(0, 0, 'N')

        rover.command('R')
        expect(rover.direction).to eql('E')
      end

      it 'should go from W to S on turning Left' do
        rover = MarsRover::Rover.new(0, 0, 'W')

        rover.command('L')
        expect(rover.direction).to eql('S')
      end
    end

    context 'Movement' do
      it 'Should move Left if facing West' do
        rover = MarsRover::Rover.new(5, 5, 'W')

        rover.command('M')
        expect(rover.x).to eql(4)
        expect(rover.y).to eql(5)
      end

      it 'Should move Up if facing North' do
        rover = MarsRover::Rover.new(5, 5, 'N')

        rover.command('M')

        expect(rover.x).to eql(5)
        expect(rover.y).to eql(6)
      end

      it 'Should move Down if facing South' do
        rover = MarsRover::Rover.new(5, 5, 'S')

        rover.command('M')

        expect(rover.x).to eql(5)
        expect(rover.y).to eql(4)
      end

      it 'Should move Right if facing East' do
        rover = MarsRover::Rover.new(5, 5, 'E')

        rover.command('M')

        expect(rover.x).to eql(6)
        expect(rover.y).to eql(5)
      end
    end

    context 'should face at the same direction after 4 rotations' do
      it 'on left side' do
        'NSEW'.split('').each do |dir|
          rover = MarsRover::Rover.new(3, 5, dir)

          rover.command('R')
          rover.command('R')
          rover.command('R')
          rover.command('R')

          expect(rover.direction).to eql(dir)
        end
      end

      it 'on right side' do
        'NSEW'.split('').each do |dir|
          rover = MarsRover::Rover.new(3, 5, dir)

          rover.command('L')
          rover.command('L')
          rover.command('L')
          rover.command('L')

          expect(rover.direction).to eql(dir)
        end
      end
    end
  end

  describe ''
end
