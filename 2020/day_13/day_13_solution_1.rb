lines = File.readlines('input_13.txt')
leave_time = lines[0].to_i
buses = lines[1].split(",")
buses.delete("x")
buses_i = buses.map{|str| str.to_i}

bus_depart_times = []
for bus in buses_i
    val = leave_time / bus
    next_depart = bus*val + bus - leave_time
    bus_depart_times.push(next_depart)
end

earliest = bus_depart_times.min
ebus = buses_i[bus_depart_times.index(earliest)]

print "#{buses_i}\n"
print "Earlist Time: #{earliest}, Bus ID: #{ebus}\n"
print "Answer: #{earliest * ebus}\n"
