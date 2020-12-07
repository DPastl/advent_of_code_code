open(inputfile, "input_3.txt");
chomp(my @lines = <inputfile>);

$num_cols = length $lines[0];
$num_rows = $#lines;

print "Num Rows: $num_rows, Num Cols: $num_cols\n";

$row_increment = 1;
$col_increment = 3;

$cur_col = 0;
$cur_row = 0;

$tree_count = 0;

while ($cur_row <= $num_rows){
    $adjusted_col = $cur_col % $num_cols;
    $char = substr($lines[$cur_row], $adjusted_col, 1);

    print "Row: $cur_row, Col: $adjusted_col, Char: $char\n";

    if ($char eq '#'){
        $tree_count += 1;
    }

    $cur_row += $row_increment;
    $cur_col += $col_increment;
}
print "Tree Count: $tree_count\n" 