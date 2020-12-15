OCCUPIED_SEAT = '#'
EMPTY_SEAT = 'L'
FLOOR = '.'
# Directions in format Row, Column
directions = [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]

def print_seating(seating)
    for row in seating
        for item in row
            print "#{item}"
        end
        print "\n"
    end
end

def count_occupied(seating)
    total = 0
    for row in seating
        total += row.count(OCCUPIED_SEAT)
    end
    return total
end

def check_direction(seating, start_row, start_column, row_increment, column_increment)
    row = start_row + row_increment
    column = start_column + column_increment
    next_seat = '.'
    # print "Start Row: #{row+1}, Start Column: #{column+1}\n"
    while row >= 0 and row < seating.length and column >= 0 and column < seating[0].length and next_seat == '.'
        next_seat = seating[row][column]
        # print "Row: #{row+1}, Column: #{column+1}, Position: #{next_seat}\n"
        row += row_increment
        column += column_increment
    end
    return next_seat
end

def count_adjacent(seating, check_row, check_column)
    adjacent_count = 0
    for direction in [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1], [0, -1], [1, -1]]
        if check_direction(seating, check_row, check_column, direction[0], direction[1]) == OCCUPIED_SEAT
            adjacent_count += 1
        end
    end
    return adjacent_count
end

def update_seating(seating)
    new_seating = seating.clone.map(&:clone)
    change_count = 0
    for row in 0..seating.length-1
        for column in 0..seating[0].length-1
            unless seating[row][column] == FLOOR
                nearby_count = count_adjacent(seating, row, column)
                if nearby_count == 0 and seating[row][column] != OCCUPIED_SEAT
                    new_seating[row][column] = OCCUPIED_SEAT
                    change_count += 1
                elsif nearby_count >= 5 and seating[row][column] != EMPTY_SEAT
                    new_seating[row][column] = EMPTY_SEAT
                    change_count += 1
                end
            end
        end
    end
    return new_seating, change_count
end

# seating = File.readlines("test_file_3.txt").map{|str| str.chomp}.map{|str| str.chars}
# puts count_adjacent(seating, 4, 3)
#
# seating = File.readlines("test_file_4.txt").map{|str| str.chomp}.map{|str| str.chars}
# puts count_adjacent(seating, 1, 3)
#
# seating = File.readlines("test_file_5.txt").map{|str| str.chomp}.map{|str| str.chars}
# puts count_adjacent(seating, 3, 3)

changes = 1
iterations = 0
seating = File.readlines("input_11.txt").map{|str| str.chomp}.map{|str| str.chars}
while changes != 0 and iterations < 100
    seating, changes = update_seating(seating)
    iterations += 1
end
print "Changes: #{changes}, Iterations: #{iterations}, Total Occupied: #{count_occupied(seating)}\n"
print_seating(seating)
