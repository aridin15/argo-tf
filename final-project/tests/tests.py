import unittest
import requests

url = "http://127.0.0.1:5080"

def test_connection():
    assert requests.options(url).ok

