import ctypes
import os
import unittest
import binascii

from arma3pbo.path.tools import tools
from arma3pbo.pbo.pbo_head import PBOHead


class PBOTest(unittest.TestCase):
  

  def test_create_head_bytecode(self):
    self.assertEqual(bytearray(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"), PBOHead.head_start_bytecode)

  def test_create_head_with_key_value_pair(self):
    key="prefix"
    value="SOMEMISSIONPREFIX"
    head = PBOHead.create_header_bytecode(key, value)

    expected_bytes = bytearray()
    expected_bytes.extend(key.encode("utf-8"))
    expected_bytes.extend(b"\0")
    expected_bytes.extend(value.encode("utf-8"))
    expected_bytes.extend(b"\0")

    self.assertEqual(expected_bytes, head)


  def test_create_bytecode_from_entry(self):
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/testfiles/testmission/KOTH.Altis"
    file_in_mission = "mission.sqm"
    entry = PBOHead.header_entry_from_file(base_path, file_in_mission)

    bytecode = PBOHead.create_bytecode_from_entry(entry)

    bytes_from_entry_fields=bytearray()
    bytes_from_entry_fields.extend(entry.filename.encode("utf-8"))
    bytes_from_entry_fields.extend(b"\0")
    bytes_from_entry_fields.extend(bytearray(entry.mimetype))
    bytes_from_entry_fields.extend(bytearray(entry.original_size))
    bytes_from_entry_fields.extend(bytearray(entry.reserved))
    bytes_from_entry_fields.extend(bytearray(entry.timestamp))
    bytes_from_entry_fields.extend(bytearray(entry.data_size))

    # + 1 because of the null byte at the end of the filename
    self.assertEqual(20 + 1, len(bytecode) - len(entry.filename.encode("utf-8"))) 
    self.assertEqual(bytes_from_entry_fields, bytecode)


  def test_create_header_file_entry_from_file(self):
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/testfiles/testmission/KOTH.Altis"
    expected_file_in_mission = "core/methods/fn_getAllTurretWeapons.sqf"
    expected_original_size = ctypes.c_uint32(os.path.getsize(base_path + "/" + expected_file_in_mission))
    expected_reserved = ctypes.c_uint32(0)
    expected_timestamp = ctypes.c_uint32(int(os.path.getmtime(base_path + "/" + expected_file_in_mission)))
    expected_data_size = expected_original_size
    exptected_mimetype = ctypes.c_uint32(0)

    entry = PBOHead.header_entry_from_file(base_path, expected_file_in_mission)

    self.assertEqual(tools.convert_to_winPath(expected_file_in_mission), entry.filename)
    self.assertEqual(bytearray(exptected_mimetype), bytearray(entry.mimetype))
    self.assertEqual(bytearray(expected_original_size), bytearray(entry.original_size))
    self.assertEqual(bytearray(expected_reserved), bytearray(entry.reserved))
    self.assertEqual(bytearray(expected_timestamp), bytearray(entry.timestamp))
    self.assertEqual(bytearray(expected_data_size), bytearray(entry.data_size))

  def test_create_empty_header_entry(self):
    bytes = PBOHead.head_empty_entry
    expected_bytes = bytearray([0 for i in range(21)])

    self.assertEqual(expected_bytes, bytes)


  def test_get_prefixes(self):
    mod_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/testfiles/testmod/duck.core"
    expected_prefixes = {"pboprefix": "duck.core"}
    prefixes = PBOHead.get_prefixes(mod_path)

    self.assertEqual(expected_prefixes, prefixes)



