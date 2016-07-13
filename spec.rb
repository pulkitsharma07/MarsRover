require 'rspec'
require_relative 'MarsRover.rb'

describe "Rover" do

	before do 
		MarsRover.set_bounds([10,10])
	end
	context "should face at the same direction after 4 rotations" do

		it "on left side" do	

			"NSEW".split('').each do |dir|
				rover = MarsRover::Rover.new(3,5,dir)

				rover.command("R")
				rover.command("R")
				rover.command("R")
				rover.command("R")
				
				expect(rover.curr_dir).to eql("NESW".index(dir))
			end

		end

		it "on right side" do	

			"NSEW".split('').each do |dir|
				rover = MarsRover::Rover.new(3,5,dir)

				rover.command("L")
				rover.command("L")
				rover.command("L")
				rover.command("L")
				
				expect(rover.curr_dir).to eql("NESW".index(dir))
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