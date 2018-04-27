import unittest
import os

add_dest = "/tmp/add_test"
append_dest = "/tmp/append_test"
prepend_dest = "/tmp/prepend_test"

eval_map = {
	'0TncDSEmvBBrC6E4xIvx': '6HWORvdp3yy8rHMPngLW',
	'XcSFIIA7G2GF1WLlFbf4': 'khdqQYYGh7AmTYZNFQ0U',
	'iG2jLssf6zHlwENdMY7l': 'rlRr2yb98XMZajGge95Y',
	'3mmg7pnIbqImXVWoGmvy': 'ZIWQ9EIvQpUuhkl0Fs0R',
	'D0lUTROMrsDzeNReyrYd': 'qLkGjl5GYgOrmBdHQjam',
	'1B0CyvRtcRsJOfXiU0YQ': 'Z6OmPK2X9cQ3DzYf8PAQ',
	'I54n1BjnDWcgT33MlxHs': 'ZhCGwJ6bw8Osutt5DMNN',
	'VqIaxlNmnCfktLFgTgei': 'Gcbw37yIN09jAUjBFQyV',
	'8hvQUJz9es37Ly0aXelb': 'Xt7IhwoiFVHsunigeL5v',
	'TMRKmYkvxN3esqiuclKn': 'KmqX2jlJ1mqEhUESOz1B',
	'Wg89hjc6iKueKcPbAiCO': 'XaS6TjWvtpjJUAEXkKBH',
	'IF0ZnmTzgE1PR6Rtxgex': 'hv22MTNm1VRvHoFgWZMS',
	'DrTu3IeEYSoayOYtSj1C': 'AhziFTr1arLaoXF7OotF',
	'XglTcmA4askw0xtY3JJk': 'CzPgc5zcp5z2SCg6fDqV',
	'mD6xiKT6t2OYud5Tzq9k': 'pOj6FRaau8u5wFkPDYPk',
	'u4W3dnPVmQqtItOcfSp2': '2m0r7vqtw8hSAFc78Op6',
	'Pb7PVfOrJu3rGfabfDXU': 'LCh3yoSAP06VNPKteG7q',
	'A1i70PUAq5iPd857ScXA': '99dY4IpkXam84d9wWWkW',
	'HXYMdptQm1ka8fMQOluY': 'QHZwdYsQVwMtj5mHgSG5',
	'DGXYZxxrvLcUoQ0x7d70': 'KdGGyGWoLygz2P3w0pXe',
	'qgUBibtbY355NtL45IHN': 'fNwStfHZLI7aSrjVD7lC',
	'LnycPRjwQNrPkOlnnEpu': 'p1STkspmNUsOmA4Ezkm3',
	'ZSuYxNk4ZYqZ81eiKsJQ': 'Sp49BW4PtgKFTKKYO9J1',
	'ZxAgHdz6DgboJNw6g2XS': 'W8Y7SAHVUOOrV9P9BR8e',
	'Kqvz3T6gVDMBGoBYzXk2': 'Gp9dFAVZypdX7dXXGS6A',
	'47voM9d9yaHTvOSgFitC': 'BbGc9McISBmhIja0VfDa',
	'PPE4v9bJ2AT3tPfmhU8c': '7yewRXYizRC5aFLKGInI',
	'n61tjrbPENK4fItHofrs': 'zA2QZTdzM8LjYSnFUWcS',
	'kVSpyPyj6fVMlp6HmUab': 'ul0f2WANHaHjncxfs3zk',
	'c8RcxlWQWuimNN6Es0L5': '8MApYrlIf8LgiB25xCWY',
	'Sp7t05ClMVYn9cwNpHmm': '78yhlwoaY4aypY6ptqzm',
	'4nEaVhCmpnuqMIbT22dn': '3gQeoIJIruf5Yo09PEWj',
	'ifnWdvt7WwemanwuHWLm': '3erOxhlkBbVsYkxfeI7A',
	'XmBXp2kccUx3cUKiYbYY': '1rTiI7250EdmeV07P9oT',
	'Mbl7bj0r6q9vFTghg9Yb': 'unWDlDT176jzWiyk8n4q',
	'ABp78pakEadZVbcxx2vB': 'feXbO37IOnV5Mkx2INe2',
	'wBhD5UGrZ7JrBcx5mwRf': 'pnyOZyU3XwBRBCpApuUG',
	'r4Kp9AJCRXIiXYjTYvu6': 'faapdqUChOt2vMN38SsO',
	'vE3vjZGAq0LxAuvjDyZp': 'mxCDQIN8d6nnfmRRmVSZ',
	'ZFVCRYMSabQdh0NxPEsT': 'n4oB1kw1WZuARnhgg1NQ',
	'nY17FkJcvvECtU71rSkI': 'B02IL8K76vkeFaCSbAh3',
	'c6DQeBJU3Pw86w1q8gXi': 'j7AKfgLFKxMuEgY5PJcf',
	'gdhR7YedDBEu3h1iahxw': 'bNHe095UpBD6dIVVZJvW',
	'li1vvsqjRd2kIgrjHhPY': 'pmmZM0WnFd4q4NnlcDxI',
	'1yeGq2KmJyKCyT6H43r8': 'sPsWqaF40HsCD7qJ5fBR',
	'GTYZzNAREcKhU4NHEcBE': 'Jzi5xupvKL3XNQYxX5Cy',
	'Qp5WMxmuduaWeQ2zSBX1': 'S9dSEz1DdFJdWvrzW1cB',
	'5F8BkEwkYMcCbZ5JeWV9': 'zFOG6XwLAbSLKvOOSvf8',
	'Tai87E2VDacvlGMx2Fqa': 'GAvnH1GPIHYHyJsKH5zz',
	'VIYPpsptcUzCAgoXU3PK': 'O1U6Mhfno4nsMegpwtx8',
	'422R8evYyyCy5UcmXAtw': '7bPziksdQiieH4j9RAMp',
	'mNNtB7nE5k1d5FoxiE9h': 'nXF2NhBrqYc26z5Qi7kj',
	'U4h16FIaGZqxgYiy4SHK': 'RGQ2YLwWXG33hCquqTtp',
	'DAhzLWgtTlntywLACkQr': 'ZNkKYwI7xBcpRrNTWZve',
	'5DYKQjiEiH4qhZjjt6HJ': '4otKnSyaPwPd4092Bd6h',
	'4iv5uaOTAZeGCclm6z4g': 'j33OYKDHCJBMOaQYfyqQ',
	'GwNKa3ziNorBTBCup1zz': 'WzLFlGWrAAMifxDHXzFY',
	'g80YVNrgrUqwDULYakpw': 'xtV0oJX9qEPmAhIRMwJz',
	'Q0Xte9D2WB5dww4NZHvZ': '4fhprnpg5O4K4xcvs632',
	'hMYWA3LTWnswrXmiX7Fy': 'puPGL164n3k1VOUhU8vQ',
	'ayGo7VXYTl8wrt75krzw': 'nunUR1S9oykkkgkALr72',
	'kzRMaJYob31jZArmMHox': 'hFpHL88BHFzI9SYq3fP2',
	'xCA5kgQimHBRjzuv87ZA': 'uvOGGGUsNoTldWFgeKvZ',
	'W0al9UfLz9P2MyF2tlr2': 'wN5uH3ReuMkZAyf41tLb',
	'e6v1FnodrglZmzvpPEwi': 'MTieURRcUHrXG3KMT0mM',
	'0OINMEDHUQvOlL4s1xEQ': 'Z2ezQsriFHqka2KCRScF',
	'hvnK20PXGF6pD2d2KYvV': 'HB3jW3DURSv6QeqWs3KK',
	'iwhDWqkpsKe9QBKxwes3': 'VcFv0Zjq7V1bS25WQjk4',
	'nlGu9nlVHeLu3UTKzAqn': 'wVqKxFf91WnpvUSIMJrZ',
	'jYPVvXgJd95TxoK9VPSX': 'irnLbIXTH7w4frTqxb3t',
	'KFAykJVlmXbcn60BzgK6': 'fWv2hwZWsKQP6lsATpCB',
	'uNTSthfUi4LLJ8gM40R2': 'ghkMliwHFk8ENoc214I6',
	'XlRPAcxupiPRS1nX1Ggl': 'O3fqOzxRxIuyfGNUFB8n',
	'bybDltWVSXqVX4jW2pkF': 'WzG9uOFbUsc4lZP1LuWp',
	'Ru74XdoUFjv3ssATz7m4': 'WM3sQSjUqqFmBKcdVpAQ',
	'LydrvCn3Z90NtSUH5pFZ': 'rv7bYlx8v9pXx7ofoHoW',
	'zNYyqLjk04yq2aFFYDZn': '1rQZsXYKs1QozjG9gcow',
	'xMJsHc7aTsfuK6hyAHit': '9VEjjLvXI2AXuwMWnEL1',
	'bWspALBsP1SEj1BwVeVr': '5p3NR9L5eeFlaJxALNuB',
	'3QZakauPimpJ1utAINVq': 'viJTQ49gUYfKg41xE6AF',
	'5VSIlgmtpX1Y2MKhNqJQ': 'Gt3ZslnIkTyL3zhqR4ci',
	'dJxY5PFq41jgLmIcRYYR': 'NY8d1sQnDFLpWapXnpNS',
	'E5z5I12CNIpCjwA6TEod': 'mDqqNMIEawtxM86d2htL',
	'rZetd3Xux6QVDZ3v9j8N': '5ImLrCghJMKgMcxmSMsK',
	'MSWADQCdmRb3619axFvv': 'aKJFfzmyHWYH30NB6yTj',
	'zbA4GAOR2VK7bvuKCoAl': 'idKijrWSkXPGYlDebXVo',
	'4wB8gjGYiypcWkUtBg3g': 'EBCvshHZzkEbY6iaeKzG',
	'czfTz6fiEEtuWIDiiPDB': 'HTPMMwlLT29iCYtbgMvH',
	'IalkSlKBA03bWmnZ9ieK': 'xqh9F7NQ9aOEc1c2Ta74',
	'6Vy0DJCxq7ByZiTDb6jS': 'b0YT3ui0ju8lQj8K1pIr',
	'U3OY9lJehfmkjGoQGxgL': 'CTQSnzNZ41PCP08L4WMw',
	'9LIamCDDQfST5hJaUqP4': 'PGn5NoMT5bnwmUaA4k1O',
	'K5HtmSERWYkhwfVdIlGB': '1QyyUA8Q1rSvkIFFdhPc',
	'cTfhkGjjL8hs51XJcaR5': 'juyBpoiOZZpVJf2hleTb',
	'mIhtgiRsEWb2aqrtDm6m': 'kdQeKc5Zk5LiAVdUdoiI',
	'i0Eskhc1MZY3A7VJV3Jv': '5JRQReBtbN890Op23OVp',
	'zTdnAnR3U0L8Hr52sNi6': 'MOsA6NRu9LxJLPSqNooi',
	'skA7tE97wZLOZQCpe1qP': 'qTK0z2H9JnEx4hipHFEY',
	'c0SrWiqKLfE2DPaPT5Lm': 'PJ44h4LnvvaWY1EHzQkM',
	'63j0ej6BT1FQ18xTFR6p': 'QoYH2JEHYmHpeAj0CiJq'
}

curdir = os.path.dirname(os.path.realpath(__file__))
with open(os.path.join(curdir, 'add_test'), 'r') as f:
	expect_add = f.read()

with open(os.path.join(curdir, 'expect_append'), 'r') as f:
	expect_append = f.read()

with open(os.path.join(curdir, 'expect_append'), 'r') as f:
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
		check(self, expect_eval, prepend_dest)

	def test_eval(self):
		for fname in eval_map:
			expect_eval = eval_map[fname]
			fpath = os.join('/tmp', fname + '.txt')
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
