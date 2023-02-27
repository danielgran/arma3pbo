class HeaderEntry:
    def __init__(self, filename="", mimetype=0, original_size=0, reserved=0, timestamp=0, data_size=0):
        self.filename = filename
        self.mimetype = mimetype
        self.original_size = original_size
        self.reserved = reserved
        self.timestamp = timestamp
        self.data_size = data_size
