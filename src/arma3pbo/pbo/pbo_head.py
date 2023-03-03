import os
import ctypes

from arma3pbo.path.tools import tools
from arma3pbo.pbo.entity.header_entry import HeaderEntry


class PBOHead:
    head_start_bytecode = bytearray(b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0")
    head_empty_entry = bytearray(b"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0")

    @staticmethod
    def create_header_bytecode(key, value):
        bytes_from_entry_fields = bytearray()
        bytes_from_entry_fields.extend(key.encode("utf-8"))
        bytes_from_entry_fields.extend(b"\0")
        bytes_from_entry_fields.extend(value.encode("utf-8"))
        bytes_from_entry_fields.extend(b"\0")
        return bytes_from_entry_fields

    @staticmethod
    def header_entry_from_file(base_path, file_path):
        complete_path = base_path + "/" + file_path

        return HeaderEntry(
            filename=tools.convert_to_winPath(file_path),
            mimetype=ctypes.c_uint32(0),
            original_size=ctypes.c_uint32(os.path.getsize(complete_path)),
            reserved=ctypes.c_uint32(0),
            timestamp=ctypes.c_uint32(int(os.path.getmtime(complete_path))),
            data_size=ctypes.c_uint32(int(os.path.getsize(complete_path)))
        )

    @staticmethod
    def create_bytecode_from_entry(entry: HeaderEntry):
        bytes_from_entry_fields = bytearray()
        bytes_from_entry_fields.extend(entry.filename.encode("utf-8"))
        bytes_from_entry_fields.extend(b"\0")
        bytes_from_entry_fields.extend(bytearray(entry.mimetype))
        bytes_from_entry_fields.extend(bytearray(entry.original_size))
        bytes_from_entry_fields.extend(bytearray(entry.reserved))
        bytes_from_entry_fields.extend(bytearray(entry.timestamp))
        bytes_from_entry_fields.extend(bytearray(entry.data_size))
        return bytes_from_entry_fields

    @classmethod
    def get_prefixes(cls, mod_path: str):
        prefixes = {}
        for filename in os.listdir(mod_path):
            if filename.startswith("$") and filename.endswith("$") and len(filename) > 2:
                prefixes[filename.lower().lstrip("$").rstrip("$")] = open(mod_path + "/" + filename, "r").read()
        return prefixes
