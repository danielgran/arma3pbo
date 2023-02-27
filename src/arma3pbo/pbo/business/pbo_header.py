import os
import ctypes

from arma3pbo.pbo.business.entity.header_entry import HeaderEntry


class PBOHeader:

    @staticmethod
    def create_head_bytecode(prefix=None):
        fixed = b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
        if prefix:
            return fixed + b"prefix" + b"\0" + prefix.encode("utf-8") + b"\0"
        else:
            return fixed

    @staticmethod
    def header_entry_from_file(base_path, file_path):
        complete_path = base_path + "/" + file_path

        return HeaderEntry(
            filename=file_path,
            mimetype=ctypes.c_uint32(0),
            original_size=ctypes.c_uint32(os.path.getsize(complete_path)),
            reserved=ctypes.c_uint32(0),
            timestamp=ctypes.c_uint32(int(os.path.getmtime(complete_path))),
            data_size=ctypes.c_uint32(int(os.path.getsize(complete_path)))
        )
    
    @staticmethod
    def create_bytecode_from_entry(entry: HeaderEntry):
        bytes_from_entry_fields=bytearray()
        bytes_from_entry_fields.extend(entry.filename.encode("utf-8"))
        bytes_from_entry_fields.extend(b"\0")
        bytes_from_entry_fields.extend(bytearray(entry.mimetype))
        bytes_from_entry_fields.extend(bytearray(entry.original_size))
        bytes_from_entry_fields.extend(bytearray(entry.reserved))
        bytes_from_entry_fields.extend(bytearray(entry.timestamp))
        bytes_from_entry_fields.extend(bytearray(entry.data_size))
        return bytes_from_entry_fields
    
