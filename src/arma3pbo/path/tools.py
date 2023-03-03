import os
import glob

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

    @staticmethod
    def get_files_from_parent_path(parent_path):

        files = []
        folders = []
        for x in os.walk(parent_path, topdown=True):
            folders.append(x[0])

        for folder in sorted(folders):
            subfiles = []
            for file in glob.glob(folder + "/*"):
                if os.path.isfile(file):
                    subfiles.append(file)
            for subfile in sorted(subfiles):
                files.append(subfile)

        files = [f[len(parent_path)+1:] for f in files]

        return files
