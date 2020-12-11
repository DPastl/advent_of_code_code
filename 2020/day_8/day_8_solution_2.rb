def parse_ops(lines)
    clean_ops = []
    for line in lines
        op = line.split
        clean_ops.push([op[0], op[1].to_i])
    end
    return clean_ops
end

def run_program(op_code)
    index = 0
    accumulator = 0
    run_count = Array.new(op_code.length, 0)
    # print "#{op_code}\n"
    while index < op_code.length and run_count[index] == 0
        run_count[index] += 1
        case op_code[index][0]
        when 'nop'
            index += 1
        when 'acc'
            accumulator += op_code[index][1]
            index += 1
        when 'jmp'
            index += op_code[index][1]
        else
            print "Read ERROR\n"
        end
    end
    if index == op_code.length
        return true, accumulator, index
    else
        return false, accumulator, index
    end
end

def brute_force_fix(broken_code)
    for line_num in 0..broken_code.length-1
        # print "Line Number #{line_num}\n"
        if broken_code[line_num][0] == 'nop'
            broken_code[line_num][0] = 'jmp'
            # print "#{broken_code}\n"
            result = run_program(broken_code)
            # print "Run Clean: #{result[0]}, Acc: #{result[1]}, Index: #{result[2]}\n"
            if result[0]
                print "Fixed Code Changing nop on #{line_num} to jmp. Accumulator=#{result[1]}\n"
            end
            broken_code[line_num][0] = 'nop'
        elsif broken_code[line_num][0] == 'jmp'
            broken_code[line_num][0] = 'nop'
            # print "#{broken_code}\n"
            result = run_program(broken_code)
            # print "Run Clean: #{result[0]}, Acc: #{result[1]}, Index: #{result[2]}\n"
            if result[0]
                print "Fixed Code Changing jmp on #{line_num} to nop. Accumulator=#{result[1]}\n"
            end
            broken_code[line_num][0] = 'jmp'
        end
    end
end

lines = File.readlines('input_8.txt')
ops = parse_ops(lines)

brute_force_fix(ops)
# puts run_program(ops)
