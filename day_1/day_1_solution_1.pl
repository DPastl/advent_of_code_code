
open(inputfile, "input.txt");

chomp(my @lines = <inputfile>);

my @accending = sort {$a <=> $b} @lines;
my @decending = sort {$b <=> $a} @lines;

for $low_num (@accending){
    for $high_num (@decending){
        $sum = $high_num + $low_num;
        if ($sum == 2020){
            $mult = $high_num * $low_num;
            print "Numbers: $low_num, $high_num give $mult\n"
        }
    }
}


close inputfile;