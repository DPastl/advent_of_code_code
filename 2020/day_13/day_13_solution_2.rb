lines = File.readlines('test_file.txt')
raw_buses = lines[1].split(",")
buses = []
for i in 0..raw_buses.length-1
    unless raw_buses[i] == 'x'
        buses.push([raw_buses[i].to_i, i])
    end
end
print "#{buses}\n"

def next_arrival(bus, current_time)
    closest_index = ((current_time).to_f/bus[0]).ceil
    return closest_index * bus[0]
end

def list_correct(buses, depart_list)
    list_correct = true
    for i in 0..buses.length-2
        unless depart_list[0] + buses[i+1][1] == depart_list[i+1]
            list_correct = false
        end
    end
    return list_correct
end

# t1 = Time.now
# time_index = 0
# solution_found = false
# while not solution_found
#     time_index += 1
#     t = buses[0][0]*time_index
#     depart_list = [t]
#     for i in 1..buses.length-1
#         depart_list.push(next_arrival(buses[i], t))
#     end
#     solution_found = list_correct(buses, depart_list)
# end
# print "Time Index: #{time_index}, Time: #{time_index*buses[0][0]}\n"
# t2 = Time.now
# print "Time: #{t2-t1}\n"

t1 = Time.now
time_index = 0
solution_found = false
while not solution_found
    time_index += 1
    time = buses[0][0]*time_index
    depart_list = []
    for i in 1..buses.length-1
        depart_list.push(((time+buses[i][1])%buses[i][0]).zero?)
    end
    solution_found = not(depart_list.include? false)
end
print "Time Index: #{time_index}, Time: #{time_index*buses[0][0]}\n"
t2 = Time.now
print "Time: #{t2-t1}\n"

# t1 = Time.now
# time = 1068781
# depart_list = []
# for i in 1..buses.length-1
#     depart_list.push(((time+buses[i][1])%buses[i][0]).zero?)
# end
# print "Depart List: #{depart_list}\n"
# print "List Correct: #{depart_list.include? false}\n"
# t2 = Time.now
# print "Time: #{t2-t1}\n"
