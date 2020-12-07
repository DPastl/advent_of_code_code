def test_path(row_inc, col_inc, lines)
    num_cols = lines[0].length
    num_rows = lines.length()
    
    cur_col = 0
    cur_row = 0
    tree_count = 0

    while (cur_row < num_rows)
        adjusted_col = cur_col % num_cols
        char = lines[cur_row][adjusted_col]

#        print "Row: #{cur_row}, Col: #{adjusted_col}, Char: #{char}\n";

        if (char == '#')
            tree_count += 1
        end

        cur_row += row_inc
        cur_col += col_inc
    end
    print "Tree Count: #{tree_count}\n"
    return tree_count
end

lines = File.read("input_3.txt").split
paths = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]];

result = 1
for path in paths
    result *= test_path(path[1], path[0], lines)
end
print "Result: #{result}\n"