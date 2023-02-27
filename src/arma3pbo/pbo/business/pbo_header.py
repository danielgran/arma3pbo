import os
import ctypes

from arma3pbo.pbo.business.entity.header_entry import HeaderEntry
class PBOHeader:
    static_header = b"\0sreV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0prefix\0"

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