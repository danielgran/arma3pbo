import unittest

from src.path.tools import tools


class TestPathTools(unittest.TestCase):
    def test_convert_to_winPath(self):
        sample_path = "C:/Users/username/Documents/Arma 3 - Other Profiles/username/mods/@my_mod/addons/my_mod"
        expected_winPath = "C:\\Users\\username\\Documents\\Arma 3 - Other Profiles\\username\\mods\\@my_mod\\addons\\my_mod"
        self.assertEqual(expected_winPath, tools.convert_to_winPath(sample_path))
        self.assertEqual(expected_winPath, tools.convert_to_winPath(expected_winPath))

    def test_convert_to_linuxPath(self):
        sample_path = "C:\\Users\\username\\Documents\\Arma 3 - Other Profiles\\username\\mods\\@my_mod\\addons\\my_mod"
        expected_linuxPath = "C:/Users/username/Documents/Arma 3 - Other Profiles/username/mods/@my_mod/addons/my_mod"
        self.assertEqual(expected_linuxPath, tools.convert_to_linuxPath(sample_path))
        self.assertEqual(expected_linuxPath, tools.convert_to_linuxPath(expected_linuxPath))
