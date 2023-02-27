import os
import unittest
import binascii

from arma3pbo.pbo.business.pbo_header import PBOHeader


class PBOTest(unittest.TestCase):
  
  def test_create_header_without_prefix(self):
     head = PBOHeader.create_head_bytecode()
     self.assertEqual(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", head)

  def test_create_header_with_prefix(self):
    prefix="SOMEMISSIONPREFIX"
    head = PBOHeader.create_head_bytecode(prefix)
    self.assertEqual(head, b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0prefix\0" + prefix.encode("utf-8") + b"\0")



  def test_create_bytecode_from_entry(self):
    base_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/test/testfiles/testmission/KOTH.Altis"
    file_in_mission = "mission.sqm"
    entry = PBOHeader.header_entry_from_file(base_path, file_in_mission)

    bytecode = PBOHeader.create_bytecode_from_entry(entry)

    bytes_from_entry_fields=bytearray()
    bytes_from_entry_fields.extend(entry.filename.encode("utf-8"))
    bytes_from_entry_fields.extend(b"\0")
    bytes_from_entry_fields.extend(bytearray(entry.mimetype))
    bytes_from_entry_fields.extend(bytearray(entry.original_size))
    bytes_from_entry_fields.extend(bytearray(entry.reserved))
    bytes_from_entry_fields.extend(bytearray(entry.timestamp))
    bytes_from_entry_fields.extend(bytearray(entry.data_size))

    code = binascii.hexlify(bytecode)

    # + 1 because of the null byte at the end of the filename
    self.assertEqual(20 + 1, len(bytecode) - len(entry.filename.encode("utf-8"))) 
    self.assertEqual(bytes_from_entry_fields, bytecode)


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
