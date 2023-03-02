import os


class tools:
    @staticmethod
    def convert_to_winPath(path):
        return path.replace("/", "\\")

    def convert_to_linuxPath(path):
        output_path = path.replace("\\", "/")
        output_path = output_path.rstrip("/")
        return output_path

    def get_files_from_parent_path(parent_path):

        files = []
        for root, dirs, filenames in os.walk(parent_path):
            for filename in filenames:
                files.append(os.path.join(root, filename).replace("\\", "/"))

        files = [file[len(parent_path):] for file in files]

        return files