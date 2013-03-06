class ToyRobot
  attr_accessor :dir, :x, :y
  DIRECTIONS = %w/NORTH EAST SOUTH WEST/ 

  def place(x, y, dir)
    @x = x.to_i
    @y = y.to_i
    @dir = dir
  end

  def move
    case @dir
    when "NORTH"
      @y += 1
    when "SOUTH"
      @y -= 1
    when "EAST"
      @x += 1
    else "WEST"
      @x -= 1
    end
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
