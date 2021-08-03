require 'rspec/expectations'



def user_find(selector, element, timeout = 30)
  begin
    
      wait = Selenium::WebDriver::Wait.new(:timeout => timeout)

      if selector == 'id'
          element_path = wait.until {$driver.find_element(:id, element)}
      elsif selector == 'name'
          element_path = wait.until {$driver.find_element(:name, element)}
      elsif selector == 'xpath'
          element_path = wait.until {$driver.find_element(:xpath, element)}
      elsif selector == 'class'
          element_path = wait.until {$driver.find_element(:class, element)}
      elsif selector == 'data-testid'
          selector_data = "//*[@data-testid='#{element_path}']"
          element_path = wait.until {$driver.find_element(:xpath, selector_data)}
      end

  rescue StandardError => e
      raise e.message
  end

  return element_path  

end

def wait_for_element_clickable (selector, element, timeout = 30)
    begin
      wait = Selenium::WebDriver::Wait.new(timeout => timeout)
      element = wait.until {user_find(selector, element)}
      wait.until{ element.displayed? }
      wait.until{ element.enabled? }
    rescue StandardError => e
        raise e.message
    end

    return element
end

def click_element(selector, element)
    begin
      web_element = wait_for_element_clickable(selector, element)

      web_element.click
    rescue StandardError => e
        raise e.message
    end
end


def user_fill(selector, element, data)
  begin
    web_element = user_find(selector, element)

    web_element.clear
    web_element.send_keys(data)
  
  rescue StandardError => e
    raise e.message
  end
end

def element_displayed_checker(selector, element, timeout = 15) 
    is_displayed = false
    
    begin

    if user_find(selector, element, timeout) != nil
      is_displayed = true
    end
  
  rescue StandardError => e
    is_displayed = false
  end
  
  return is_displayed

end

def element_not_displayed_checker(selector, element, timeout = 15)
  !element_displayed_checker(selector, element, timeout)
end
