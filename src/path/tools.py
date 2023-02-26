class tools:
    @staticmethod
    def convert_to_winPath(path):
        return path.replace("/", "\\")

    def convert_to_linuxPath(path):
        return path.replace("\\", "/")