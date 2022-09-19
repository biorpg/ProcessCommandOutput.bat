# pco (Process Command Output)

Feed the stdout of a windows console command/program into another command using a for loop.
Command piping in windows(without using WSL) is a pain, and remembering the 'usebackq' syntax of 'for' is as unreasonable as remembering how to use findstr instead of grep, sed or awk, so I made this.


Todo:
Add option to adjust the 'tokens' and 'delimiters' options of the for loop.
Make the for loop recursive so you can process the output of the command that processed the output of the command that processed the...
