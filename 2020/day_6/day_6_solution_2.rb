require 'set'

def is_char_in_all(char, answer_lists)
    for answers in answer_lists
        unless answers.match(/#{char}/)
            return false
        end
    end
    return true
end

def count_answers(answer_list)
    if answer_list.length() == 1
        return answer_list[0].split(//).to_set.length
    end
    
    unique_chars = answer_list[0].split(//).to_set
    uchar_count = 0
    for uchar in unique_chars
        if(is_char_in_all(uchar, answer_list[1..-1]))
            uchar_count += 1
        end
    end
    return uchar_count
end


line_array = []
count = 0
File.open("input_6.txt").each do |line|
    if line.length == 1
        count += count_answers(line_array)
        line_array = []
    else
        line_array.push(line.strip)
    end
end
print "Total sum is #{count}\n"