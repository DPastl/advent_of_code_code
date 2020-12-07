def decode(dl, sub_true, sub_false)
    dl = dl.gsub(/#{sub_true}/, "1")
    dl = dl.gsub(/#{sub_false}/, "0")
    return dl.to_i(2)
end

#test_line="BBFFBBFRLL"
#row=test_line[0..6]
#col=test_line[-3..-1]
#row_num = decode(row, "B", "F")
#col_num = decode(col, "R", "L")
#print "Binary  #{test_line} is Row #{row_num}, Col #{col_num}\n"

high_id = 0
File.open("input_5.txt").each do |line|
    line = line.strip
    row=line[0..6]
    col=line[-3..-1]
    row_num = decode(row, "B", "F")
    col_num = decode(col, "R", "L")
#    print "Binary  #{line} is Row #{row_num}, Col #{col_num}\n"
    id = row_num * 8 + col_num
    if (id > high_id)
        high_id = id
    end
end
print "Highest ID is #{high_id}\n"