lines = File.readlines('input_13.txt')
raw_buses = lines[1].split(",")
buses = []
for i in 0..raw_buses.length-1
    unless raw_buses[i] == 'x'
        buses.push([raw_buses[i].to_i, i])
    end
end
print "#{buses}\n"

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
