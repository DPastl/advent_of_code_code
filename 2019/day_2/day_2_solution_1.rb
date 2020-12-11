def compute(op_codes)
    index = 0
    while index < op_codes.length
        case op_codes[index]
        when 1
            op_codes[op_codes[index+3]] = op_codes[op_codes[index+1]] + op_codes[op_codes[index+2]]
            index += 4
        when 2
            op_codes[op_codes[index+3]] = op_codes[op_codes[index+1]] * op_codes[op_codes[index+2]]
            index += 4
        when 99
            print "Program Complete\n"
            return op_codes
        else
            print "Invalid opcode Found\n"
            return
        end
    end
end

test_opcodes_1 = [1,9,10,3,2,3,11,0,99,30,40,50]
result = compute(test_opcodes_1)
print "#{result}\n"

test_opcodes_2 = [1,0,0,0,99]
result = compute(test_opcodes_2)
print "#{result}\n"

test_opcodes_3 = 2,4,4,5,99,0
result = compute(test_opcodes_3)
print "#{result}\n"

opcodes = File.readlines("input_2.txt")[0].split(',').map{|str| str.to_i}
result = compute(opcodes)
print "Result: #{result[0]}\n"
