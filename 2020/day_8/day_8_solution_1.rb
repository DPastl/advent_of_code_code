lines = File.readlines('test_input.txt')

clean_ops = []
for line in lines
    op = line.split
    clean_ops.push([op[0], op[1].to_i, 0])
end

index = 0
accumulator = 0
last_instruction_index = 0
while clean_ops[index][2] == 0
    clean_ops[index][2] += 1
    case clean_ops[index][0]
    when 'nop'
        index += 1
    when 'acc'
        accumulator += clean_ops[index][1]
        index += 1
    when 'jmp'
        index += clean_ops[index][1]
    else
        print "Read ERROR\n"
    end
end

print "Accumulator Value: #{accumulator}, Index: #{index}\n"
