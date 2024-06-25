from selenium import webdriver
import unittest
from selenium.webdriver.common.keys import Keys  # this emulates keyboard actions and key combination
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options


class PythonProject(unittest.TestCase):

    # initialization of webdriver
    def setUp(self):
        self.options = webdriver.ChromeOptions()
        self.options.binary_location = '/usr/bin/google-chrome'
        self.options.add_argument("--headless")
        self.driver = webdriver.Chrome(options=self.options)
        self.driver.get(url="http://127.0.0.1:5080")

    # Test case method. It should always start with test_
    def test_app_positive_input(self):

        search_bar = self.driver.find_element(By.NAME, "location")

        search_bar.send_keys("london")
        search_bar.send_keys(Keys.ENTER)

        assert self.driver.title == "Result"

    def test_app_negative_input(self):

        search_bar = self.driver.find_element(By.NAME, "location")

        search_bar.send_keys("asdfasdfasdf")
        search_bar.send_keys(Keys.ENTER)

        assert self.driver.title == "Home Page"

    def tearDown(self):
        self.driver.close()
