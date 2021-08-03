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
        steps %Q{
            And User fill "mekari_username_field" with "#{login_data[0]}"
            And User fill "mekari_password_field" with "#{login_data[1]}"
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
        raise e
    end
end

When (/^User fill "([^"]*)" with "([^"]*)"$/) do |element, data|
    begin
        element_hash = mapper.key_element_processor(element)
        data_hash = mapper.test_data_hash[data]

        click_element(element_hash[0], element_hash[1])

        user_fill(element_hash[0], element_hash[1], data)
    
    rescue StandardError => e
        raise e.message
      end
end

When (/^User fill "([^"]*)" with random (word|phone|email) data$/) do |element, cond|
begin
    element_hash = mapper.key_element_processor(element)
    data = ''

    case cond
        when "word"
            base_word = 'testuser'
            rand_generator = SecureRandom.random_number(5)
            rand_string = rand_generator.to_s
            data = base_word + rand_string
        when "phone"
            base_number = '62'
            rand_generator = SecureRandom.random_number(10)
            rand_string = rand_generator.to_s
            data = base_number + rand_string
        when "email"
            base_email = 'jurnaltest'
            base_domain = '@mailinator.com'
            rand_generator = SecureRandom.random_number(4)
            rand_string = rand_generator.to_s
            data = base_email + rand_string + base_domain
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

        checker = element_displayed_checker(element_hash[0], element_hash[1], 10)
        
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


        
