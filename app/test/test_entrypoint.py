import os
from src.main import HelloWorld
import unittest
import tempfile


class HelloWorldTestCase(unittest.TestCase):
    # def setUp(self):

    # self.app = flaskr.app.test_client()

    # def tearDown(self):

    def test1(self):
        hello_world = HelloWorld()
        response = hello_world.hello_world()

        assert response == "Hello World!"


if __name__ == "__main__":
    unittest.main()
