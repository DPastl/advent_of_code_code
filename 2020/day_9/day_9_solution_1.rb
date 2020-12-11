def valid_number_expander(preamble)
    answer_list = []
    # print "#{preamble}\n"
    for index in 0..preamble.length
        for innerdex in index+1..preamble.length-1
            # print "index: #{index}, innerdex: #{innerdex}\n"
            answer_list.push(preamble[index] + preamble[innerdex])
        end
    end
    return answer_list
end

def scan_xmas(lines, preamble_length)
    for index in preamble_length..lines.length-1
        preamble_start = index-preamble_length
        # print "Start: #{preamble_start}, Index: #{index}, Length:#{preamble_length}\n"
        answer_list = valid_number_expander(lines[preamble_start..index-1])
        # print "Check against #{lines[index]}\n"
        unless answer_list.include? lines[index]
            print "Error Found on line #{index}, Number: #{lines[index]}\n"
        end
    end
end

print "Test File Solution\n"
lines = File.readlines('test_file.txt').map{|str| str.to_i}
scan_xmas(lines, 5)

print "Actual File Solution\n"
lines = File.readlines('input_9.txt').map{|str| str.to_i}
scan_xmas(lines, 25)
