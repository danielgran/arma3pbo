import os
import unittest

from src.pbo.pbo import pbo


class PBOTest(unittest.TestCase):

    def test_create_header(self):
        self.assertEqual(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0prefix\0", pbo.static_header)

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
        bytes.extend(pbo.static_header)
        bytes.extend()



    def test_pack_mod_pbo_to_bytecode(self):
        path_to_mod = "test/testfiles/testmod/duck.core"
        pass





