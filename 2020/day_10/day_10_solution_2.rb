lines = File.readlines('input_10.txt').map{|str| str.to_i}
lines.push(lines.max+3)

sorted_adapter_list = lines.sort
print "#{sorted_adapter_list}\n"
jolt_diff_count = []
traversal_count = [1, 1, 2, 4, 7]
successive_list = []

last_jolt = 0
count = 0
options = 1
for device in sorted_adapter_list
    jolt_diff_count.push(device-last_jolt)
    if device-last_jolt == 3
        successive_list.push(count)
        options *= traversal_count[count]
        count = 0
    else
        count += 1
    end
    last_jolt = device
end

print "#{options}\n"
print("successive_list: #{successive_list}\n")
print "Jolt Differences: #{jolt_diff_count}\n"
