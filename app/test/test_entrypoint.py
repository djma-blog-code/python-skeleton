import os
from src.main import RetrievePets, AddPet
import unittest
import tempfile


class RetrievePetsTestCase(unittest.TestCase):
    # def setUp(self):
    # we still have no setup for this test

    # def tearDown(self):
    # So no teardown

    def test_retrieve_pets_valid_available_status(self):

        retrieve_pets_object = RetrievePets("available")
        response = retrieve_pets_object.retrieve_pets()

        assert type(response) is dict, "response was not a dictionary object"
        assert len(response) > 0, "response was empty"

    def test_retrieve_pets_valid_pending_status(self):

        retrieve_pets_object = RetrievePets("pending")
        response = retrieve_pets_object.retrieve_pets()

        assert type(response) is dict, "response was not a dictionary object"
        assert len(response) > 0, "response was empty"

    def test_retrieve_pets_valid_sold_status(self):

        retrieve_pets_object = RetrievePets("sold")
        response = retrieve_pets_object.retrieve_pets()

        assert type(response) is dict, "response was not a dictionary object"
        assert len(response) > 0, "response was empty"

    def test_retrieve_pets_invalid_status(self):

        retrieve_pets_object = RetrievePets("invalid status")
        response = retrieve_pets_object.retrieve_pets()

        assert type(response) is dict, "response was not a dictionary object"
        assert len(response) == 0, "Response was NOT empty"


if __name__ == "__main__":
    unittest.main()
