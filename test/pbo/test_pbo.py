import unittest
import os

from arma3pbo.pbo.pbo import PBO


class TestPBO(unittest.TestCase):
    def test_is_there(self):
        self.assertTrue(PBO)

    def test_pbo_gen_bytecode(self):
        self.assertTrue(True)
        absolute_project_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        path_to_mission = absolute_project_path + "/testfiles/testmission/KOTH.Altis"
        path_to_pbo = path_to_mission + ".pbo"
        with open(path_to_pbo, "rb") as f:
            expected_bytecode_from_file = bytearray(f.read())
        bytecode_pbo = PBO.pack(path_to_mission)

        print(len(expected_bytecode_from_file))
        print(len(bytecode_pbo))

        self.assertEqual(len(expected_bytecode_from_file), len(bytecode_pbo))
