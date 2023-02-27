import os
import unittest

from arma3pbo.pbo.business.pbo_header import PBOHeader


class TestPboHeader(unittest.TestCase):

    def test_create_header(self):
        self.assertEqual(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0prefix\0", PBOHeader.static_header)

    @unittest.skip("Not implemented yet")
    def test_create_entry_from_file(self):
        basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/test/testfiles/testmission/KOTH.Altis"
        file_in_mission = "core/methods/getAllTurretWeapons.sqf"

        entry = pbo.business.entry_from_project_file(basedir, file_in_mission)