require_relative 'lib/mars_rover.rb'

MarsRover.bounds(gets.chomp.split.map(&:to_i))

rovers = []
while line = gets
  next if line == "\n"

  line = line.chomp.split
  rovers << MarsRover::Rover.new(line[0], line[1], line[2])

  line = gets.chomp.split('')
  rovers.last.command_seq(line)
end

rovers.each(&:print_pos)
