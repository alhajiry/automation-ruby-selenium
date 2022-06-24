@selenium-playground
Feature: Test Sandbox

    @all-test-case
    Scenario: Selenium Playground
        # 01 Retrieve and input page title
        Given User go to url "playground"
        When User retrieve page title
        Then User fill the "answer_box_title_page" form with saved value
        # 02 Fill out name section of form to be Kilgore Trout
        Then User fill "name_form" with text "name"
        # 03 Set occupation on form to Sci-Fi Author
        Then User select dropdown menu "occupation_dropdown" with "Science Fiction Author"
        # 04 Count number of blue_boxes on page after form and enter into answer box #4
        When User count elements "bluebox"
        Then User fill the "answer_box_bluebox" form with saved value
        # 05 Click link that says 'click me'
        Then User click element with "txt_button_click_me" text
        # 06 Find red box on its page find class applied to it, and enter into answer box #6
        When User save element "redbox" "class" attribute
        Then User fill the "answer_box_redbox" form with saved value
        # 07 Run JavaScript function as: ran_this_js_function() from your Selenium script
        When User execute javascript command "ran_this_js_function();"
        # 08 Run JavaScript function as: got_return_from_js_function() from your Selenium script, take returned value and place it in answer slot #8
        When User execute javascript command "return got_return_from_js_function();"
        Then User fill the "answer_box_js_script" form with saved value
        # 09 Mark radio button on form for written book? to Yes
        When User click "radio_btn_wrotebook"
        # 10 Get the text from the Red Box and place it in answer slot #10
        When User save value from "redbox"
        Then User fill the "answer_box_redbox_value" form with saved value
        # 11 Which box is on top? orange or green
        When User save element "first_box" "style" attribute
        Then User fill the "answer_box_is_on_top" form with saved value
        # 12 Set browser width to 850 and heigth to 650
        When User set window size to x:850 y:650
        # 13 Type into answer slot 13 yes or no depending on whether item by id of ishere is on the page
        When User check "item_ishere" is exist and fill "answer_box_item_by_id"
        # 14 Type into answer slot 14 yes or no depending on whether item with id of purplebox is visible
        When User check "purplebox" is visible and fill "answer_box_purplebox_exist"
        # 15 Waiting game: click the link with link text of 'click then wait' a random wait will occur (up to 10 seconds)
        When User click element with "txt_button_click_then_wait" text
        And User click "txt_button_click_after_wait"
        # Scenario 16 : Click OK on the confirm after completing task 15
        And User accept alert
        # Scenario 17 : Then user click Submit button
        And User click "submit_button"
        # Scenario 18 (Additional) : Check no success message displayed
        And User click "check_result_btn"
        Then Verify element with "passed_all_test" text will displayed






