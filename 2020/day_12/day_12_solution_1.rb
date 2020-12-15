# North is positive y, South is negative  y
# East is positive x, West is negative x
Position = Struct.new(:direction, :x, :y)


def decode(instruction)
    retval = instruction.match(/(\D)(\d+)/)
    return retval[1], retval[2].to_i
end

def update_direction(current_direction, turn_direction, angle)
    # Cardinal directions incrementing with increasing angle clockwise
    # So if turning right, increment index, if left, decrement
    cardinal_directions = ['N', 'E', 'S', 'W']
    current_index = cardinal_directions.index(current_direction)
    increment = angle / 90
    new_index = 0
    if turn_direction == 'R'
        new_index = (current_index + increment)%4
    else
        new_index = (current_index - increment)%4
    end
    return cardinal_directions[new_index]
end

def move(i_type, i_val, current_pos)
    case i_type
    when 'N'
        current_pos[:y] += i_val
    when 'S'
        current_pos[:y] -= i_val
    when 'E'
        current_pos[:x] += i_val
    when 'W'
        current_pos[:x] -= i_val
    when 'L'
        current_pos[:direction] = update_direction(current_pos[:direction], i_type, i_val)
    when 'R'
        current_pos[:direction] = update_direction(current_pos[:direction], i_type, i_val)
    when 'F'
        current_pos = move(current_pos[:direction], i_val, current_pos)
    else
        print "Error decoding instruction"
    end
end

def navigate(lines)
    current_pos = Position.new('E', 0, 0)
    for instruction in lines
        i_type, i_val = decode(instruction)
        move(i_type, i_val, current_pos)
        puts current_pos
    end
    return current_pos
end

def print_position(current_pos)
    print_string = "Direction: #{current_pos[:direction]}, "
    if current_pos[:x] > 0
        print_string += "East #{current_pos[:x]}, "
    else
        print_string += "West #{-current_pos[:x]}, "
    end
    if current_pos[:y] > 0
        print_string += "North #{current_pos[:y]}\n"
    else
        print_string += "South #{-current_pos[:y]}\n"
    end
    print print_string
end

def calc_manhatten(current_pos)
    return current_pos[:x].abs + current_pos[:y].abs
end


lines = File.readlines('input_12.txt').map{|str| str.chomp}
# current_pos = Position.new('E', 0, 0)
# i_type, i_val = decode(lines[0])
# move(i_type, i_val, current_pos)
# puts current_pos

endpoint = navigate(lines)
print_position(endpoint)
print "Distance: #{calc_manhatten(endpoint)}\n"
