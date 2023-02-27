import hashlib


class PBOFoot:
    @staticmethod
    def get_hash(bytes):
        return hashlib.sha1(bytes).digest()