#!/usr/bin/env python
"""
Hello World app to print "Hello World!" to the console
"""
import fire


class HelloWorld:
    def hello_world(self):
        """
        Says Hello World when invoked


        Attributes:

        Returns:
            str: response string
        """

        return "Hello World!"


if __name__ == "__main__":
    fire.Fire()
