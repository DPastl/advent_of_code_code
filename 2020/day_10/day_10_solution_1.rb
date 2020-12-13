lines = File.readlines('test_file_2.txt').map{|str| str.to_i}
lines.push(lines.max+3)

sorted_adapter_list = lines.sort
jolt_diff_count = [0, 0, 0]

last_jolt = 0
for device in sorted_adapter_list
    jolt_diff_count[device-last_jolt-1] += 1
    last_jolt = device
end
print "Jolt Differences: #{jolt_diff_count}.  Answer=#{jolt_diff_count[0]*jolt_diff_count[2]}\n"
