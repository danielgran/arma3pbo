class PBOBody:
    @staticmethod
    def get_file_bytecode(path):
        bytecode = bytearray()
        with open(path, "rb") as f:
            bytecode.extend(f.read())
        return bytecode