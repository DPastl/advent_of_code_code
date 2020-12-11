def count_choices(list, start)
    start_val = list[start]
    possibilities = 0
    index = start+1
    while index < list.length and list[index]-start_val < 4
        possibilities += 1
        index += 1
    end
    return possibilities
end

lines = File.readlines('test_file_1.txt').map{|str| str.to_i}
lines.push(lines.max+3)
lines.push(0)

sorted_adapter_list = lines.sort
print "#{sorted_adapter_list}\n"
combinations = 1
for index in 0..sorted_adapter_list.length-2
    choices = count_choices(sorted_adapter_list, index)
    combinations *= choices
    print "Combinations: #{combinations}, Adapter: #{sorted_adapter_list[index]}, Choices: #{choices}\n"
end
print "Combinations: #{combinations}\n"
