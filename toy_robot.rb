class ToyRobot
  attr_accessor :dir, :x, :y
  DIRECTIONS = %w/NORTH EAST SOUTH WEST/ 
  DIRECTION_COORDS = [ [0, 1], [0, -1], [1, 0], [-1, 0] ]

  def place(x, y, dir)
    @x = x.to_i
    @y = y.to_i
    @dir = dir

    raise "Error: Outside Board" unless @x.between?(0, 4) && @y.between?(0, 4)
  end

  def move
    da_coords = DIRECTION_COORDS[DIRECTIONS.index( @dir )]
    @x += da_coords[0] if (@x + da_coords[0]).between?(0, 4)
    @y += da_coords[1] if (@y + da_coords[1]).between?(0, 4)
  end

  def left
    index = DIRECTIONS.index(@dir)
    @dir  = DIRECTIONS[index - 1]
  end 

  def right
    index = DIRECTIONS.index(@dir)
    @dir  = DIRECTIONS[ (index + 1) % DIRECTIONS.length ]
  end 

  def report
    puts "#{@x}, #{@y}, #{@dir}"
    "#{@x}, #{@y}, #{@dir}"
  end
end

File.open('input.txt') do |file|
  toy = ToyRobot.new

  file.each_line do |line|
    next if line =~ /^\n$/
    if line =~ /PLACE/
      arrgs = line.gsub('PLACE', '').strip.split(',')
      toy.place( arrgs[0], arrgs[1], arrgs[2] )
    elsif line =~ /MOVE/
      toy.move
    elsif line =~ /LEFT/
      toy.left
    elsif line =~ /RIGHT/
      toy.right
    else
      toy.report
    end
  end
end
