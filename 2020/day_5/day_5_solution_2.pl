sub decode_row{
    my (@ops) = @_;
    my $dl = $ops[0];
        
    $dl =~ tr/B/1/;
    $dl =~ tr/F/0/;    
    return oct("0b".$dl)
}

sub decode_col{
    my (@ops) = @_;
    my $dl = $ops[0];
        
    $dl =~ tr/R/1/;
    $dl =~ tr/L/0/;    
    return oct("0b".$dl)
}

open(inputfile, "input_5.txt");

chomp(my @lines = <inputfile>);

@ids = ();
for $line (@lines){
    $row = substr $line, 0, 7;
    $col = substr $line, -3;
    
    $row_num = decode_row($row);
    $col_num = decode_col($col);
    $id = $row_num * 8 + $col_num;
    push(@ids, $id);
}

my @accending = sort {$a <=> $b} @ids;

my %params = map { $_ => 1 } @accending;

for $id (1..$accending[-1]){
    unless(exists($params{$id})){
        print "Empty Seat ID: $id\n"
    }

}
