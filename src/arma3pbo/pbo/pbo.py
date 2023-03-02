from arma3pbo.path.tools import tools
from arma3pbo.pbo.pbo_foot import PBOFoot
from arma3pbo.pbo.pbo_head import PBOHead


class PBO:
    @staticmethod
    def pack(path):
        bytes = bytearray()
        bytes.extend(PBOHead.head_start_bytecode)

        for key, value in PBOHead.get_prefixes(path).items():
            bytes.extend(PBOHead.create_header_bytecode(key, value))
        bytes.extend(PBOHead.head_empty_entry)

        mission_files = tools.get_files_from_parent_path(path)
        for file in mission_files:
            bytes += PBOHead.create_bytecode_from_entry(PBOHead.header_entry_from_file(path, file))
        bytes.extend(b"\0")

        for file in mission_files:
            with open(path + "/" + file, "rb") as f:
                bytes.extend(bytearray(f.read()))
        bytes.extend(b"\0")

        bytes.extend(PBOFoot.get_hash(bytes))

        return bytes
