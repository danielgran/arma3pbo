import os


class tools:
    @staticmethod
    def convert_to_winPath(path):
        return path.replace("/", "\\")

    @staticmethod
    def convert_to_linuxPath(path):
        return path.replace("\\", "/").rstrip("/")

    @staticmethod
    def correct_path(path):
        output_path = tools.convert_to_linuxPath(path)
        output_path = output_path.rstrip("/")
        # remove doubles or more
        for i in range(len(output_path)):
            if i < len(output_path) and output_path[i] == "/":
                while output_path[i + 1] == "/":
                    output_path = output_path[:i] + output_path[i + 1:]
        return output_path

    def get_files_from_parent_path(parent_path):
        parent_path = tools.correct_path(parent_path)

        files = []
        for (dirpath, dirnames, filenames) in os.walk(parent_path):
            for filename in filenames:
                full_path = dirpath + "/" + filename
                files.append(full_path)

        files = [file[len(parent_path)+1:] for file in files]
        return files