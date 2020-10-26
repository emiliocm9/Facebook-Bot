require 'selenium-webdriver'
System.setProperty('webdriver.gecko.driver', '/home/emilio/Facebook-Bot/geckodriver/')
driver = Selenium::WebDriver.for :firefox
url = 'https://www.google.com/'

driver.get(url)