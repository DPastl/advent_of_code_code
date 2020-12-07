require 'set'

def count_answers(line)
    unique_chars = line.split(//).to_set
    return unique_chars.length
end


line_collect = ""

count = 0
File.open("input_6.txt").each do |line|
    if line.length == 1
        count += count_answers(line_collect)
        line_collect = ""
    else
        line_collect += line.strip
    end
end
print "Total sum is #{count}\n"