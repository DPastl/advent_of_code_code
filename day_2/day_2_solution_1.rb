def break_line(line)
    bits = line.split
    char=bits[1].chomp(':')
    start_end = bits[0].split('-')
    return start_end[0].to_i, start_end[1].to_i, char, bits[2]
end

def validate_password(line)
    char_count = line[3].count(line[2])
    if char_count >= line[0] and char_count <= line[1] 
        return true
    else
        return false
    end
end

count = 0
File.open("input.txt").each do |line|
    bline = break_line(line)
    if validate_password(bline)
        count += 1
    end
end
puts count