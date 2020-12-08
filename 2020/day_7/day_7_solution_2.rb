def decode_rule(line)
    matches = line.match(/^(.+)\sbags?\scontain\s(.+)./)
    clean_contents = []
    contents = matches[2].split(',')
    unless contents[0] == 'no other bags'
        for content in contents
            result = content.match(/(\d+)\s(.+)\sbags?/)
            clean_contents.push([result[1].to_i, result[2]])
        end
    end
    return { matches[1] => clean_contents}
end

def bag_count(rule_hash, starting_bag)
    total_bags = 1
    for rule_key in rule_hash.keys
        if rule_key == starting_bag
            for rule in rule_hash[rule_key]
                total_bags += rule[0] * bag_count(rule_hash, rule[1])
            end
        end
    end
    return total_bags
end

lines = File.readlines("input_7.txt").map(&:chomp)

rule_hash = {}
for line in lines
    rule_hash.merge!(decode_rule(line))
end
# puts rule_hash
bag_count = bag_count(rule_hash, 'shiny gold') - 1
print "Bag Count #{bag_count}\n"
