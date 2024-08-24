require 'set'

class DayThree
  class PartList
    attr_accessor :number, :x, :y

    def initialize(number, x, y)
      @number = number
      @x = x
      @y = y
    end

    def eql?(other) = @number == other.number && @x == other.x && @y == other.y
    def hash = [@number, @x, @y].hash
  end

  attr_accessor :width, :height, :data, :parts

  #define the data size
  def initialize(width = 140, height = 140)
    @width = width
    @height = height
    @data = File.read(File.join(__dir__, 'Day_03.dat')).gsub(/\s*/, '')
    @parts = Set.new
  end

  def am_i_a_symbol(x, y)
    char = char_pos(x, y)
    # find a am_i_a_symbol match, day to look this up :()
    /[^\d\.]/.match?(char) ? char : nil
  end

  def number(x, y)
    char = char_pos(x, y)
    /\d/.match?(char) ? char : nil
  end
  
  def char_pos(x, y)
    return '.' if y < 0 || y > @height
    return '.' if x < 0 || x > @width

    @data[y * @width + x]
  end

  def find_linked_parts
    # trusty 2d array
    0.upto(@height) do |y|
      0.upto(@width) do |x|
        current_char = char_pos(x, y)

        if am_i_a_symbol(x, y)
          [
            [-1, -1], [0, -1], [1, -1],
            [-1,  0],          [1,  0],
            [-1,  1], [0,  1], [1,  1],
          ].each do |ox, oy|
            add_a_part_to_list(x + ox, y + oy)
          end
        end
      end
    end
  end

  def add_a_part_to_list(x, y)
    if n = number(x, y)
      scan_x = x
      scan_x -= 1 while number(scan_x - 1, y)
      start_x = scan_x
      part_number = []

      while number(scan_x, y)
        part_number << number(scan_x, y)
        scan_x += 1
      end

      @parts << PartList.new(part_number.join.to_i, start_x, y)
    end
  end
end

schematic = DayThree.new
schematic.find_linked_parts
puts schematic.parts.sum { |part| part.number }