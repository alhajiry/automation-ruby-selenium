# Automation Ruby Selenium

## There are 2 branch available

1. Sandbox --> UI Automation on Sandbox-SSO
2. Selenium Playground --> UI Automation on Selenium Playground

## (Currently can only be run in Chrome and Mac OS)

**To run :**<br>

1. bundle init
2. bundle install
3. Download chromedriver and put it on assets/driver/chromedriver, make sure the chromedriver you download match your current chrome browser version
4. Cucumber features --tag @your-tag features/gherkin_file/your-feature-name.feature --format html --out report.html

_Notes_<br>
If assset folder not exist, please create it and put on the root of the project

**Runner Example**<br>
Cucumber features --tag @your-tag features/gherkin_file/your-feature-name.feature --format html --out report.html

**Current Scenario Available to Run**<br>
Please switch to each branch
