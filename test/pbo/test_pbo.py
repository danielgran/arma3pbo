import unittest
import os

from arma3pbo.pbo.pbo import PBO

class TestPBO(unittest.TestCase):
    def test_is_there(self):
        self.assertTrue(PBO)

    def test_pbo_gen_bytecode(self):
        self.assertTrue(True)
        absolute_project_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        path_to_mission = absolute_project_path + "/test/testfiles/testmission/KOTH.Altis"
        all_files_in_folder_and_subfolders = []
        for root, dirs, files in os.walk(path_to_mission):
            for file in files:
                all_files_in_folder_and_subfolders.append(os.path.join(root, file))
        # strip all files to relative path and remove beginning slash
        all_files_in_folder_and_subfolders = [file.replace(path_to_mission, "") for file in
                                              all_files_in_folder_and_subfolders]
        all_files_in_folder_and_subfolders = [file.lstrip("/") for file in all_files_in_folder_and_subfolders]

         a=1