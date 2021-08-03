require_relative '../../mapping/mapper'
require_relative '../helpers/helpers'
require 'selenium-webdriver'
require 'securerandom'

mapper = Mapper.new()

Given (/^User go to url "([^"]*)"$/) do |url|
    begin
        homepage = mapper.test_data_hash[url]
        ENV['URL'] = homepage
        LocalDriver.start_driver

    rescue StandardError => e
        raise e.message
    end
end

Given (/^User login to mekari journal with "([^"]*)"$/) do |data|
    begin

        login_data = mapper.key_processor_login(data)
        
        username_field = mapper.key_element_processor('mekari_username_field')
        password_field = mapper.key_element_processor('mekari_password_field')


        user_fill(username_field[0], username_field[1], login_data[0])
        user_fill(password_field[0], password_field[1], login_data[1])

        steps %Q{
            And User click "mekari_jurnal_login_button"
        }

    rescue StandardError => e
        raise e.message
    end
end


When (/^User click "([^"]*)"$/) do |element|
    begin
        element_hash = mapper.key_element_processor(element)

        click_element(element_hash[0], element_hash[1])

    rescue StandardError => e
        raise e.message
    end
end

When (/^User fill "([^"]*)" with (text|image) "([^"]*)"$/) do |element, type, data|
    begin
        element_hash = mapper.key_element_processor(element)

        if(type == 'image')
            dir = ENV['PROJECT_DIR']
            dir = dir + '/assets/images/' + data
            # click_element(element_hash[0], element_hash[1])
            set_value = user_find(element_hash[0], element_hash[1])
            set_value.send_keys(dir)
        elsif (type == 'text')
            data_hash = mapper.test_data_hash[data]
            click_element(element_hash[0], element_hash[1])
            user_fill(element_hash[0], element_hash[1], data_hash)
        else
            raise "invalid data type"
        end
    
    rescue StandardError => e
        raise e.message
    end
end

When (/^User fill "([^"]*)" with random (word|phone|email|SKU) data$/) do |element, cond|
    begin
        element_hash = mapper.key_element_processor(element)
        data = ''

        case cond
            when "word"
                base_word = 'testuser'
                limiter = 10**3
                rand_generator = SecureRandom.random_number(limiter)
                rand_string = rand_generator.to_s
                data = base_word + rand_string
            when "phone"
                base_number = '62'
                limiter = 10**10
                rand_generator = SecureRandom.random_number(limiter)
                rand_string = rand_generator.to_s
                data = base_number + rand_string
            when "email"
                limiter = 10**4
                base_email = 'jurnaltest'
                base_domain = '@mailinator.com'
                rand_generator = SecureRandom.random_number(limiter)
                rand_string = rand_generator.to_s
                data = base_email + rand_string + base_domain
            when "SKU"
                limiter = 10**4
                base_sku = 'SKU'
                rand_generator = SecureRandom.random_number(limiter)
                rand_string = rand_generator.to_s
                data = base_sku + rand_string
            else
                raise "Unknown conditions, only word, phone and email are allowed"
        end
    
        click_element(element_hash[0], element_hash[1])
        user_fill(element_hash[0], element_hash[1], data)

    rescue StandardError => e
        raise e.message
    end
end

Then (/^User check and click "([^"]*)" if exist$/) do |element|
    begin
        element_hash = mapper.key_element_processor(element)

        checker = element_displayed_checker(element_hash[0], element_hash[1], 5)
        
        if checker
            click_element(element_hash[0], element_hash[1])
        else 
            log "#{element} not exist"
        end

    rescue StandardError => e
        raise e.message
    end
end

Then (/^User select dropdown (button|input) "([^"]*)" with data "([^"]*)"$/) do |cond, element, data|
    begin
        element_hash = mapper.key_element_processor(element)
        data_hash = mapper.test_data_hash[data]

        click_element(element_hash[0], element_hash[1])
        
        if (cond == 'button')
            click_element('xpath', "//*[@class='dropdown-item' and text()='#{data_hash}']")
        elsif (cond == 'input')
            click_element('xpath', "//ul[@class='multiselect__content']/li/span/span[contains(text(), '#{data_hash}')]")
        else 
            raise 'invalid condition'
        end

    rescue StandardError => e
        raise e.message
    end  
end

When (/^User pick a date "([^"]*)" in "([^"]*)" calendar$/) do |data, element|
    begin
        element_hash = mapper.key_element_processor(element)
        data_hash = mapper.test_data_hash[data]

        date_list = data_hash.split('/')
        date_day = date_list[0]
        date_month = date_list[1]
        date_year = date_list[2]

        case date_month
            when "01"
                date_month = "Jan"
            when "02"
                date_month = "Feb"
            when "03"
                date_month = "Mar"
            when "04"
                date_month = "Apr "
            when "05"
                date_month = "May"
            when "06"
                date_month = "Jun"
            when "07"
                date_month = "Jul"
            when "08"
                date_month = "Aug"
            when "09"
                date_month = "Sep"
            when "10"
                date_month = "Oct"
            when "11"
                date_month = "Nov"
            when "12"
                date_month = "Dec"
            else
                raise 'wrong month'
        end

        click_element(element_hash[0], element_hash[1]) #click calendar input

        click_element('class', 'date-picker-header-title') #click year picker
        click_element('class', 'date-picker-header-title') #click year picker

        # date_month = date_month.slice(0, 3) #make the month to be 3 letter (january = jan)

        # puts "#{date_year}"
        click_element('xpath', "//div[@class='date-picker-cell']/div[text()=' #{date_year} ']") #Select year
        puts "#{date_month}"
        click_element('xpath', "//div[@class='date-picker-cell']/div[text()=' #{date_month} ']") #Select month
        
        if(date_day[0] == "0") ##sanitize the day (if 01 make it 1 to match the selector)
            date_day = date_day[1]
        end

        # puts "#{date_day}"


        click_element('xpath', "//div[@data-date='#{date_day}']")

    rescue StandardError => e
        raise e.message
    end
end

Then(/^"([^"]*)" will (be|not) displayed$/) do |element, cond|
    begin
  
      element_hash = mapper.key_element_processor(element)
  
      case cond
        when "be"
          if(element_displayed_checker(element_hash[0],element_hash[1], 5))
            log "'#{element}' displayed"
          else
            raise "'#{element}' not displayed"
          end
        when "not"
          if(element_not_displayed_checker(element_hash[0],element_hash[1], 5))
            raise "'#{element}' displayed"
          else
            log "'#{element}' not displayed"
          end
        else
          raise "Unrecognized conditions . . .!"
      end
  
    rescue StandardError => e
      raise e.message
    end
  end

When(/^User wait (\d+) seconds$/) do |seconds|
    begin
        seconds = seconds.to_i
        sleep(seconds)
    
    rescue StandardError => e
        raise e.message
      end
    end

Then(/^"([^"]*)" (.*) will be equal to "([^"]*)"$/) do |element, attribute, data|
    begin
      element_hash = mapper.key_element_processor(element)
      data_comparison = mapper.test_data_hash[data]

      element_value = user_get_value(element_hash[0], element_hash[1], attribute)

      if !(data_comparison == element_value)
         raise "#{element_value} not match with #{data_comparison}"
      end

      puts "#{element_value} match #{data_comparison}"

    rescue StandardError => e
        raise e.message
      end
    end