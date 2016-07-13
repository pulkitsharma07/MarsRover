require 'rspec'
require_relative 'MarsRover.rb'

DIR = "NESW".freeze

describe "Rover" do

	before do 
		MarsRover.set_bounds([10,10])
	end

	context "rotations" do

		it "should go from N to E on turning Right" do 
			rover = MarsRover::Rover.new(0,0,"N")

			rover.command("R")
			expect(DIR[rover.curr_dir]).to eql("E")
		end

		it "should go from E to S on turning Right" do 
			rover = MarsRover::Rover.new(0,0,"E")

			rover.command("R")
			expect(DIR[rover.curr_dir]).to eql("S")
		end

		it "should go from S to W on turning Right" do 
			rover = MarsRover::Rover.new(0,0,"S")

			rover.command("R")
			expect(DIR[rover.curr_dir]).to eql("W")
		end

		it "should go from W to N on turning Right" do 
			rover = MarsRover::Rover.new(0,0,"W")

			rover.command("R")
			expect(DIR[rover.curr_dir]).to eql("N")
		end

		it "should go from N to E on turning Right" do 
			rover = MarsRover::Rover.new(0,0,"N")

			rover.command("R")
			expect(DIR[rover.curr_dir]).to eql("E")
		end

		it "should go from W to S on turning Left" do 
			rover = MarsRover::Rover.new(0,0,"W")

			rover.command("L")
			expect(DIR[rover.curr_dir]).to eql("S")
		end


	end

	context "Movement" do

		it "Should move Left if facing West" do
			rover = MarsRover::Rover.new(5,5,"W")

			rover.command("M")
			expect(rover.x).to eql(4)
			expect(rover.y).to eql(5)

		end	


		it "Should move Up if facing North" do
			rover = MarsRover::Rover.new(5,5,"N")

			rover.command("M")

			expect(rover.x).to eql(5)
			expect(rover.y).to eql(6)

		end	


		it "Should move Down if facing South" do
			rover = MarsRover::Rover.new(5,5,"S")

			rover.command("M")

			expect(rover.x).to eql(5)
			expect(rover.y).to eql(4)

		end	



		it "Should move Right if facing East" do
			rover = MarsRover::Rover.new(5,5,"E")

			rover.command("M")

			expect(rover.x).to eql(6)
			expect(rover.y).to eql(5)

		end	
	end

	context "should face at the same direction after 4 rotations" do

		it "on left side" do	

			"NSEW".split('').each do |dir|
				rover = MarsRover::Rover.new(3,5,dir)

				rover.command("R")
				rover.command("R")
				rover.command("R")
				rover.command("R")
				
				expect(DIR[rover.curr_dir]).to eql(dir)
			end

		end

		it "on right side" do	

			"NSEW".split('').each do |dir|
				rover = MarsRover::Rover.new(3,5,dir)

				rover.command("L")
				rover.command("L")
				rover.command("L")
				rover.command("L")
				
				expect(DIR[rover.curr_dir]).to eql(dir)
			end

		end
	end

	context "should stay in bounds" do 

		before(:each) do
			@rover = MarsRover::Rover.new(5,5,"W")
		end

		it "Does not go to negative coordinates on X axis" do
			
			@rover.command_seq(("M" * 10).split(''))

			expect(@rover.x).to  eql(0)
			expect(@rover.y).to  eql(5)

		end


		it "Does not go to negative coordinates on Y axis" do
			
			@rover.command("L")

			@rover.command_seq(("M" * 10).split(''))

			expect(@rover.x).to  eql(5)
			expect(@rover.y).to  eql(0)

		end

		it "Does not go out of region on the X axis" do
			
			@rover.command("L")
			@rover.command("L")

			@rover.command_seq(("M" * 10).split(''))

			expect(@rover.x).to  eql(10)
			expect(@rover.y).to  eql(5)

		end

		it "Does not go out of region on the Y axis" do
			
			@rover.command("R")

			@rover.command_seq(("M" * 10).split(''))

			expect(@rover.x).to  eql(5)
			expect(@rover.y).to  eql(10)

		end


		it "Stays inside no matter what" do
			100.times do 	
				1000.times do 
					@rover.command("LRM"[rand(0..2)])
				end
				
				expect(@rover.x).to be >= 0
				expect(@rover.x).to be <= 10


				expect(@rover.y).to be >= 0
				expect(@rover.y).to be <= 10

			end
			
		end
	end
end