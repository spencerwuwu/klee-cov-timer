klee -posix-runtime -optimize klee.out.bc -sym-arg <NUM>
klee-stats klee-last
