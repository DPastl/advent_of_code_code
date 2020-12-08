def calculate_fuel(mass)
    fuel = (mass.to_i / 3).floor - 2
    if fuel > 0
        return fuel + calculate_fuel(fuel)
    else
        return 0
    end
end

lines = File.read("input_1.txt").split

fuel_sum = 0
for line in lines
    fuel_sum += calculate_fuel(line)
end
print "Fuel Sum: #{fuel_sum}\n"
