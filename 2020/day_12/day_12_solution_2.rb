# North is positive y, South is negative  y
# East is positive x, West is negative x

def decode(instruction)
    retval = instruction.match(/(\D)(\d+)/)
    return retval[1], retval[2].to_i
end

def rotate_waypoint(waypoint, turn_direction, angle)
    # Rotate waypoint about ship, which is just swapping axes
    new_waypoint = [0, 0]
    if turn_direction == 'R'
        angle *= -1
    end
    angle_r = Math::PI * angle / 180
    new_waypoint[0] = (waypoint[0]*Math.cos(angle_r)-waypoint[1]*Math.sin(angle_r)).round
    new_waypoint[1] = (waypoint[0]*Math.sin(angle_r)+waypoint[1]*Math.cos(angle_r)).round
    return new_waypoint
end

def move(i_type, i_val, waypoint, ship)
    case i_type
    when 'N'
        return [waypoint[0], waypoint[1] + i_val], ship
    when 'S'
        return [waypoint[0], waypoint[1] - i_val], ship
    when 'E'
        return [waypoint[0] + i_val, waypoint[1]], ship
    when 'W'
        return [waypoint[0] - i_val, waypoint[1]], ship
    when 'L'
        return rotate_waypoint(waypoint, i_type, i_val), ship
    when 'R'
        return rotate_waypoint(waypoint, i_type, i_val), ship
    when 'F'
        return waypoint, [ship[0] + waypoint[0]*i_val, ship[1] + waypoint[1]*i_val]
    else
        print "Error decoding instruction"
        return [0, 0], [0, 0]
    end
end

def navigate(lines)
    # Waypoint is relative to ship, not absolute
    waypoint = [10, 1]
    ship = [0, 0]
    for instruction in lines
        i_type, i_val = decode(instruction)
        # print "#{waypoint}, #{ship}, #{i_type}, #{i_val}\n"
        waypoint, ship = move(i_type, i_val, waypoint, ship)

        # print "Ship:\n"
        # print_position(ship)
        # print "Waypoint:\n"
        # print_position(waypoint)
    end
    return waypoint, ship
end

def print_position(current_pos)
    print_string = ""
    if current_pos[0] > 0
        print_string += "East #{current_pos[0]}, "
    else
        print_string += "West #{-current_pos[0]}, "
    end
    if current_pos[1] > 0
        print_string += "North #{current_pos[1]}\n"
    else
        print_string += "South #{-current_pos[1]}\n"
    end
    print print_string
end

def calc_manhatten(current_pos)
    return current_pos[0].abs + current_pos[1].abs
end

def check_position(waypoint, x_expec, y_expec)
    if waypoint[0] == x_expec and waypoint[1] == y_expec
        return true
    else
        print "Expect #{x_expec}, #{y_expec}.  Found: #{waypoint[0]}, #{waypoint[1]}\n"
        return false
    end
end

def validate_move()
    # n_way, n_ship = move('N', 10, [0, 0], [0, 0])
    puts check_position(n_way, 0, 10)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('S', 10, [0, 0], [0, 0])
    puts check_position(n_way, 0, -10)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('E', 10, [0, 0], [0, 0])
    puts check_position(n_way, 10, 0)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('W', 10, [0, 0], [0, 0])
    puts check_position(n_way, -10, 0)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('L', 90, [0, 10], [0, 0])
    puts check_position(n_way, -10, 0)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('R', 90, [0, 10], [0, 0])
    puts check_position(n_way, 10, 0)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('L', 180, [0, 10], [0, 0])
    puts check_position(n_way, 0, -10)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('R', 180, [0, 10], [0, 0])
    puts check_position(n_way, 0, -10)
    puts check_position(n_ship, 0, 0)

    n_way, n_ship = move('F', 10, [1, 1], [0, 0])
    puts check_position(n_way, 1, 1)
    puts check_position(n_ship, 10, 10)

    n_way, n_ship = move('F', 10, [1, -1], [0, 0])
    puts check_position(n_way, 1, -1)
    puts check_position(n_ship, 10, -10)

    n_way, n_ship = move('F', 10, [-1, -1], [0, 0])
    puts check_position(n_way, -1, -1)
    puts check_position(n_ship, -10, -10)

    n_way, n_ship = move('F', 10, [-1, 1], [0, 0])
    puts check_position(n_way, -1, 1)
    puts check_position(n_ship, -10, 10)

end

# validate_move()

lines = File.readlines('input_12.txt').map{|str| str.chomp}

waypoint, ship = navigate(lines)
# print_position(ship)
print "Distance: #{calc_manhatten(ship)}\n"
