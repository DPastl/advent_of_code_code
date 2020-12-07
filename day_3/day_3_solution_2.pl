sub test_path{
    my (@ops) = @_;
    my $row_increment = $ops[0];
    my $col_increment = $ops[1];
    my @lines = @{$_[2]};
    
    $num_cols = length $lines[0];
    $num_rows = $#lines;
    
    $cur_col = 0;
    $cur_row = 0;

    my $tree_count = 0;

    while ($cur_row <= $num_rows){
        $adjusted_col = $cur_col % $num_cols;
        $char = substr($lines[$cur_row], $adjusted_col, 1);

        #print "Row: $cur_row, Col: $adjusted_col, Char: $char\n";

        if ($char eq '#'){
            $tree_count += 1;
        }

        $cur_row += $row_increment;
        $cur_col += $col_increment;
    }
    print "Tree Count: $tree_count\n";
    return $tree_count;
}

open(inputfile, "input_3.txt");
chomp(my @lines = <inputfile>);

@paths = ([1, 1], [3, 1], [5, 1], [7, 1], [1, 2]);

for $path (0 .. $#paths){
    $tree_counts[$path] = test_path($paths[$path][1], $paths[$path][0], \@lines);
}

$answer = $tree_counts[0] * $tree_counts[1] * $tree_counts[2] * $tree_counts[3] * $tree_counts[4];
print "Answer: $answer\n"