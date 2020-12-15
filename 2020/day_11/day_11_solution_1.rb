OCCUPIED_SEAT = '#'
EMPTY_SEAT = 'L'
FLOOR = '.'

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

def count_adjacent(seating, check_row, check_column)
    adjacent_count = 0
    for row in check_row-1..check_row+1
        if row >= 0 and row < seating.length
            for column in check_column-1..check_column+1
                if column >= 0 and column < seating[row].length
                    unless row == check_row and column == check_column
                        if seating[row][column] == OCCUPIED_SEAT
                            adjacent_count += 1
                        end
                    end
                end
            end
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
                elsif nearby_count >= 4 and seating[row][column] != EMPTY_SEAT
                    new_seating[row][column] = EMPTY_SEAT
                    change_count += 1
                end
            end
        end
    end
    return new_seating, change_count
end

seating = File.readlines("input_11.txt").map{|str| str.chomp}.map{|str| str.chars}

changes = 1
iterations = 0
while changes != 0 and iterations < 100
    seating, changes = update_seating(seating)
    iterations += 1
end
print "Changes: #{changes}, Iterations: #{iterations}, Total Occupied: #{count_occupied(seating)}\n"
print_seating(seating)
