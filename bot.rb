require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox
url = 'https://www.facebook.com/'

driver.get(url)
email = 'yourname@email.com'
password = 'yourpassword '
groups = ['https://www.facebook.com/groups/275366519230814', 'https://www.facebook.com/groups/rordevelopers', 'https://www.facebook.com/groups/javascript.morioh']
text = 'write the content of your posts here'

def login(email, password, driver)
  email_element = driver.find_element(xpath: '//*[@id="email"]')
  password_element = driver.find_element(xpath: '//*[@id="pass"]')
  email_element.clear()
  email_element.send_keys(email)
  password_element.send_keys(password)
  password_element.submit
  sleep(5)
end

def openGroups(groups, driver, text)
  groups.each do | group |
    driver.get(group)
    sleep(3)
    field = driver.find_element(xpath: '//span[contains(text(),"What\'s on your mind")]')
    WriteAndPost(field, text, driver)
  end
end

def WriteAndPost(field, text, driver)
  begin
    field.click
    sleep(3)
    driver.action.send_keys(text).perform
    sleep(2)
    driver.find_element(xpath: '/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/form[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/div[1]').click
  rescue 
    sleep(2)
  end 
end

login(email, password, driver)
openGroups(groups, driver, text)
