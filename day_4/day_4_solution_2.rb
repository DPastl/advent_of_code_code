def parse_passport(line)
    bits = line.split
    passport = {}
    for bit in bits
        key_val = bit.split(':')
        passport[key_val[0]] = key_val[1]
    end
    return passport
end

def validate_passport_keys(required_keys, passport)
    for rkey in required_keys
        unless passport.key?(rkey)
            return false
        end
    end
    return true
end

def validate_year(value, start_year, end_year)
    if value.length == 4
        value_int = value.to_i
        if value_int >= start_year and value_int <= end_year
            return true
        end
    end
    return false
end

def validate_height(height)
    # If cm, the number must be at least 150 and at most 193.
    # If in, the number must be at least 59 and at most 76.
    inmatch = height.match(/^(\d{2})in\z/)
    if inmatch
        height_i = inmatch[1].to_i
        if height_i >= 59 and height_i <= 76
            return true
        end
    end
    cmmatch = height.match(/^(\d{3})cm\z/)
    if cmmatch
        height_i = cmmatch[1].to_i
        if height_i >= 150 and height_i <= 193
            return true
        end
    end
    return false
end

def validate_hcl(hcl)
    # a # followed by exactly six characters 0-9 or a-f.
    return hcl.match(/#([a-f]|\d){6}\z/)
end

def validate_ecl(ecl)
    # exactly one of: amb blu brn gry grn hzl oth.
    valid_colours = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
    return valid_colours.include? ecl
end

def validate_pid(passport_id)
    # 9 digits
    return passport_id.match(/^\d{9}\z/)
end

def validate_passport(passport)
    required_keys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    if validate_passport_keys(required_keys, passport)
#        puts "Valid Keys"
        unless validate_year(passport['byr'], 1920, 2002)
#            puts "Invalid Birth Year"
            return false
        end
        unless validate_year(passport['iyr'], 2010, 2020)
#            puts "Valid Issue Year"
            return false
        end
        unless validate_year(passport['eyr'], 2020, 2030)
#            puts "Valid Expiration year"
            return false
        end
        unless validate_height(passport['hgt'])
#            puts "Valid Height"
            return false
        end
        unless validate_hcl(passport['hcl'])
#            puts "Valid Hair Colour"
            return false
        end
        unless validate_ecl(passport['ecl'])
#            puts "Valid Eye Colour"
            return false
        end
        unless validate_pid(passport['pid'])
#            puts "Valid Passport ID"
            return false
        end
        return true
    end
end

#test_passport_valid = {"pid" => "087499704", "hgt" => "74in", "ecl" => "grn", "iyr" => "2012", "eyr" => "2030", "byr" => "1980", "hcl" => "#623a2f"}
#test_passport_invalid = {"pid" => "08749970", "hgt" => "77in", "ecl" => "yel", "iyr" => "2021", "eyr" => "2031", "byr" => "1919", "hcl" => "#623g2f"}

#result = validate_passport(test_passport_valid)



line_collect = ""
valid_count = 0

File.open("input_4.txt").each do |line|
    if line.length == 1
        passport = parse_passport(line_collect)
        if validate_passport(passport)
            valid_count += 1
        end
        line_collect = ""
    else
        line_collect += line
    end
end

print "Valid Count: " + valid_count.to_s + "\n"