def decode_rule(line)
    matches = line.match(/^(.+)\sbags?\scontain\s(.+)./)
    clean_contents = []
    contents = matches[2].split(',')
    unless contents[0] == 'no other bags'
        for content in contents
            clean_contents.push(content.match(/\d+\s(.+)\sbags?/)[1])
        end
    end
    return { matches[1] => clean_contents}
end

def create_tree(rule_hash, starting_bag)
    key_list = []
    for rule_key in rule_hash.keys
        if rule_hash[rule_key].include? starting_bag
            unless key_list.include? rule_key
                key_list.push(rule_key)
                more_keys = create_tree(rule_hash, rule_key) # dangerously call ourself and hope
                key_list = (key_list + more_keys).uniq # removes duplicates
            end
        end
    end
    return key_list
end

lines = File.readlines("input_7.txt").map(&:chomp)

rule_hash = {}
for line in lines
    rule_hash.merge!(decode_rule(line))
end
# puts rule_hash
option_list = create_tree(rule_hash, 'shiny gold')
print "Results\n#{option_list}\n"
print "Total Options: #{option_list.length}\n"
