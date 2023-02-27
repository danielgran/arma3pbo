import unittest

from arma3pbo.pbo.business.entity.header_entry import HeaderEntry

class TestEntity(unittest.TestCase):
    def test_if_HeaderEntry_is_there(self):
        entity = HeaderEntry()
        assert entity

    def test_meta(self):
        entity = HeaderEntry()
        assert entity.filename == ""
        assert entity.mimetype == 0
        assert entity.original_size == 0
        assert entity.reserved == 0
        assert entity.timestamp == 0
        assert entity.data_size == 0