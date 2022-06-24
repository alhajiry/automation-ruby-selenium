# Automation Ruby Selenium

### (Currently can only be run in Chrome and Mac OS)

### There are 2 branch available

1. Sandbox --> UI Automation on Sandbox-SSO

2. Selenium Playground --> UI Automation on Selenium Playground

**First Time Setup :**<br>

1. bundle init

2. bundle install

3. Download [chromedriver](https://chromedriver.chromium.org/) and put it on assets/driver/chromedriver, make sure the chromedriver you download match your current chrome browser version

**Notes**<br>

If assset folder not exist, please create it and put on the root of the project

**How To Run**<br>

    Cucumber features --tag @your-tag features/gherkin_file/your-feature-name.feature --format html --out report.html

**Current Scenario Available to Run**<br>

    @edit-company-info
