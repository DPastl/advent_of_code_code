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
        else
            return op_codes
        end
    end
end

def search_solution(op_codes, solution)
    for noun in 0..99
        for verb in 0..99
            op_codes[1] = noun
            op_codes[2] = verb
            result = compute(op_codes.clone)
            if result[0] == solution
                print "Solution Found: noun=#{noun}, verb=#{verb}, answer=#{100*noun+verb}\n"
            end
        end
    end
end

opcodes = File.readlines("input_2_2.txt")[0].split(',').map{|str| str.to_i}
search_solution(opcodes, 19690720)
