import sys
import yaml
import os
import subprocess
import time

BACKUP_DIR = "~/cfg-backup"
if "CFG_BACKUP" in os.environ:
    BACKUP_DIR = os.environ["CFG_BACKUP"]

def confirmPath(path):
    dir = os.path.dirname(path)
    if not os.path.exists(dir):
        os.mkdir(dir)

def backup(path):
    if not (os.path.exists(BACKUP_DIR) and os.path.exists(path)):
        return # don't backup
    destPath = os.path.join(BACKUP_DIR, os.path.basename(path) + str(time.time()))
    with open(path, "r") as src:
        with open(destPath, "w") as dest:
            dest.write(src.read())

def add2Dest(cmd):
    if "source" not in cmd:
        raise Exception("invalid add: no source")
    if "dest" not in cmd:
        raise Exception("invalid add: no destination")

    source = cmd["source"]
    destination = cmd["dest"]
    confirmPath(destination)
    backup(destination)
    with open(source, "r") as src:
        with open(destination, "w") as dest:
            dest.write(src.read())

def append2Dest(cmd):
    if "source" not in cmd:
        raise Exception("invalid append: no source")
    if "dest" not in cmd:
        raise Exception("invalid append: no destination")

    source = cmd["source"]
    destination = cmd["dest"]
    backup(destination)
    with open(source, "r") as src:
        with open(destination, "a") as dest:
            dest.write('\n')
            dest.write(src.read())

def prepend2Dest(cmd):
    if "source" not in cmd:
        raise Exception("invalid prepend: no source")
    if "dest" not in cmd:
        raise Exception("invalid prepend: no destination")

    source = cmd["source"]
    destination = cmd["dest"]
    backup(destination)
    content = ''
    with open(source, "r") as src:
        content = src.read()

    with open(destination, "r") as dest:
        content = content + '\n' + dest.read()

    with open(destination, "w") as dest:
        dest.write(content)

supported_actions = {
    "add": add2Dest,
    "append": append2Dest,
    "prepend": prepend2Dest,
}

def main(mfilename):
    with open(mfilename, "r") as mfile:
        mappings = yaml.safe_load(mfile)
        for cmd in mappings:
            if "action" not in cmd:
                raise Exception("invalid mapping: no action")
            action = cmd["action"]
            if action not in supported_actions:
                raise Exception("unsupported action %s" % action)
            supported_actions[action](cmd)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("expecting mapping yaml file")
        sys.exit(1)

    main(sys.argv[1])
