@selenium-playground
Feature: Test Sandbox

    @all-test-case
    Scenario: Selenium Playground
        #Retrieve and input page title
        Given User go to url "playground"
        When User save value from "page_title"
        Then User fill the "answer_box_title_page" form with saved value
        # Fill out name section of form to be Kilgore Trout
        Then User fill "name_form" with text "name"
        #Set occupation on form to Sci-Fi Author
        Then User select dropdown menu "occupation_dropdown" with "Science Fiction Author"
        #Count number of blue_boxes on page after form and enter into answer box #4
        When User count elements "bluebox"
        Then User fill the "answer_box_bluebox" form with saved value
        #Click link that says 'click me'
        Then User click element with "txt_button_click_me" text
        #Find red box on its page find class applied to it, and enter into answer box #6
        When User save element "redbox" "class" attribute
        Then User fill the "answer_box_redbox" form with saved value







