import unittest
import os

add_dest = "/tmp/add_test"
append_dest = "/tmp/append_test"
prepend_dest = "/tmp/prepend_test"

eval_map = {
	'0TncDSEmvBBrC6E4xIvx': '6HWORvdp3yy8rHMPngLW',
	'XcSFIIA7G2GF1WLlFbf4': 'khdqQYYGh7AmTYZNFQ0U'
}

curdir = os.path.dirname(os.path.realpath(__file__))
with open(os.path.join(curdir, 'add_test'), 'r') as f:
	expect_add = f.read()

with open(os.path.join(curdir, 'expect_append'), 'r') as f:
	expect_append = f.read()

with open(os.path.join(curdir, 'expect_prepend'), 'r') as f:
	expect_prepend = f.read()

class TestDirs(unittest.TestCase):
	def test_dev_dir(self):
		self.assertTrue(os.path.exists(os.path.join(os.environ["HOME"], "Developer")))

	def test_tool_dir(self):
		self.assertTrue(os.path.exists(os.path.join(os.environ["HOME"], "Tools")))

	def test_cfg_dir(self):
		self.assertTrue(os.path.exists(os.path.join(os.environ["HOME"], "cfg-backup")))

class TestConfigure(unittest.TestCase):
	def test_add(self):
		addexists = os.path.exists(add_dest)
		self.assertTrue(addexists)
		if addexists:
			with open(add_dest, 'r') as f:
				got_add = f.read()
				self.assertEqual(expect_add, got_add)

	def test_append(self):
		check(self, expect_append, append_dest)

	def test_prepend(self):
		check(self, expect_prepend, prepend_dest)

	def test_eval(self):
		for fname in eval_map:
			expect_eval = eval_map[fname]
			fpath = os.path.join('/tmp', fname + '.txt')
			check(self, expect_eval, fpath)

def check(self, expect, fpath):
	exists = os.path.exists(fpath)
	self.assertTrue(exists)
	if exists:
		with open(fpath, 'r') as f:
			got = f.read()
			self.assertEqual(expect, got)

if __name__ == '__main__':
	assert("HOME" in os.environ)
	unittest.main()
