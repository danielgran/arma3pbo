import unittest
import hashlib

from arma3pbo.pbo.pbo_foot import PBOFoot


class MyTestCase(unittest.TestCase):
    def test_hash_bytecode(self):
        sample_bytecode = bytearray()
        sample_bytecode.extend(bytearray(b"test."))

        sha1 = hashlib.sha1()
        sha1.update(sample_bytecode)

        self.assertEqual(sha1.digest(), PBOFoot.get_hash(sample_bytecode))

