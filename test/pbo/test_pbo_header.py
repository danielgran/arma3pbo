import ctypes
import os
import unittest

from arma3pbo.pbo.business.pbo_header import PBOHeader


class TestPboHeader(unittest.TestCase):

  def test_create_header(self):
    self.assertEqual(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0prefix\0", PBOHeader.static_header)

  def test_create_entry_from_file(self):
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/testfiles/testmission/KOTH.Altis"
    file_in_mission = "core/methods/fn_getAllTurretWeapons.sqf"
    expected_original_size = ctypes.c_uint32(os.path.getsize(base_path + "/" + file_in_mission))
    expected_reserved = ctypes.c_uint32(0)
    expected_timestamp = ctypes.c_uint32(int(os.path.getmtime(base_path + "/" + file_in_mission)))
    expected_data_size = expected_original_size
    exptected_mimetype = ctypes.c_uint32(0)


    entry = PBOHeader.header_entry_from_file(base_path, file_in_mission)


    self.assertEqual(file_in_mission, entry.filename)
    self.assertEqual(bytearray(exptected_mimetype), bytearray(entry.mimetype))
    self.assertEqual(bytearray(expected_original_size), bytearray(entry.original_size))
    self.assertEqual(bytearray(expected_reserved), bytearray(entry.reserved))
    self.assertEqual(bytearray(expected_timestamp), bytearray(entry.timestamp))
    self.assertEqual(bytearray(expected_data_size), bytearray(entry.data_size))