def parse_passport(line)
    bits = line.split
    passport = {}
    for bit in bits
        key_val = bit.split(':')
        passport[key_val[0]] = key_val[1]
    end
    return passport
end

def validate_passport(required_keys, passport)
    for rkey in required_keys
        unless passport.key?(rkey)
            return false
        end
    end
    return true
end

line_collect = ""
valid_count = 0
required_keys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

File.open("input_4.txt").each do |line|
    if line.length == 1
        passport = parse_passport(line_collect)
        if validate_passport(required_keys, passport)
            valid_count += 1
        end
        line_collect = ""
    else
        line_collect += line
    end
end

print "Valid Count: " + valid_count.to_s + "\n"