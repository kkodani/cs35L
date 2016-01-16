#!/usr/bin/python

import random, sys, string
from optparse import OptionParser

class randline:
	def __init__(self, filenames, unique, numlines, withoutreplacement):
		self.lines = []
		self.withoutreplacement = withoutreplacement
		totalLines = 0
		
		for filename in filenames:
			f = open(filename, 'a+')
			if f.read()[-1] != '\n':
				f.write('\n')
			f.close()
				
		for filename in filenames:
			f = open(filename, 'r')
			for line in f.readlines():
				self.lines.append(line)
			f.close()
		
		for filename in filenames:
			f = open(filename, 'r')
			totalLines = totalLines + len(f.readlines())
		
		if unique:
			self.lines = list(set(self.lines))
			
		if numlines > totalLines:
			sys.exit("numlines arg is greater than the total number of lines of your file[s]")
		
	def chooseline(self):
		if self.withoutreplacement:
			randomIndex = random.randint(0, len(self.lines)-1)
			randomLine = self.lines[randomIndex]
			del self.lines[randomIndex]
			return randomLine
		else:
			return random.choice(self.lines)
	

def main():
	version_msg = "%prog 2.0"
	usage_msg = """%prog [OPTION]... FILE

Output randomly selected lines from FILE."""

	parser = OptionParser(version=version_msg,
                          usage=usage_msg)
	parser.add_option("-n", "--numlines",
                      action="store", dest="numlines", default=1,
                      help="output NUMLINES lines (default 1)")
	parser.add_option("-u", "--unique", 
					  action="store_true", dest="unique", default=0,
					  help="Do not output duplicate lines")
	parser.add_option("-w", "--without-replacement", 
					  action="store_true", dest="withoutreplacement", default=0,
					  help="Output lines without replacement")
	options, args = parser.parse_args(sys.argv[1:])

	try:
		numlines = int(options.numlines)
	except:
		parser.error("invalid NUMLINES: {0}".
                     format(options.numlines))
	if numlines < 0:
		parser.error("negative count: {0}".
                     format(numlines))
	if len(args) < 1:
		parser.error("wrong number of operands")
	input_files = args[0:]

	try:
		generator = randline(input_files, options.unique, numlines, options.withoutreplacement)
		for index in range(numlines):
			sys.stdout.write(generator.chooseline())
			
	except IOError as err:
		parser.error("I/O error({0}): {1}".
                     format(err.errno, err.strerror))

if __name__ == "__main__":
	main()

