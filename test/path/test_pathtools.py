import unittest
import os

from arma3pbo.path.tools import tools


class TestPathTools(unittest.TestCase):
    def test_convert_to_winPath(self):
        sample_path = "C:/Users/username/Documents/Arma 3 - Other Profiles/username/mods/@my_mod/addons/my_mod"
        expected_winPath = "C:\\Users\\username\\Documents\\Arma 3 - Other Profiles\\username\\mods\\@my_mod\\addons\\my_mod"
        self.assertEqual(expected_winPath, tools.convert_to_winPath(sample_path))
        self.assertEqual(expected_winPath, tools.convert_to_winPath(expected_winPath))


    def test_convert_to_linuxPath(self):
        sample_path = "C:\\Users\\username\\Documents\\Arma 3 - Other Profiles\\username\\mods\\@my_mod\\addons\\my_mod///"
        expected_linuxPath = "C:/Users/username/Documents/Arma 3 - Other Profiles/username/mods/@my_mod/addons/my_mod"
        self.assertEqual(expected_linuxPath, tools.convert_to_linuxPath(sample_path))
        self.assertEqual(expected_linuxPath, tools.convert_to_linuxPath(expected_linuxPath))


    def test_correct_path(self):
        sample_path = "C:\\//Users\\username\\Documents\\////Arma 3 - Other Profiles\\username\//\mods\\@my_mod\\addons\\my_mod/"
        expected_path = "C:/Users/username/Documents/Arma 3 - Other Profiles/username/mods/@my_mod/addons/my_mod"

        self.assertEqual(expected_path, tools.correct_path(sample_path))

    def test_get_all_files_in_path(self):
        project_path = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        parent_path = project_path + "/test/testfiles/treetest"

        expected_files = [
            "Amanda.txt",
            "Martin.txt",
            "asdf/bgx.txt",
            "asdf/a/filename.png",
            "foo/bar.xlsx"
            ]
        actual_files = tools.get_files_from_parent_path(parent_path)

        self.assertEqual(expected_files, actual_files)