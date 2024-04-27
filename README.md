# title-boxes
boxes around centered text

title-80.sh
--------------------------------------------------------------------------------
80 column title
now recognizes n
now ignores escape sequences

title-cmd.awk
--------------------------------------------------------------------------------
parse title.sh command line
builds command line string

title-test.sh
--------------------------------------------------------------------------------
a test of title-80.sh & title.sh

title.awk
--------------------------------------------------------------------------------
script: title.awk
  desc: boxes like program
   use:
      cat file | title.awk                      defaults
      cat file | title.awk -v t="shell"         type shell
      cat file | title.awk -v t="line"          type shell
      cat file | title.awk -v j="c"             just center
      cat file | title.awk -v j="r"             just right

 type: c, c-, c=, c/, c/-, c/=, shell, shell-, shell=,
       block, line, double, <default ascii>
 just: c, r, <default left>

title.sh
--------------------------------------------------------------------------------
prints ~/data/title.dat -or- alt file with border
now ignores escape sequences
