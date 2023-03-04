from arma3pbo.path.tools import tools
from arma3pbo.pbo.pbo_foot import PBOFoot
from arma3pbo.pbo.pbo_head import PBOHead


class PBO:
    @staticmethod
    def pack(path):
        bytes = bytearray()
        bytes.extend(PBOHead.head_start_bytecode)
        bytes.extend(b"\0")

        if len(PBOHead.get_prefixes(path)) > 0:
            for key, value in PBOHead.get_prefixes(path).items():
                bytes.extend(PBOHead.create_header_bytecode(key, value))
            bytes.extend(PBOHead.head_empty_entry)

        mission_files = tools.get_files_from_parent_path(path)

        for file in mission_files:
            bytes += PBOHead.create_bytecode_from_entry(PBOHead.header_entry_from_file(path, file))
        bytes.extend(PBOHead.head_empty_entry)

        for file in mission_files:
            with open(path + "/" + file, "rb") as f:
                bytes.extend(bytearray(f.read()))
        bytes.extend(b"\0")

        bytes.extend(PBOFoot.get_hash(bytes))

        return bytes

    @classmethod
    def write_bytecode_to_file(cls, path, bytes):
        with open(path, "wb") as f:
            f.write(bytes)

    @classmethod
    def build(cls, path, dest):
        cls.write_bytecode_to_file(dest, cls.pack(path))