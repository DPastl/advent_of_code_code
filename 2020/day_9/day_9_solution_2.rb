def sum_lines_and_check(lines, start_point, check_num)
    sum = 0
    for index in start_point..lines.length-1
        sum += lines[index]
        if sum > check_num
            return false, 0
        elsif sum == check_num and index != start_point
            return true, index
        end
    end
    return false, 0
end

def find_weakness(lines, invalid_number)
    for index in 0..lines.length
        result = sum_lines_and_check(lines, index, invalid_number)
        if result[0]
            subarray = lines[index..result[1]]
            weakness = subarray.max + subarray.min
            print "Solution Found in lines #{index} to #{result[1]}. Weakness #{weakness}\n"
            print
        end
    end
end

print "Test File Solution\n"
lines = File.readlines('test_file.txt').map{|str| str.to_i}
find_weakness(lines, 127)

print "Actual File Solution\n"
lines = File.readlines('input_9.txt').map{|str| str.to_i}
find_weakness(lines, 36845998)
