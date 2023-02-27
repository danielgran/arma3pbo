import os
import unittest

from arma3pbo.pbo.business.entity.header_entry import HeaderEntry

class PBOTest(unittest.TestCase):

    @unittest.skip("Not implemented yet")
    def test_create_bytecode_from_entry(self):
        filename = "mission.sqm"
        mimetype = 0x56657273
        original_size = 0x0000000C
        reserved = 0x00000000
        timestamp = 0x00000000
        data_size = 0x0000000C
        data = b"testtesttest"

        expected_bytecode = bytearray()
        expected_bytecode.extend(filename.encode("utf-8") + b"\0")


        byteorder='little'

        expected_bytecode.extend(mimetype.to_bytes(4, byteorder))
        expected_bytecode.extend(original_size.to_bytes(4, byteorder))
        expected_bytecode.extend(reserved.to_bytes(4, byteorder))
        expected_bytecode.extend(timestamp.to_bytes(4, byteorder))
        expected_bytecode.extend(data_size.to_bytes(4, byteorder))

        a=1


        self.assertEquals(expected_bytecode, pbo.create_bytecode_from_entry(filename, mimetype, original_size, reserved, timestamp, data_size, data))


    @unittest.skip("Not implemented yet")
    def test_pack_mission_pbo_bytecode(self):
        self.assertTrue(True)
        absolute_project_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        path_to_mission = absolute_project_path + "/test/testfiles/testmission/KOTH.Altis"

        all_files_in_folder_and_subfolders = []
        for root, dirs, files in os.walk(path_to_mission):
            for file in files:
                all_files_in_folder_and_subfolders.append(os.path.join(root, file))

        # strip all files to relative path and remove beginning slash
        all_files_in_folder_and_subfolders = [file.replace(path_to_mission, "") for file in all_files_in_folder_and_subfolders]
        all_files_in_folder_and_subfolders = [file.lstrip("/") for file in all_files_in_folder_and_subfolders]

        bytes = bytearray()
        bytes.extend()
        bytes.extend()



    def test_pack_mod_pbo_to_bytecode(self):
        path_to_mod = "test/testfiles/testmod/duck.core"
        pass





