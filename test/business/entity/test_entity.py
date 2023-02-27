import unittest

from arma3pbo.pbo.business.entity.header_entry import HeaderEntry

class TestEntity(unittest.TestCase):
    def test_if_HeaderEntry_is_there(self):
        entity = HeaderEntry()
        assert entity