Then (/^User login to "([^"]*)" and navigate to "([^"]*)" with account "([^"]*)"$/) do |url, element, account|
begin
    steps %Q{
        Given User go to url "#{url}"
        When User login with account "#{account}"
        And User click "#{element}"
    }
    end
end
