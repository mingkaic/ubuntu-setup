import sys
import yaml
import os
import subprocess
import time

supported_actions = {
	"add": add2Dest,
	"append": append2Dest,
	"prepend": prepend2Dest,
	"eval": evalCmd,
}

BACKUP_DIR = "~/cfg-backup"
if "CFG_BACKUP" in os.environ:
	BACKUP_DIR = os.environ["CFG_BACKUP"]

def confirmPath(path):
	if not os.path.exists(path):
		os.makedirs(path)

def backup(path):
	dest = os.path.join(BACKUP_DIR, os.path.basename(path) + str(time.time()))
	with open(path, "r") as src:
		with open(dest, "w") as dest:
			dest.write(src.read())

def add2Dest(cmd):
	if "source" not in cmd:
		raise Exception("invalid add: no source")
	if "dest" not in cmd:
		raise Exception("invalid add: no destination")

	source = cmd["source"]
	destination = cmd["destination"]
	backup(destination)
	confirmPath(destination)
	with open(source, "r") as src:
		with open(destination, "w") as dest:
			dest.write(src.read())
	
def append2Dest(cmd):
	if "source" not in cmd:
		raise Exception("invalid append: no source")
	if "dest" not in cmd:
		raise Exception("invalid append: no destination")

	source = cmd["source"]
	destination = cmd["destination"]
	backup(destination)
	with open(source, "r") as src:
		with open(destination, "a") as dest:
			dest.write(src.read())
	
def prepend2Dest(cmd):
	if "source" not in cmd:
		raise Exception("invalid prepend: no source")
	if "dest" not in cmd:
		raise Exception("invalid prepend: no destination")

	source = cmd["source"]
	destination = cmd["destination"]
	backup(destination)
	content = ""
	with open(source, "r") as src:
		content = src.read()

	with open(destination, "r") as dest:
		content = content + dest.read()

	with open(destination, "w") as dest:
		dest.write(content)

def evalCmd(cmd):
	if "source" not in cmd:
		raise Exception("invalid eval: no source")

	source = cmd["source"]
	with open(source, "r") as src:
		c = src.readline()
		while len(c) > 0:
			subprocess.call([c])
			c = src.readline()

def main(mfilename):
	with open(mfilename, "r") as mfile:
		mappings = yaml.load(mfile)
		print(mappings)
		# for cmd in mappings:
		# 	if "action" not in cmd:
		# 		raise Exception("invalid mapping: no action")
		# 	action = cmd["action"]
		# 	if action not in supported_actions:
		# 		raise Exception("unsupported action %s" % action)
		# 	supported_actions[action](cmd)

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("expecting mapping yaml file")
		sys.exit(1)

	main(sys.argv[1])
