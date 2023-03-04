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

        # write bytecode to file
        with open(absolute_project_path + "/testfiles/testmission/KOTH.Altis.pbo.test", "wb") as f:
            f.write(bytecode_pbo)

        self.assertEqual(len(expected_bytecode_from_file), len(bytecode_pbo))

    def test_write_bytecode_to_file(self):
        bytes = bytearray([0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F])
        path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))) + "/dest/test.pbo"

        PBO.write_bytecode_to_file(path, bytes)


        with open(path, "rb") as f:
            read_bytes = bytearray(f.read())

        self.assertEqual(bytes, read_bytes)
        os.remove(path)

    def test_pack_pbo(self):
        absolute_project_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        path_to_mission = absolute_project_path + "/testfiles/testmission/KOTH.Altis"
        path_to_pbo = path_to_mission + ".pbo"
        PBO.build(path_to_mission, path_to_pbo)
        self.assertTrue(os.path.isfile(path_to_pbo))
        os.remove(path_to_pbo)