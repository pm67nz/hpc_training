# print-args.R
#
# from Software Carpentry R lesson http://swcarpentry.github.io/r-novice-inflammation/05-cmdline/
#
# Date 7 March 2017
#
# run: Rscript print-args.R

args <- commandArgs()
cat(args, sep = "\n")