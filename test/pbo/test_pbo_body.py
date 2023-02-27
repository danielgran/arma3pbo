import unittest
import os

from arma3pbo.pbo.pbo_body import PBOBody

class TestPBOBody(unittest.TestCase):
  
    def test_create_uncompressed_bytecode_from_mission_file(self):
      project_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
      path = project_dir + "/test/testfiles/testmod/duck.core/fn_postInit.sqf"

      expected_bytes_from_file=bytearray()
      with open(path, "rb") as f:
        expected_bytes_from_file.extend(f.read())
      
      self.assertEqual(expected_bytes_from_file, PBOBody.get_file_bytecode(path))
