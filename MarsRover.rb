module MarsRover

DIRECTIONS = (0..3).to_a.freeze
DIRECTION_LITERAL = 'NESW'.freeze
GRID_MAX = []

	class Rover

		def initialize(x, y, dir)
			
			@x = x.to_i rescue 0
			@y = y.to_i rescue 0

			@curr_dir = DIRECTION_LITERAL.index(dir.to_s) || 0 #default direction is zero
		end

		def print_pos
			puts "#{@x} #{@y} #{DIRECTION_LITERAL[@curr_dir]}\n"
		end

		def command_seq(cmd_seq)
			cmd_seq.each do |cmd|
				command(cmd)
			end
		end

		def command(input)
			
			case input
			when "L"
				turn_left
			when "R"	
				turn_right
			when "M"
				move_forward
			else
				raise "Invalid Move : #{input}"
			end
			
			keep_in_bounds
			#puts "After #{input} "
			#print_pos
		end

		private

		def keep_in_bounds
			@x = [0, @x].max
			@y = [0, @y].max
			@x = [GRID_MAX[0], @x].min
			@y = [GRID_MAX[1], @y].min
		end

		def turn_left
			@curr_dir = (@curr_dir - 1) % 4;
		end

		def turn_right
			@curr_dir = (@curr_dir + 1) % 4;
		end

		def move_forward

			case @curr_dir
			when 0
				@y += 1
			when 1
				@x += 1
			when 2
				@y -= 1
			when 3
				@x -= 1
			end
		end
	end

	def self.set_bounds(bounds)
		GRID_MAX.replace(bounds)
	end
end